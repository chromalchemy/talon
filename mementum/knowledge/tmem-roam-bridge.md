---
title: tmem-roam-bridge — composable voice grammar for Roam blocks
status: active
category: workstream
tags: [roam, talon, voice, clojure, babashka, clojurescript, cursorless, refactor]
related:
  - composable-action-grammar
depends-on: []
last-touched: 2026-05-03
last-update-note: drift items 1–3 resolved 2026-05-03
---

# tmem-roam-bridge

A Cursorless-style **composable action grammar** for editing block trees in
Roam Research by voice (Talon), via a Babashka daemon that talks to Roam's
Local API and an in-graph extension that fills the DOM-overlay gap. The
work is a multi-phase refactor *into* this design from a 25-fn ad-hoc API.

## The three layers

```
Talon voice ──► clj-nrepl-eval ──► bb daemon ──► Roam Local API ──► Roam graph
   (~/.talon/user/ryan/roam)        (port 6888)     (:3333)
                                                                 │
                                                                 ▼
                                          Roam ── extension (DOM, overlays,
                                                  state mirror)
                                          (~/dev/tmem-roam-ext/extension.js)
```

| Layer | Path | What it owns |
|---|---|---|
| **Talon grammar** | `~/.talon/user/ryan/roam/` | Voice → EDN envelope. `hats.talon` is the post-refactor surface (only 7 legacy `roam_fn` calls remain, all in edit-mode legacy). `roam_tmem_ext.py` (301 lines) defines composable captures + 5 Python actions (`roam_action`, `_pair`, `_dest`, `_swap`, `_nudge`). Vocabulary lives in 10 native `.talon-list` files under `roam-vocabulary/`. |
| **Bridge daemon** | `~/dev/tmem-roam-ext/bridge.clj` (2211 lines) | A bb script that, when run directly, self-starts an nREPL on port 6888. Top half (~lines 1–1170) = legacy public fns (`select!`, `move!`, `transfer!`, etc.) — *deletion candidates*, untouched. Bottom half = composable resolver spine (`resolve-mark*`, `apply-modifier`, `dispatch` multimethod with 16 actions, `execute!` entry point). |
| **Roam extension** | `~/dev/tmem-roam-ext/src/agent-bridge.js` (1131 lines) | DOM-side responsibilities only after Phase G: 9 commands (`annotate`, `clear`, `scan-blocks`, `nav-mode`, `nav-off`, `select-block`, `notify`, `eval`, `get-view`-deferred-but-still-listed). Polls Roam state every 2s, writes to `__state__` block on change. `__commands__`/`__state__` blocks live on a control page `roam-agent/bridge`. |

## North-Star design

Cursorless's grammar (mark + modifiers + ranges + lists) ported to **block
trees** (not text spans). Every operation is a verb on a region-of-the-tree:

```
target = primitive(mark + modifier*) | range | list | implicit
mark   = label | uid | pageTitle | daily | cursor | selection
       | that | source | phrase | placeholder
modifier = containing | every | ordinal | relative | head | tail | position
action shape ∈ {target, source+dest, dest, two-targets, scope, pass-through}
```

The wire envelope is `{version: 1, id, action: {name, ...slots}}`. Schema
locked in `docs/COMMAND-SCHEMA.md`. The plan is `docs/COMPOSABLE-REFACTOR-PLAN.md`.

## Status — phases A through G complete

| Phase | What | Status |
|---|---|---|
| A | Schema lock | ✅ |
| B | Bridge resolver spine | ✅ |
| C | Mark + modifier coverage | ✅ all 10 marks, 7 modifier categories |
| D | All 16 actions across 4 shapes | ✅ |
| E | Talon surface migration | ✅ `hats.talon` + `tree_edit.talon` migrated |
| F | Vocabulary externalised | ✅ 10 `.talon-list` files; CSV layer deleted |
| G | JS extension cleanup | ✅ `version` hard-reject, labelsVersion ring buffer, 9 commands |
| **Daemon** | nREPL daemon mode | ✅ **shipped (drift — see below)** |
| H | Embedded string DSL for LLMs | ⏳ optional; not started |

## Pipeline today (post-daemon migration)

1. Voice phrase → Talon capture builds EDN string
2. Python action wraps as `(execute! {:version 1 :id ... :action {...}})`
3. Shells `clj-nrepl-eval --port 6888 '...'` (~5–40 ms warm)
4. Daemon resolves target, calls Roam Local API at `:3333`
5. Pronouns (`that`, `source`) live in an atom (`defonce`) — survive `load-file`
6. Results returned synchronously over nREPL session

