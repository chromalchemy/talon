"""Basilisp bootstrap for Talon.

Initializes the Basilisp runtime once (basilisp.main.init() is idempotent,
guarded by a lock upstream) and starts an nREPL server inside the Talon
process for live, REPL-first development.

Design notes (v2 — lessons from the old `basilisp` branch):
- Scoped .lpy watcher, not a global one. The old branch watched the entire
  user dir, accumulated duplicate registrations on every Talon reload of the
  loader (no unwatch), and used a touch-a-sibling-py cascade to force reloads.
  Here: watch LISP_ROOT only, dedupe via a sentinel module in sys.modules,
  and reimport the changed .lpy module directly. Stubs are late-bound, so a
  reimport is sufficient — save a .lpy and the next voice command runs it.
  nREPL (eval/load-file) remains available for finer-grained dev.
- Namespace bytecode caching (.lpyc) is left ON (basilisp default), so the
  one-time compile cost is only paid when sources actually change.
- Talon reloads this file on change; module globals reset, so the duplicate
  nREPL-server guard probes the port itself rather than trusting a flag.
"""

import contextlib
import importlib
import os
import socket
import sys
import threading
import time
import types

NREPL_PORT = 7891
LISP_ROOT = os.path.dirname(os.path.abspath(__file__))
PORT_FILE = os.path.join(LISP_ROOT, ".nrepl-port")


@contextlib.contextmanager
def _bytecode_writing_enabled():
    """Talon sets sys.dont_write_bytecode=True, which silently prevents
    Basilisp from caching compiled namespaces (.lpyc) -- forcing a full
    ~19s recompile of basilisp.core on EVERY Talon launch. (This was the
    root cause of the old basilisp branch feeling broken-slow.)

    Reading caches is unaffected by the flag, so we only need writing
    enabled around Basilisp compiles. Scoped flip, restored after."""
    prev = sys.dont_write_bytecode
    sys.dont_write_bytecode = False
    try:
        yield
    finally:
        sys.dont_write_bytecode = prev


def ensure_paths():
    """Idempotently add the lisp source root (and, defensively, Talon's venv
    site-packages where `talon pip` installs) to sys.path. Keep sys.path lean:
    basilisp's meta_path importer scans these entries on every import."""
    venv_sp = os.path.expanduser(
        "~/.talon/.venv/lib/python{}.{}/site-packages".format(
            sys.version_info.major, sys.version_info.minor
        )
    )
    if os.path.isdir(venv_sp) and venv_sp not in sys.path:
        sys.path.append(venv_sp)
    if LISP_ROOT not in sys.path:
        sys.path.insert(0, LISP_ROOT)


def ensure_basilisp():
    """Initialize the Basilisp runtime. Safe to call from every stub: upstream
    init() returns immediately if already initialized."""
    ensure_paths()
    import basilisp.main

    t0 = time.perf_counter()
    with _bytecode_writing_enabled():
        basilisp.main.init()
    dt = time.perf_counter() - t0
    if dt > 0.05:
        print(f"basilisp: runtime initialized in {dt:.2f}s")


def load_lpy(module_name: str):
    """Import a Basilisp namespace (by its Python module name) with bytecode
    caching enabled. Use this from Talon-facing stubs."""
    ensure_basilisp()
    with _bytecode_writing_enabled():
        return importlib.import_module(module_name)


def _port_in_use(port: int) -> bool:
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.settimeout(0.2)
        return s.connect_ex(("127.0.0.1", port)) == 0


def start_nrepl():
    """Start the Basilisp nREPL server in a daemon thread, unless one is
    already listening (e.g. Talon reloaded this file)."""
    if _port_in_use(NREPL_PORT):
        print(f"basilisp: nREPL already listening on {NREPL_PORT}, skipping")
        return

    import importlib

    from basilisp.lang import keyword as kw
    from basilisp.lang import map as lmap
    from basilisp.lang.util import munge

    nrepl = importlib.import_module("basilisp.contrib.nrepl_server")
    start_server = getattr(nrepl, munge("start-server!"))
    opts = lmap.map(
        {
            kw.keyword("host"): "127.0.0.1",
            kw.keyword("port"): NREPL_PORT,
            kw.keyword("nrepl-port-file"): PORT_FILE,
        }
    )
    threading.Thread(
        target=start_server, args=(opts,), daemon=True, name="basilisp-nrepl"
    ).start()
    print(f"basilisp: nREPL server starting on port {NREPL_PORT}")


_SENTINEL = "talon_basilisp_state"


def _state() -> types.ModuleType:
    """Mutable state that survives Talon reloads of this file (module globals
    don't: each reload is a fresh module object). Parked in sys.modules."""
    m = sys.modules.get(_SENTINEL)
    if m is None:
        m = types.ModuleType(_SENTINEL)
        sys.modules[_SENTINEL] = m
    return m


def _module_name_for(path: str):
    """Map an absolute .lpy path under LISP_ROOT to its Python module name,
    e.g. .../lisp/tlisp/demo.lpy -> 'tlisp.demo'. None for anything else."""
    if not path.endswith(".lpy"):
        return None
    rel = os.path.relpath(path, LISP_ROOT)
    if rel.startswith(".."):
        return None
    return rel[:-len(".lpy")].replace(os.sep, ".")


def _on_lpy_change(path: str, flags) -> None:
    name = _module_name_for(path)
    if name is None:
        return
    try:
        mod = sys.modules.get(name)
        t0 = time.perf_counter()
        with _bytecode_writing_enabled():
            if mod is None:
                importlib.import_module(name)
            else:
                importlib.reload(mod)
        print(f"basilisp: (re)loaded {name} in {time.perf_counter() - t0:.3f}s")
    except Exception as e:
        print(f"basilisp: reload of {name} FAILED, previous definitions still "
              f"live: {e!r}")


def start_lpy_watcher() -> None:
    """Watch LISP_ROOT (only) for .lpy saves and reimport the changed module.
    Deduped: unregisters the previously registered callback first, so Talon
    reloads of this file don't accumulate watchers (the v1 bug)."""
    from talon import fs

    st = _state()
    prev = getattr(st, "lpy_watcher", None)
    if prev is not None:
        try:
            fs.unwatch(LISP_ROOT, prev)
        except Exception:
            pass
    fs.watch(LISP_ROOT, _on_lpy_change)
    st.lpy_watcher = _on_lpy_change
    print(f"basilisp: watching {LISP_ROOT} for .lpy changes")


try:
    ensure_basilisp()
    start_nrepl()
    start_lpy_watcher()
except Exception as e:
    print(f"basilisp boot error: {e!r}")
