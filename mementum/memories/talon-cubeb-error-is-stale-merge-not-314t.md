🎯 `NameError: name 'cubeb' is not defined` in community
`microphone_selection.py` was NOT the Python 3.14t free-threaded break —
it was a **stale file from a bad merge**. Upstream PR #2207 removed all
`talon.lib.cubeb` usage (Talon deleted that module), but a merge on
`ryan-edits` kept the pre-#2207 cubeb-based file.

🔁 Pattern: not every Talon-era breakage is the platform upgrade. When a
vendored/community file throws on startup, run `git diff origin/main --
<file>` FIRST — the fix may already exist upstream.

✅ Fix recipe: adopt origin/main's modern `.py` (uses
`actions.sound.microphones()` / `active_microphone()`), but re-add any
local actions the personalized `.talon` depends on — here
`set_microphone_input_volume` (+ `from talon.mac import applescript`),
which origin/main does not define. Leave personal `.talon` / `.talon-list`
(hardware aliases) untouched. Verify via Talon autoreload: `[~] <file>`
in talon.log with no following import-failed traceback.

⚠️ Red herring: `talon_rust::py::cubeb: audio ring source overrun` WARNs
are the Rust audio engine, unrelated to the Python cubeb import.
