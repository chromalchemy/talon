# State

## Active focus

**`tmem-roam-bridge`** — composable voice grammar for editing Roam blocks.
See `mementum/knowledge/tmem-roam-bridge.md` for the workstream page.

Phases A–G of the Cursorless-style refactor are complete; daemon mode
shipped on top of G (drift from progress doc — see memory
`2026-05-03-progress-doc-says-daemon-deferred-but-shipped`).

Next-up candidates (none committed): doc fixups for the daemon drift,
deletion of ~25 legacy public fns in `bridge.clj`, lifting `getRefs`
into a `reference`/`mention` modifier scope, optional Phase H (LLM
string DSL).

## Layout

| Repo | Branch | Path |
|---|---|---|
| Roam extension + bb daemon | `cursorless-style-refactor` | `~/dev/tmem-roam-ext` |
| Talon grammar | `unify-source-blocks` | `~/.talon/user/ryan/roam` |

Daemon: `bb bridge.clj` from `~/dev/tmem-roam-ext`, nREPL on port 6888.

## Recent context

- Mementum substrate created (session 0).
- First workstream knowledge page written for `tmem-roam-bridge`.
- Verified phases A–G against actual code; flagged 4 drift points.
- Resolved 3 of 4: docs aligned with shipped daemon mode (Phase G+ row
  + "Architectural pivot" marked historical), `roam_tmem_ext.py` port
  comment fixed, doc move committed by user. Only legacy-fn deletion
  remains open.

## How to orient (next session)

1. Read this file.
2. `git log -n 10 -- mementum/` — what changed since.
3. Read `mementum/knowledge/tmem-roam-bridge.md` if continuing the workstream.
4. Spot-check the 4 drift items at the end of that page before trusting docs.
5. The 21 numbered gotchas in `~/dev/tmem-roam-ext/docs/REFACTOR-PROGRESS.md`
   are mandatory reading before edits to phrase marks, pronouns, TalonScript
   bodies, or modifier order.

## Open questions / candidates

- Delete the ~25 legacy public fns in `bridge.clj` (lines 1–1170) in
  groups, voice-testing after each. Voice surface verified across E–G.
- Lift `getRefs` query into a `reference`/`mention` modifier scope
  (~10 lines, per progress doc open-questions list).
- Replace upstream Nautilus `README.md` (still upstream content).
- Optional Phase H: embedded LLM string DSL.

## Symbols (from `agents.md`)

💡 insight · 🔄 shift · 🎯 decision · 🌀 meta · ❌ mistake · ✅ win · 🔁 pattern
