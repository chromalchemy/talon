# State

## Active focus

**`basilisp-v2`** (branch `basilisp-v2`) — Clojure as Talon's scripting
layer via Basilisp, nREPL-first. See
`mementum/knowledge/basilisp-talon.md` for the full picture.

Shipped 2026-06-10: `8eb1f6b` (core integration), `50bdcea`
(save-to-update watcher), `4140f8c` (quiet reloads), plus 3 memories +
1 memory update. Detail on the core commit:

- `lisp/00_boot.py`: idempotent `basilisp.main.init()` + nREPL server
  **port 7891** inside the Talon process (port-probe guard vs duplicate
  servers; 7888 was taken by an unrelated java nREPL).
- `lisp/tlisp/demo.lpy` + `lisp/demo_stub.py` + `basilisp_demo.talon`:
  action bodies in Clojure; stubs declare Module/action_class and
  delegate **late-bound** (module-attr lookup per call) → nREPL redefs
  apply on the next voice command, zero reloads, zero watchers.
- 🎯 Root cause of old `basilisp` branch slowness: **Talon sets
  `sys.dont_write_bytecode=True`** → basilisp could never write `.lpyc`
  caches → ~19s basilisp.core recompile on EVERY launch, blocking the
  loader thread. Fix: scoped flag-flip during basilisp compiles.
  Measured: 17.4s cold → **0.30s warm**. Cache pre-warmed via
  `~/.talon/bin/python` (same CPython 3.13 as Talon).
- Dev loop (two options): **save the `.lpy` file** — scoped watcher on
  `lisp/` reimports the changed module (~0.02s, deduped via sentinel in
  sys.modules, direct reimport, no touch cascade) — or nREPL
  `clj-nrepl-eval --port 7891` / `(load-file ...)`. CLI evals land in
  `user` ns — wrap redefs in `(binding [*ns* (the-ns 'tlisp.demo)]
  (eval '(defn ...)))` or use an editor client that sends ns.
- Verified end-to-end by voice ("basilisp test") + live redefinition.

- ⚠️ `^:redef` gotcha for later: basilisp direct-links intra-namespace
  calls. nREPL-redefining `hello` does NOT update a same-ns `foo` that
  calls it — unless `hello` is `(defn ^:redef ...)`. File-save reloads
  recompile the whole ns, so they're immune. Mark live-redefined fns
  `^:redef` once .lpy namespaces grow multiple fns.
- Reload warnings ("may shadow alias", "redefining Var") are ungated
  `logger.warning` from `basilisp.lang.compiler.analyzer`; the watcher
  suppresses that logger scoped to its reload only (`_reload_quiet`).

Shipped 2026-06-11: **stubs are now optional** — `f292ead` adds
`lisp/tlisp/talon.lpy` (`defaction` macro + `register!`) so actions are
defined once, in pure Clojure. Mechanism: own
`rctx.context("user....")` → `Module`/`action_class` → **`mod._load()`**
(required to commit decls); previous ResourceContext freed on reload
via sys.modules sentinel. `lisp/tlisp/spike.lpy` is the working
example. Verified: watcher reload → 1 module/1 impl, new body live;
nREPL redef of the `^:redef` fn applies on next action call. Memory:
`talon-actions-from-pure-basilisp`. ⚠️ rctx is Talon internals —
re-verify after Talon upgrades. **Voice-verified end-to-end**: "basilisp
spike" (`ryan/roam/basilisp_spike.talon`) fired the defaction-registered
action — no Python stub anywhere in the chain.

Shipped 2026-06-11 (later): **roam.py migrated** (`3122f6b`) — 67
actions + 2 lists now in `lisp/tlisp/roam.lpy`, 1:1 port, registry
parity verified (0 sig diffs), `ryan/roam/roam.py` →
`.migrated-to-lisp`. tlisp.talon grew `deflist`, `:=` default args,
munged annotation keys, and free-on-failed-registration (failed
register! used to leak a partial module). ⚠️ Interop gotcha: value use
of an :import alias at module top level (`(.-actions pytalon)`) →
NameError; use `(importlib/import-module "talon")`.
**Voice-verified by user in Roam**: migrated actions work, and the
live loop is confirmed first-hand (edited a println in roam.lpy, saved,
spoke, saw new string in log). Smoke canary: `roam-basil-test` action +
"basil roam test" rule in `ryan/roam/core.talon`.

Shipped 2026-06-11 (later still): **domain-colocated .lpy** (`25caf15`)
— user/ is now a second sys.path root (appended; stdlib wins), so
`.lpy` files live next to their `.talon` grammars: `ryan/roam/foo.lpy`
→ ns `ryan.roam.foo`. lisp/ remains the root for `tlisp.*`
infrastructure. Watcher widened to user/ (covers both roots;
LISP_ROOT-first path→module mapping). Spike-verified: PEP 420 no
`__init__.py`, cross-root requires, colocated .lpyc, 0.027s reloads,
zero stdlib collisions. Known minor gap: ad-hoc nREPL `require`s don't
write .lpyc (cache flip is scoped to boot/watcher paths) — watcher/boot
loads do the caching, so warm starts unaffected.

