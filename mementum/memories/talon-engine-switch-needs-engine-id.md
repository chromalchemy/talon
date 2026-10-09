💡 Switching Talon speech model needs `speech._engine_id`, not just `speech.engine`

All Conformer/Wisp/+Whisper models share engine name `"wav2letter"`.
`speech.engine = "wav2letter"` alone picks the FIRST one (fast Conformer
D 2023 + Whisper). A model display name like
`"Conformer D2 (2026-05-05) + Whisper"` in `speech.engine` silently
matches nothing (setting changes, engine doesn't). Sky models ARE
matched by name (`"Song (2026-09-20)"` is the user's default).

Working override (settings() block in any context):
```talon
speech.engine = "wav2letter"
speech._engine_id = "10b77ed3…"   # Conformer D2 (2026-05-05) + Whisper
```
Docs: talonvoice.com/docs/reference/globals.settings.html
(`_engine_id` = "engine id (internal)").

List ids (ids are hashes — may change on model update/reinstall):
```bash
echo 'from talon import speech_system as s; [print(repr(e), getattr(e,"id",None)) for e in s.engines.values()]' | ~/.talon/bin/repl
```
Verify: `repr(speech_system.engine)` after toggling the mode. Switch
takes ~1–2s; first utterance may hit the old model.
