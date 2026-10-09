🔁 Per-mode Talon settings: declare a custom mode, scope a settings() block to it

Settings like `speech.timeout`/`speech.engine` can't be passed to
`mode.enable`, but any `.talon` context can override them. Recipe (used
for whisper mode, 2026-10-09, community `ryan-edits`):

1. `modes.py`: `mod.mode("whisper", desc=...)` → mode name is `user.whisper`.
2. `user.whisper_mode()` enables `dictation` + `user.whisper`; every other
   mode action (`command_mode`/`dictation_mode`/`mixed_mode`) must
   `actions.mode.disable("user.whisper")` or the override leaks.
3. `core/modes/whisper_mode.talon`:
   ```talon
   mode: user.whisper
   -
   settings():
       speech.timeout = 1.5
   ```
4. Voice trigger "whisper mode" in `command_and_dictation_mode.talon`.

Notes: `dictation`/`command`/`sleep` are Talon built-ins (no `user.`
prefix, not declared anywhere in user code). Sleep doesn't clear
`user.whisper` → timeout persists while asleep, restored on wake.
Global timeout is 0.4 in `community/settings.talon`.
