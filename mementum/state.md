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

Next candidates: migrate a real action to .lpy; Calva/Portal over 7891;
background pre-warm for fresh installs (first boot still pays ~19s once).

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

## What this session shipped (2026-05-03)

| Commit | Repo | Subject |
|---|---|---|
| `054a062` | tmem-roam-ext | docs: reflect daemon mode shipped (Phase G+) |
| `7cde418` | talon | fix port number in roam_tmem_ext.py comment |
| `61f8a26` | tmem-roam-ext | feat(modifier): wire every:reference and every:mention scopes |
| `78e6a8c` | talon | add reference/mention vocab |
| `fc47932` | tmem-roam-ext | refactor(bridge): delete ~25 orphaned legacy public fns + helpers |
| `1fb4734` | tmem-roam-ext | docs(progress): legacy public fns deleted |

`bridge.clj`: 2234 → **1506 lines** (–728, –32%). Talon repo got the
mementum substrate (`d594327` bootstrap) plus several knowledge/state
updates.

## What this session shipped (2026-05-03, second pass)

| Commit | Repo | Subject |
|---|---|---|
| `c5e12c5` | talon | feat(roam): list-capable roam_target capture |
| `bda5b24` | tmem-roam-ext | feat(zoom): reject list targets with list-not-supported error |
| `f8b14a0` | tmem-roam-ext | feat(nudge): list-capable target with sibling-aware ordering |
| `2f19be5` | talon | feat(nudge): composable target capture |
| `2d97616` | talon | fix(nudge): use Python wrapper for implicit-target EDN |
| `116ded0` | talon | refactor(nudge): inline-escape EDN literal, drop Python wrapper |
| `fbcaab3` | tmem-roam-ext | docs(progress): rewrite gotcha #21 — TalonScript brace escaping |
| `f0a9542` | tmem-roam-ext | feat(setTodoState): explicit todo/done/none with composable target |
| `5e1dd1c` | talon | feat(todo): composable setTodoState rules; drop legacy edit-mode dance |

**Multi-target todo state.** `make A and B done`, `unmark every child
of C`, `clear selection todo` now work via the new `setTodoState`
dispatch — direct text-prefix manipulation of `{{[[TODO]]}} ` /
`{{[[DONE]]}} ` markers via `data.block.update`. Replaces the four
legacy rules that synthesized cmd-Enter keypresses + sleeps + escapes
inside edit mode. Schema documented in COMMAND-SCHEMA.md §5.1, §7, §8.

❌ Tripped over the gotcha #21 interpolation flavour. First fix used a
Python wrapper (`roam_nudge_implicit`); user corrected — TalonScript
string literals are f-string-like, so `{{...}}` escapes to literal
braces. Reverted to inline-escape, rewrote gotcha #21 to clarify
mechanism (vs the original "no inline literals" framing), captured the
**avoid Python helpers mirroring Clojure** design principle in
`memories/talonscript-curly-brace-interpolation.md`.

**Multi-target action-verb grammar.** `chuck A and B`, `fold A and B`,
`bar A and B and C`, `take A and B` now all work in one phrase via the
single action-verb rule. `roam_target` is now `<primitive> (and
<primitive>)*` with single-element collapse (cursorless §3.5). Slot
shapes preserved: destinations + bring/move sources stay primitive-only
(§4.1 slot-type-enforces-arity). Inherently single-target verbs (`zoom`)
reject multi-uid regions in `bridge.clj` rather than at parse time
(§4 Option A — keep grammar uniform, enforce arity per-action).

**Multi-target nudge.** `nudge A and B up`, `nudge every child of C
down`, `nudge cursor up` now work via the composable target capture.
Talon's three nudge helpers (`roam_nudge_label`, `roam_nudge_implicit`,
old single-purpose `roam_nudge`) collapsed to one general
`roam_nudge(target_edn, direction)`. Bridge factors per-block logic
into `nudge-one!` and iterates with sibling-index sort: ascending for
`:up`/`:left-above`/`:right` (block moves toward start), descending for
`:down`/`:left-below`/`:right-below` (block moves toward end), so
multi-target ops don't trip over themselves.

`bridge.clj`: 1506 → **1553 lines** (+47).

## How to orient (next session)

1. Read this file.
2. `git log -n 10 -- mementum/` — what's changed.
3. Read `mementum/knowledge/tmem-roam-bridge.md` if continuing the workstream.
4. Skim memories under `mementum/memories/` (4 from 2026-05-03):
   - `progress-doc-says-daemon-deferred-but-shipped` — the architectural drift
   - `staged-refactor-docs-triplet-pattern` — PLAN+SCHEMA+PROGRESS as a model
   - `subagent-caught-audit-mistake` — reverse-direction grep when deleting
   - `daemon-vs-stray-bb-nrepls` — periodic kill of `bb --nrepl-server` cruft
5. The **21 numbered gotchas** in `~/dev/tmem-roam-ext/docs/REFACTOR-PROGRESS.md`
   are mandatory reading before edits to phrase marks, pronouns,
   TalonScript bodies, or modifier order.

## Open questions / candidates

- Replace upstream Nautilus `README.md` (still upstream content; misleading).
- Decide whether to enforce `labelsVersion` on the Clojure side
  (JS already does via 4-snapshot ring buffer; bridge.clj ignores).
- Optional Phase H: embedded LLM string DSL for placeholder marks.
- Doc consolidation pass on `REFACTOR-PROGRESS.md` ("Files modified
  (cumulative)" section is now mostly historical).
- Tag the daemon distinctively (e.g. `(defonce DAEMON :v1)`) so
  discovery scripts can filter strays. (Per memory
  `daemon-vs-stray-bb-nrepls`.)

## Workflow notes (heuristics confirmed this session)

- bridge daemon is on port **6888**. `clj-nrepl-eval --port 6888 '(...)'`
  for one-shots; `clojure-mcp__clojure_eval :port 6888` from this agent.
- For multi-edit refactors of `bridge.clj`, the **general subagent** is
  worth the delegation — it handles mechanical multi-fn deletion well
  and can run reload+smoke-test loops.
- `clojure-lsp` diagnostics surface unused-public-vars and arity
  errors. Treat clean diagnostics as the post-refactor success signal.
- bb nREPL strays accumulate. Kill `bb --nrepl-server` processes
  freely; the daemon launched as `bb bridge.clj` is unaffected.

## Symbols (from `agents.md`)

💡 insight · 🔄 shift · 🎯 decision · 🌀 meta · ❌ mistake · ✅ win · 🔁 pattern
