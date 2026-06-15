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
import logging
import os
import socket
import sys
import threading
import time
import types

NREPL_PORT = 7891
LISP_ROOT = os.path.dirname(os.path.abspath(__file__))
USER_ROOT = os.path.dirname(LISP_ROOT)
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
    # NB: include sys.abiflags ('t' on free-threaded builds, '' otherwise).
    # Talon's bundled Python went 3.13 -> 3.14t (free-threaded), whose venv
    # site-packages dir is python3.14t/ -- dropping the suffix silently points
    # at an empty python3.14/ dir and basilisp "vanishes" (ModuleNotFoundError).
    venv_sp = os.path.expanduser(
        "~/.talon/.venv/lib/python{}.{}{}/site-packages".format(
            sys.version_info.major, sys.version_info.minor, sys.abiflags
        )
    )
    if os.path.isdir(venv_sp) and venv_sp not in sys.path:
        sys.path.append(venv_sp)
    if LISP_ROOT not in sys.path:
        sys.path.insert(0, LISP_ROOT)
    # The whole user dir is a namespace root too, so .lpy files can live
    # next to the .talon grammars they serve (ryan/roam/foo.lpy ->
    # ryan.roam.foo). APPEND, not insert: stdlib/site-packages must win
    # lookups so user dirs can never shadow real modules.
    if USER_ROOT not in sys.path:
        sys.path.append(USER_ROOT)
        _warn_shadowed_names()


def _warn_shadowed_names():
    """user/ being a sys.path root means its top-level names are importable.
    They can't shadow stdlib/site-packages (USER_ROOT is appended, earlier
    entries win) -- but a stdlib- or installed-package-named dir here would
    itself be UNIMPORTABLE as a namespace root, silently. Make that noisy."""
    try:
        import importlib.metadata as md

        taken = set(sys.stdlib_module_names)
        taken.update(md.packages_distributions().keys())
        user_tops = {
            e.split(".")[0].replace("-", "_")
            for e in os.listdir(USER_ROOT)
            if not e.startswith((".", "_"))
        }
        for name in sorted(user_tops & taken):
            print(
                f"basilisp: WARNING: user/{name} collides with an installed "
                f"module name; .lpy namespaces under it will not resolve"
            )
    except Exception as e:
        print(f"basilisp: shadow check skipped: {e!r}")


def _patch_importer_namespace_specs():
    """Work around an upstream basilisp bug (importer.py find_spec): for
    "namespace packages" (a dir with .lpy files and no __init__), it returns
    `ModuleSpec(fullname, None, is_package=True)` with EMPTY
    submodule_search_locations. BasilispImporter sits first on sys.meta_path,
    so it claims such parent packages before Python's PathFinder can -- and
    sibling .py modules in mixed .py/.lpy dirs then fail to import with
    ModuleNotFoundError (seen as Talon 'import failed' + cascading
    'lists skipped because they have no matching declaration' noise).

    Fix: give those namespace-package specs their real directory path."""
    from basilisp import importer as _bimp

    if getattr(_bimp.BasilispImporter.find_spec, "_talon_ns_patch", False):
        return
    orig = _bimp.BasilispImporter.find_spec

    def find_spec(self, fullname, path=None, target=None):
        spec = orig(self, fullname, path, target)
        if (
            spec is not None
            and spec.loader is None
            and spec.submodule_search_locations is not None
            and not list(spec.submodule_search_locations)
        ):
            parts = fullname.split(".")
            names = parts if not path else [parts[-1]]
            for entry in path or sys.path:
                root = os.path.join(str(entry), *names)
                if os.path.isdir(root):
                    spec.submodule_search_locations.append(root)
        return spec

    find_spec._talon_ns_patch = True
    _bimp.BasilispImporter.find_spec = find_spec


