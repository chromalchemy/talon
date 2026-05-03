🔄 Drift: tmem-roam-ext daemon mode shipped despite docs claiming deferred

`docs/REFACTOR-PROGRESS.md` has a long "Architectural pivot — daemon mode
(deferred — pure latency knob)" section explicitly saying "Daemon mode:
revisit when latency annoys." But the actual code:

- `bridge.clj:2188+` has a `;; ═══ Daemon mode (Phase G+) ═══` block that,
  when bb runs the file directly, starts a `babashka.nrepl.server` on
  port 6888, sets `*persist-pronouns?*` false, and blocks on `@(promise)`.
- `~/.talon/user/ryan/roam/roam_tmem_ext.py` has `NREPL_PORT = "6888"`
  and routes every voice command through `clj-nrepl-eval --port 6888`.
  The legacy `bb -e ...` shell-out path is dead in the Talon side.
- `roam_fn` (the legacy escape hatch) is now also routed through the
  daemon — line ~170 of `roam_tmem_ext.py`.

Verified at session start: `wc -l` matches doc claims; commits
`735cdb0 change roam hats to edn calling` and `cdd9228 make roam_fn
use nrepl-eval tool` confirm the migration.

Implication: progress doc is correct on phase A–G surface but stale
on architecture. Don't trust the latency-comparison table or the
"recommended sequencing" prose without checking the code first.

Lesson: **read the bottom of `bridge.clj` before trusting anything in
REFACTOR-PROGRESS.md about runtime architecture.**

Fix candidate (one commit): add a "Phase G+: daemon shipped" status
row to the phase table; mark the entire "Architectural pivot" section
as historical context.
