❌ Testing Talon settings with a `Context()` made in `~/.talon/bin/repl` gives false negatives

A bare `Context()` created in the REPL with `c.settings = {...}` LOSES to
user-file contexts (e.g. `community/settings.talon`'s `speech.timeout =
0.4`) — `settings.get` still returns the file value. Looked like
"setting can't be overridden" → wrong conclusion.

Reliable test: put the override in a real `.talon` file scoped to a
mode/tag, then toggle it from the REPL and read back:
```bash
echo 'import time; actions.user.whisper_mode(); time.sleep(2); a = settings.get("speech.timeout"); actions.user.command_mode(); print(a, settings.get("speech.timeout"))' | ~/.talon/bin/repl
```
(`settings`/`actions` are pre-imported in the repl.)

REPL gotcha: piped input is read per line as a SINGLE statement —
multi-line `printf '...\n...'` → "multiple statements found". Put
everything on ONE line joined with `;`. Always restore the mode you
changed (leave user in command mode).