def ensure_basilisp():
    """Initialize the Basilisp runtime. Safe to call from every stub: upstream
    init() returns immediately if already initialized."""
    ensure_paths()
    import basilisp.main

    t0 = time.perf_counter()
    with _bytecode_writing_enabled():
        basilisp.main.init()
    _patch_importer_namespace_specs()
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
    """Map an absolute .lpy path to its Python module name, resolving against
    LISP_ROOT first (infrastructure: .../lisp/tlisp/demo.lpy -> 'tlisp.demo'),
    then USER_ROOT (domain code: .../ryan/roam/foo.lpy -> 'ryan.roam.foo').
    LISP_ROOT must win for files under lisp/, since that's how they're
    importable (lisp/ is its own sys.path root). None for anything else."""
    if not path.endswith(".lpy"):
        return None
    for root in (LISP_ROOT, USER_ROOT):
        rel = os.path.relpath(path, root)
        if not rel.startswith(".."):
            return rel[:-len(".lpy")].replace(os.sep, ".")
    return None


@contextlib.contextmanager
def _reload_quiet():
    """Re-executing a namespace re-registers its aliases/imports/vars, which
    basilisp's analyzer reports via ungated logger.warning calls ("may shadow
    an existing alias", "redefining Var"). That is the definition of a reload,
    not a problem -- suppress the analyzer logger for the reload only, so
    genuine warnings from fresh compiles and nREPL evals still surface."""
    analyzer_logger = logging.getLogger("basilisp.lang.compiler.analyzer")
    prev = analyzer_logger.level
    analyzer_logger.setLevel(logging.ERROR)
    try:
        yield
    finally:
        analyzer_logger.setLevel(prev)


def _on_lpy_change(path: str, flags) -> None:
    name = _module_name_for(path)
    if name is None:
        return
    try:
        mod = sys.modules.get(name)
        t0 = time.perf_counter()
        with _bytecode_writing_enabled(), _reload_quiet():
            if mod is None:
                importlib.import_module(name)
            else:
                importlib.reload(mod)
        print(f"basilisp: (re)loaded {name} in {time.perf_counter() - t0:.3f}s")
    except Exception as e:
        print(f"basilisp: reload of {name} FAILED, previous definitions still "
              f"live: {e!r}")


def start_lpy_watcher() -> None:
    """Watch USER_ROOT for .lpy saves and reimport the changed module (the
    callback early-exits on non-.lpy paths, so watching the whole tree is
    cheap). USER_ROOT contains LISP_ROOT, so one watcher covers both roots.
    Deduped: unregisters the previously registered callback first, so Talon
    reloads of this file don't accumulate watchers (the v1 bug)."""
    from talon import fs

    st = _state()
    prev = getattr(st, "lpy_watcher", None)
    prev_path = getattr(st, "lpy_watcher_path", LISP_ROOT)
    if prev is not None:
        try:
            fs.unwatch(prev_path, prev)
        except Exception:
            pass
    fs.watch(USER_ROOT, _on_lpy_change)
    st.lpy_watcher = _on_lpy_change
    st.lpy_watcher_path = USER_ROOT
    print(f"basilisp: watching {USER_ROOT} for .lpy changes")


def load_all_lpy():
    """Import every .lpy under USER_ROOT at boot. The watcher only (re)loads
    on *save*; without this, pure-Basilisp action modules simply never load
    after a Talon restart and their actions vanish. Idempotent: skips modules
    already in sys.modules, so Talon reloads of this file are cheap."""
    t0 = time.perf_counter()
    count = 0
    for dirpath, dirnames, filenames in os.walk(USER_ROOT):
        dirnames[:] = [
            d for d in dirnames
            if not d.startswith((".", "_")) and d != "node_modules"
        ]
        for fn in filenames:
            if not fn.endswith(".lpy"):
                continue
            name = _module_name_for(os.path.join(dirpath, fn))
            if name is None or name in sys.modules:
                continue
            try:
                with _bytecode_writing_enabled(), _reload_quiet():
                    importlib.import_module(name)
                count += 1
            except Exception as e:
                print(f"basilisp: boot load of {name} FAILED: {e!r}")
    if count:
        print(f"basilisp: boot-loaded {count} .lpy modules "
              f"in {time.perf_counter() - t0:.2f}s")


try:
    ensure_basilisp()
    start_nrepl()
    start_lpy_watcher()
    load_all_lpy()
except Exception as e:
    print(f"basilisp boot error: {e!r}")
