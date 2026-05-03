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
- Verified phases A–G against actual code; flagged 4 drift points (see
  knowledge page §"Drift to be aware of").

## How to orient (next session)

1. Read this file.
2. `git log -n 10 -- mementum/` — what changed since.
3. Read `mementum/knowledge/tmem-roam-bridge.md` if continuing the workstream.
4. Spot-check the 4 drift items at the end of that page before trusting docs.
5. The 21 numbered gotchas in `~/dev/tmem-roam-ext/docs/REFACTOR-PROGRESS.md`
   are mandatory reading before edits to phrase marks, pronouns, TalonScript
   bodies, or modifier order.

## Open questions / candidates

- Update `REFACTOR-PROGRESS.md` to reflect that daemon mode shipped (one
  commit; awaiting user direction).
- Commit pending doc move (`PROJECT.md`, `AGENT-BRIDGE.md` → `docs/`).
- Replace upstream Nautilus `README.md`.

## Symbols (from `agents.md`)

💡 insight · 🔄 shift · 🎯 decision · 🌀 meta · ❌ mistake · ✅ win · 🔁 pattern
