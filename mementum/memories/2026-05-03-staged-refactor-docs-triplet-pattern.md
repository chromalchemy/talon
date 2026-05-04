🔁 Pattern: tmem-roam-bridge ships a 3-doc triplet that future refactors should copy

The composable-grammar refactor in `~/dev/tmem-roam-ext/docs/` uses three
docs in concert and the result is unusually navigable:

1. **PLAN.md** — intent. Old→new mappings, AST shapes, file-by-file
   change list, phase table A–H. Stable; "don't edit, source of truth."
2. **SCHEMA.md** — contract. Wire envelope, AST grammar, action shapes,
   error codes, worked examples. Versioned (`version: 1` locked).
3. **PROGRESS.md** — state. Phase status, what's verified, *21 numbered
   gotchas*, deletion candidates, open questions. Updated per phase.

Why it works:
- The plan never lies about progress (different doc).
- The schema never lies about intent (different doc).
- Each phase commit can update the progress log atomically without
  disturbing plan or schema.
- Numbered gotchas accumulate as a flat searchable catalogue rather
  than disappearing into prose.

Where it fails: the progress doc still drifted on architecture
(see `2026-05-03-progress-doc-says-daemon-deferred-but-shipped`).
The triplet helps with phase tracking but doesn't auto-detect when
adjacent migrations ship "for free."

When starting a new staged refactor, propose this pattern: PLAN +
SCHEMA + PROGRESS, three files, three roles, one north star.
