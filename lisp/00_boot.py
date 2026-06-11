"""Basilisp bootstrap for Talon.

Initializes the Basilisp runtime once (basilisp.main.init() is idempotent,
guarded by a lock upstream) and starts an nREPL server inside the Talon
process for live, REPL-first development.

Design notes (v2 — lessons from the old `basilisp` branch):
- NO fs.watch. The old global watcher accumulated duplicate registrations on
  every Talon reload of the loader and triggered touch-cascade reload storms.
  The dev loop here is nREPL: edit .lpy -> load-file/eval over port 7888.
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


try:
    ensure_basilisp()
    start_nrepl()
except Exception as e:
    print(f"basilisp boot error: {e!r}")