Then **roam.lpy migrated home**: `lisp/tlisp/roam.lpy` →
`ryan/roam/roam.lpy`, ns `tlisp.roam` → `ryan.roam.roam`, ctx
`user.lisp.tlisp.roam` → `user.ryan.roam.roam`. Old context freed live
via nREPL (new ctx-name ⇒ auto-free-on-reload doesn't apply — free the
old ctx manually from `talon_basilisp_state`-style sentinel
`talon_basilisp_action_state`). Registry verified: all roam actions
exactly 1 decl, canary `user.roam_basil_test` owned by new module.
lisp/ now holds only tlisp.* infrastructure, as intended.

## Session 2026-06-11 commits (colocation session)

| Commit | Subject |
|---|---|
| `25caf15` | boot: user/ as sys.path root, watcher widened, multi-root mapping |
| `4f670e0` | 💡 memory: lpy-domain-colocation recipe + gotchas |
| `22c2411` | roam.lpy moved home → ryan/roam/roam.lpy (ns ryan.roam.roam) |
| `0ca1ee0` | boot shadow-check: warn on user/ dirs colliding with module names |

User-verified working. `~/.talon/bin/repl` evaluated as recovery escape
hatch (substrate-level complement, not a clj-loading alternative) —
documented in knowledge page Recovery section.

## Session 2026-06-11 commits (earlier session)

| Commit | Subject |
|---|---|
| `ed36c93`/`31e3b08` | memory + knowledge: pure-Basilisp action registration |
| `f292ead` | tlisp.talon: defaction macro + register!, no stubs |
| `21bc96c` | voice command wired to pure-Basilisp action (verified) |
| `3122f6b` | **roam.py migrated** → lisp/tlisp/roam.lpy (67 actions) |
| `dcb63a2`/`b4aa827` | memories: import-alias gotcha, parity-baseline pattern |
| `93b79f7`/`0a67389` | roam-basil-test smoke action + voice rule |

## How to orient (next session)

1. Read this file, then `mementum/knowledge/basilisp-talon.md` (the
   architecture + all gotchas live there, current as of this session).
2. `git log --oneline -n 15` — see table above.
3. nREPL into Talon: port **7891** (`clj-nrepl-eval --port 7891`, or
   `clojure-mcp__clojure_eval :port 7891` from an agent). Port 6888 =
   separate bb roam-bridge daemon (tmem workstream).
4. Memories this workstream (7): grep `git log --oneline --
   mementum/memories/ | grep -i "basilisp\|talon"`. Key ones:
   `talon-actions-from-pure-basilisp` (the no-stub recipe),
   `basilisp-import-alias-value-use-fails-at-top-level`,
   `registry-parity-baseline-for-talon-migrations`.

## Open / next candidates

- Delete `ryan/roam/roam.py.migrated-to-lisp` once migration has soaked.
- New domains: drop `.lpy` next to its `.talon` files, ns = path from
  user/, `(t/register! "user.<dotted-path>" ...)`. No new sys.path or
  watcher work needed.
- Decide demo_stub.py fate (legacy-pattern reference vs delete).
- Migrate further py action surfaces (parity-baseline memory = recipe).
- Calva/Portal over 7891; background pre-warm for fresh installs
  (first boot still pays ~19s once).
- ⚠️ After any Talon upgrade: re-verify rctx internals (Module
  registration) — say "basil roam test" as the canary.
- Inert leftover: stale module objects pinned by nREPL eval history
  clear on Talon restart (harmless).

## Previous focus

**`tmem-roam-bridge`** — composable voice grammar for editing Roam blocks.
See `mementum/knowledge/tmem-roam-bridge.md` for the workstream page.

Phases A–G+ complete (G+ = nREPL daemon mode on port 6888). Workstream
is in a steady state: voice surface fully migrated, legacy code
deleted, all 7 modifier categories live across all 16 actions. No
active tasks.

## Layout

| Repo | Branch | Path |
|---|---|---|
| Roam extension + bb daemon | `cursorless-style-refactor` | `~/dev/tmem-roam-ext` |
| Talon grammar | `unify-source-blocks` | `~/.talon/user/ryan/roam` |

Daemon: `bb bridge.clj` from `~/dev/tmem-roam-ext`, nREPL on port 6888.
After kill/restart, bb writes `.nrepl-port` and self-starts. Hot reload:
`clj-nrepl-eval --port 6888 '(load-file "bridge.clj")'`.

tmem detail (2026-05-03 sessions: multi-target grammar, setTodoState,
nudge, –32% bridge.clj) lives in git history of this file and in
`mementum/knowledge/tmem-roam-bridge.md`. Before editing phrase marks,
pronouns, TalonScript bodies, or modifier order: the **21 numbered
gotchas** in `~/dev/tmem-roam-ext/docs/REFACTOR-PROGRESS.md` are
mandatory reading. tmem open candidates are tracked in the knowledge
page. Workflow: general subagent is worth it for multi-edit bridge.clj
refactors; clean clojure-lsp diagnostics = post-refactor success
signal; kill `bb --nrepl-server` strays freely (daemon `bb bridge.clj`
unaffected).

## Symbols (from `agents.md`)

💡 insight · 🔄 shift · 🎯 decision · 🌀 meta · ❌ mistake · ✅ win · 🔁 pattern
