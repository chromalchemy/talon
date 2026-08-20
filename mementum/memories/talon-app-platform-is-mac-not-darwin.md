❌ Talon `app.platform` returns **`"mac"`** / `"windows"` / `"linux"` —
never `"darwin"`. Verified live: `app.platform == 'mac'`.

Cost me a whole debug cycle: a mac-only feature guarded by
`_IS_MAC = app.platform == "darwin"` silently evaluated False, so all the
mac-specific logic (cursor re-hide + counter-drain in
`ryan/mouse/keep_cursor_hidden.py`) was skipped while *looking* correct.
Symptom looked like the feature "didn't work" — actually it never ran.

Community code confirms the convention: it branches on
`if app.platform == "windows":` with mac in the `else`. When you need an
explicit mac check, use `== "mac"`. Don't reach for `sys.platform`
("darwin") habits inside Talon.