Daemon launch: `bb bridge.clj` from `~/dev/tmem-roam-ext/`. It writes
`.nrepl-port` and blocks on `@(promise)`. Hot-reload by sending
`(load-file "bridge.clj")` over the same nREPL session.

## Where to read what (doc currency, 2026-05-03)

| Doc | Status | Use for |
|---|---|---|
| `docs/COMPOSABLE-REFACTOR-PLAN.md` | 🟢 stable, North Star | Conceptual model, mappings old→new, AST shapes, file-by-file plan |
| `docs/COMMAND-SCHEMA.md` | 🟢 current | Wire contract — envelope, AST, mark catalogue, modifier catalogue, action shapes, error codes, examples |
| `docs/REFACTOR-PROGRESS.md` | 🟡 mostly current, **drift on daemon mode** | What's done, gotchas (21 numbered), verifications. The daemon-mode section says "deferred"; in fact it shipped — see Drift below. |
| `docs/AGENT-BRIDGE.md` | 🟡 partly stale post-G | JS-side command catalogue. Two cases removed (`delete-blocks`, `get-view` — though `get-view` may still be wired). |
| `docs/PROJECT.md` | 🟢 current | Architecture overview; what is/isn't Nautilus-derived |
| `docs/BLOCK-SELECTION-LIMITATIONS.md` | 🟢 current | Why `select-block` uses CSS-only highlight; 9 dead-ends documented |
| `README.md` | ❌ untouched fork | Still the upstream Nautilus README. Ignore. |

## Drift — most resolved 2026-05-03

1. ✅ **Daemon mode is live.** Was: progress doc said deferred. Now:
   `REFACTOR-PROGRESS.md` has a `G+ — Daemon mode ✅ shipped` row and
   the "Architectural pivot" section is marked historical rationale.
2. ✅ **Comment ↔ code aligned.** Was: `roam_tmem_ext.py` comment said
   "port 7888" while `NREPL_PORT = "6888"`. Fixed.
3. ✅ **Doc move committed.** (User did this.)
4. ⏳ **Legacy public fns in `bridge.clj`** (~25 of them, lines 1–1170)
   are still deletion candidates per progress §"Important gotchas" #5
   and the open-questions list. Voice surface no longer touches them.

## Branch state

| Repo | Branch |
|---|---|
| `~/dev/tmem-roam-ext` | `cursorless-style-refactor` |
| `~/.talon/user` | `unify-source-blocks` |

## Key entry points

```clojure
;; bridge.clj
(execute! {:version 1 :id "..." :action {:name "..." :target {...}}})
(execute-from-file! "/tmp/...json")  ;; legacy file-based path

;; Daemon supervision (REPL hot-reload)
clj-nrepl-eval --port 6888 '(load-file "bridge.clj")'
```

```python
# roam_tmem_ext.py — public Talon actions
user.roam_action(name, target)            # action+target
user.roam_action_pair(name, src, dest)    # source+destination
user.roam_action_dest(name, dest, string) # destination-only
user.roam_swap(t1, t2, content_flag)
user.roam_nudge(target, direction)
```

## Open work / candidates

- **Phase H (LLM string DSL).** Optional; nothing in flight.
- **Delete legacy `bridge.clj` public fns.** Voice surface verified across
  E–G. Plan is groups + voice-test after each.
- **`reference`/`mention` modifier scopes** stubbed; `getRefs` action
  contains the underlying query and could be lifted in ~10 lines.
- **`labelsVersion` enforcement on the Clojure side.** JS-side ring buffer
  exists; `bridge.clj` ignores `labelsVersion` entirely. Decide if
  Clojure-side validation is wanted.
- **Doc fixups** (drift items §1–3 above).
- **README.md replacement** (still upstream Nautilus content).

## Working memory pointers

- `bridge.clj` is **2211 lines** — read by section, not whole. Use the
  `═══` banners or the line numbers in the section above to jump to the
  resolver / dispatch / daemon parts.
- The 21 numbered gotchas in `REFACTOR-PROGRESS.md` are extremely high
  signal — read them before touching any of: phrase marks (case),
  pronouns (lifetime), TalonScript bodies (no inline dicts, gotcha §21),
  `labelsVersion` (stale-labels), modifier order in `roam_target` (§13).
- The 3 docs that ship together as the contract: `COMPOSABLE-REFACTOR-PLAN`
  (intent), `COMMAND-SCHEMA` (wire), `REFACTOR-PROGRESS` (state). The
  triplet is a model worth emulating in other workstreams — see memory
  `staged-refactor-docs-pattern`.
