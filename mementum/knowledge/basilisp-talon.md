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
lisp/00_boot.py        bootstrap: init + nREPL + watcher + shadow check
lisp/tlisp/talon.lpy   defaction macro + deflist + register! (the framework)
lisp/tlisp/*.lpy       INFRASTRUCTURE only (tlisp.*)
<domain>/*.lpy         domain code, colocated with its .talon grammars
lisp/<x>_stub.py       LEGACY pattern: stub declarations + late-bound delegation
<anywhere>/*.talon     voice commands -> user.<action> (location unrestricted)
```

**Domain colocation (since 2026-06-11, `25caf15`):** `~/.talon/user`
itself is a sys.path root (APPENDED — stdlib/site-packages win
lookups), so ns = path from user root: `ryan/roam/roam.lpy` →
`ryan.roam.roam`. No `__init__.py` (PEP 420). `.lpyc` caches colocate
in each dir's `__pycache__`. The watcher watches all of user/ (covers
both roots; path→module resolves LISP_ROOT before USER_ROOT). A boot
check warns loudly if a user/ top-level dir collides with a
stdlib/installed module name (such a dir would be silently
unimportable). Memory: `lpy-domain-colocation-via-user-sys-path-root`.

First production surface migrated: `ryan/roam/roam.py` (67 actions +
2 lists) → `ryan/roam/roam.lpy` (ns `ryan.roam.roam`, ctx
`user.ryan.roam.roam`), registry-parity verified, voice verified. Old
file kept as `ryan/roam/roam.py.migrated-to-lisp`. ⚠️ When renaming a
ctx-name, auto-free-on-reload does NOT apply — free the old context
manually from the `talon_basilisp_action_state` sentinel
(`(.free old)` + delete the dict entry + pop stale module from
sys.modules), then verify each `user.*` action has exactly 1 decl in
`talon.registry.actions`.

`tlisp.talon/defaction` features: `name :- type` params (python/str,
python/int...), `:= default` (trailing), dash→underscore munging for
action and arg names, `^:redef` on the defined fn (nREPL redefs live),
`deflist` for Module.list declarations, contexts freed on reload AND on
failed registration (failure otherwise leaks a partial module).

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
   ✅ Voice-verified 2026-08-17: Calva (basilisp type, :7891)
   whole-file reload of rebelle.lpy → register! re-ran → next voice
   command executed the new code. Fully independent of the file-save
   watcher (paths 1 and 2 are peers, not fallbacks). Caveat: editor
   reloads skip .lpyc writing (cache flip is watcher/boot-scoped) —
   save the file once before quitting Talon if you care about the next
   warm start.
3. Talon interop from lisp: `(:import [talon.app :as app])` works for
   real modules; `talon.actions` is a package attribute, not a module —
   `(import talon)` then `(.-actions talon)`.

### Which REPL am I talking to? (bitten twice — check before eval)

| Port | Process | Compiles |
|---|---|---|
| **7891** | Talon (Basilisp nREPL) | `.lpy` — the ONLY place .lpy evals work |
| 7888 | rebelle-api bb daemon | bb-flavored .clj (`(in-ns 'main)`) |
| 6888 | tmem roam-bridge bb daemon | bridge.clj |
| 7892 | external JVM brain | JVM .clj |

Symptom of sending .lpy to a bb/JVM REPL:
`FileNotFoundException: Could not locate tlisp/talon.bb, .clj or
.cljc on classpath` — the receiving REPL is resolving requires on ITS
classpath; nothing is wrong with the .lpy. (Hit 2026-08-17 loading
rebelle.lpy into the :7888 Calva jack-in.)

Calva → Talon: separate VS Code window (one connection per window),
"Connect to a Running REPL Server, not in the Project", project type
**basilisp**, localhost:7891. ✅ User-verified working 2026-08-17.
Editor clients send ns per eval, so the CLI `user`-ns gotcha doesn't
apply.

### tlisp.nrepl — shared in-process nREPL client (2026-08-17)

`lisp/tlisp/nrepl.lpy`: generic persistent bencode nREPL client
(transport extracted from brain.lpy; basilisp.contrib.bencode). Talon
`.lpy` code talks to the other REPLs **directly over sockets** — no
shelling out to clj-nrepl-eval/bb, no zsh escaping footguns:

- `(client host port {:ns "main" :ensure! f :timeout s})` → atom handle
- `eval!`/`value!` (never throws; reconnect-once, :ensure! hook first),
  `eval-async!` (daemon thread, for Talon action bodies — don't block
  the voice thread), `interrupt!`, `close!`, `alive?`
- per-client Lock serializes evals (read-until-done drops other ids —
  unlocked concurrent evals would steal each other's replies)
- consumers: brain.lpy (:7892, :ensure! = start! JVM), rebelle.lpy
  (:7888, no ensure — bb daemon self-manages). tmem :6888 = candidate.
- bb's nREPL honors `:ns` per eval message AND persists `in-ns` per
  cloned session (both empirically verified against :7888).

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

## Recovery (when the Clojure layer is wedged)

Talon ships a Python REPL into the live process: `~/.talon/bin/repl`
(also tails the log). It doesn't depend on basilisp, so it's the escape
hatch if 00_boot.py fails or the nREPL thread dies: inspect `sys.path`,
exec the boot file manually / call `start_nrepl()`, free a stuck
ResourceContext via `sys.modules["talon_basilisp_action_state"].contexts`,
inspect `talon.registry.actions` ground truth. Not a Clojure-loading
alternative (no reader/ns/editor support, and `dont_write_bytecode` is
still set there) — substrate-level only.

Note: ad-hoc nREPL `require`s of new namespaces skip .lpyc writing (the
cache flip is scoped to boot/watcher paths); self-heals on first file
save, warm starts unaffected.

## Open candidates

- ~~Migrate a first real action surface to .lpy~~ done: roam (67),
  rebelle (8).
- ~~Calva connect over 7891~~ ✅ verified 2026-08-17 (basilisp project
  type). Still open: Portal (djblue ported Portal to basilisp).
- Background pre-warm thread or setup script for fresh installs.
- defonce-style state: file-save reload re-executes whole ns; prefer
  nREPL eval when protecting in-memory state, or use defonce.

## Memories (grep `git log --oneline -- mementum/memories | grep -i basilisp`)

- talon-disables-bytecode-writing-breaks-basilisp-cache (root cause)
- nrepl-first-beats-file-watchers-for-in-process-lisp (watcher rules)
- basilisp-nrepl-cli-evals-land-in-user-ns (CLI ns gotcha)
- basilisp-direct-linking-freezes-intra-ns-redefs (^:redef)
- talon-actions-from-pure-basilisp (no-stub action registration recipe)
- lpy-domain-colocation-via-user-sys-path-root (user/ as ns root)
