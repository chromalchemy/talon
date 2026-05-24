💡 `app.name:` context header at top of `.talon` file scopes ALL commands in that file

**The #1 reason a Talon voice command "doesn't fire".**

A `.talon` file with this header:
```talon
app.name: Adobe UXP Developer Tools
-

turtle man <user.running_applications>:
    ...
```

…scopes **every** command in the file to fire only when the named app
is frontmost. The `-` after the header separates context from rules;
everything below it inherits the context restriction.

So:
- Saying "turtle man Photoshop" while Cursor is focused → no match, no
  log entry beyond the heard phrase.
- Focus the UXP window first, *then* say it → matches.

**Other context predicates that work the same way:**
- `os: mac` / `os: windows` / `os: linux`
- `mode: command` / `mode: dictation`
- `tag: user.foo`
- `title: /regex/`

You can combine them; all listed predicates must hold for any rule in
the file to match.

**Debugging recipe when a command "doesn't fire":**

```bash
tail -F ~/.talon/talon.log
```
Then speak the phrase. Talon logs whether it heard the phrase, which
rule matched, or that no rule matched given current context. If you
see the phrase logged but no rule fires, context restriction is the
prime suspect.

**Fixes when you want a global command:**

1. Move it to a new `.talon` file with no context header.
2. Move it to an existing global file (e.g. `ryan/global.talon`).
3. Add a `^` or alternate context line — but file-level context can't
   be conditionally relaxed; you'd be better off splitting the file.

**Real case from this session:** `launch photo master` was originally
inside `ryan/photoshop/uxp.talon`, which is scoped to UXP Developer
Tools. The whole point of "launch" is to fire when the apps *aren't*
open yet → wrong file. Moved to `ryan/photoshop/launch.talon` (no
header) and it worked.

**Future me:** when the user says "this command doesn't work", FIRST
check whether the file has a context header that excludes the app they
were in when they tried. Faster than any other diagnosis.
