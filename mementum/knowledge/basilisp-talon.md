---
title: Basilisp in Talon — Clojure as the scripting layer
status: active
category: integration
tags: [basilisp, talon, clojure, nrepl, repl-driven, voice]
related: [tmem-roam-bridge]
---

# Basilisp in Talon

Write Talon action bodies in Clojure (.lpy), live inside the Talon
process, with two update paths: save-the-file (like Python) or nREPL.
Branch `basilisp-v2` in `~/.talon/user`. basilisp 0.5.1 in Talon's venv
(`~/.talon/bin/pip`). Local basilisp source checkout for reference:
`~/dev/gbo/basilisp` (docs in `docs/`, version matches installed).

## Architecture

```
lisp/00_boot.py        bootstrap: init + nREPL server + .lpy watcher
lisp/tlisp/*.lpy       Clojure namespaces (action bodies)
lisp/<x>_stub.py       Module/action_class declarations, late-bound delegation
lisp/<x>.talon         voice commands -> user.<action>
```

- **Stubs are OPTIONAL (since 2026-06-11).** Actions can be registered
  from pure Basilisp: `talon.Module()` only requires an active
  `talon.scripting.rctx` ResourceContext, which a .lpy can create
  itself (`rctx.context("user.lisp.x")` → enter → Module +
  action_class → **`mod._load()`** to commit decls). Proven in
  `lisp/tlisp/spike.lpy`; helpers/`defaction` in `lisp/tlisp/talon.lpy`.
  See memory `talon-actions-from-pure-basilisp`. ⚠️ rctx is Talon
  internals — re-verify after Talon upgrades.
- **Legacy stub pattern** (demo_stub.py) still valid: stub bodies call
  `_mod.fn(args)` — module-attr lookup per call = late binding, so any
  redef (nREPL or reload) applies on the next voice command.
- **nREPL server on port 7891** (7888 = stray java; 6888 = roam bridge
  bb daemon). `clj-nrepl-eval --port 7891 '(...)'`. Daemon thread,
  startup guarded by port-probe (module globals reset on Talon reload).
- **Scoped .lpy watcher**: watches `lisp/` only, deduped via sentinel
  module in `sys.modules`, reimports changed module directly
  (~0.02-0.04s). Failed compile keeps previous defs live + logs error.

## The performance trap (solved)

Talon sets `sys.dont_write_bytecode=True` → basilisp can never write
.lpyc caches → ~19s basilisp.core recompile EVERY launch on the loader
thread (this killed the v1 attempt; looked like "something is wrong").
Fix: scoped context-manager flip around basilisp compiles
(`_bytecode_writing_enabled` in 00_boot.py). 17.4s cold → 0.30s warm.
Pre-warm caches from CLI: `~/.talon/bin/python` (same CPython → valid
bytecode), set flag False, `basilisp.main.init()`.

## Dev loop

1. Edit `.lpy`, save → log line `basilisp: (re)loaded tlisp.demo in 0.0Xs`
   (`tail -f ~/.talon/talon.log`). Next voice command runs new code.
2. Or nREPL: `(load-file "/abs/path.lpy")` for whole file; for surgical
   redefs from CLI wrap in `(binding [*ns* (the-ns 'tlisp.demo)]
   (eval '(defn ...)))` — CLI evals land in `user` ns and basilisp's
   `(eval form ns)` arity does NOT redirect interning. Editor clients
   (Calva/CIDER) send ns per eval and don't hit this.
3. Talon interop from lisp: `(:import [talon.app :as app])` works for
   real modules; `talon.actions` is a package attribute, not a module —
   `(import talon)` then `(.-actions talon)`.

## Gotchas

- **`^:redef` for intra-ns live redefs.** Direct linking means same-ns
  callers keep the old fn after an nREPL redef of the callee. Mark
  live-redefined fns `(defn ^:redef ...)`. File-save reloads are immune
  (whole ns recompiles). Python late-bound stub calls are immune.
- Reload warnings ("may shadow existing alias", "redefining Var") are
  ungated `logger.warning` from `basilisp.lang.compiler.analyzer`, not
  compiler_opts-controllable. Watcher suppresses scoped (`_reload_quiet`).
- First-ever boot on a fresh install/upgrade still pays the ~19s compile
  once (watchdog warnings in log are expected then, harmless).
- basilisp version upgrades invalidate caches → one slow boot after
  `pip install -U basilisp`. Consider CLI pre-warm after upgrades.

## Open candidates

- Migrate a first real action surface to .lpy.
- Calva connect / Portal (djblue ported Portal to basilisp) over 7891.
- Background pre-warm thread or setup script for fresh installs.
- defonce-style state: file-save reload re-executes whole ns; prefer
  nREPL eval when protecting in-memory state, or use defonce.

## Memories (grep `git log --oneline -- mementum/memories | grep -i basilisp`)

- talon-disables-bytecode-writing-breaks-basilisp-cache (root cause)
- nrepl-first-beats-file-watchers-for-in-process-lisp (watcher rules)
- basilisp-nrepl-cli-evals-land-in-user-ns (CLI ns gotcha)
- basilisp-direct-linking-freezes-intra-ns-redefs (^:redef)
- talon-actions-from-pure-basilisp (no-stub action registration recipe)
