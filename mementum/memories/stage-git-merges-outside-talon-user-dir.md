---
type: 🔁
symbol: 🔁
title: Do conflicted git merges outside ~/.talon/user, then fast-forward
related: [talon-reload-signature-change-zombie-context, nriley-plugins-need-nriley-axkit]
---
🔁 Talon hot-reloads every file written under `~/.talon/user`. A merge
with conflicts in a live repo there (community, talon_axkit, ...) writes
conflict markers into .py files, and Talon loads them right away: syntax
errors, half-registered modules.

Pattern (used 2026-11-07 for the talon_axkit ← nriley merge):
1. `git clone <live repo> /tmp/x`, add the upstream remote, merge there,
   resolve, `python3 -m py_compile`, commit. Your git identity applies.
2. In the live repo: `git fetch /tmp/x main && git merge --ff-only
   FETCH_HEAD`. Only finished files land.
3. Save `wc -l < ~/.talon/talon.log` before step 2, then grep the log
   tail for `ERROR|failed type check|import failed`.

Same idea when moving action declarations between files: draft the new
files in /tmp, then install everything in one shell command (old file
first, short sleep, new files), so no window leaves an action declared
twice or not at all.
