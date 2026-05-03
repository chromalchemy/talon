# State

## Active focus

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
