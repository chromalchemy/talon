💡 To colocate Basilisp files with their domain's .talon grammars: append
user/ to sys.path (APPEND not insert — stdlib must win lookups), then
ns = path from the user root (`ryan/roam/foo.lpy` → `ryan.roam.foo`).
PEP 420 namespace packages mean no `__init__.py` needed.

Gotchas:
- Watcher path→module resolution must try LISP_ROOT before USER_ROOT,
  or `lisp/tlisp/x.lpy` maps to `lisp.tlisp.x` instead of `tlisp.x`.
- nREPL ad-hoc `require`s bypass the scoped `dont_write_bytecode` flip,
  so they don't write .lpyc; only watcher/boot loads cache. Self-heals
  on first file save.
- Verified zero stdlib-name collisions in user/ top-level dirs, but
  re-check when adding new top-level repos (`code/`, `keys/`...).

Implemented in `lisp/00_boot.py` (`25caf15`). Spike-verified: cross-root
requires, colocated .lpyc, 0.027s reloads.
