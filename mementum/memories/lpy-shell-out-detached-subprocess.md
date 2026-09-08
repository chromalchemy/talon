🔁 Shelling out from `.lpy`: use `subprocess` directly, argv **vector** + `:cwd`, never `user.system_command_nb`.

`system_command_nb` blocks (memory: `talon-system-command-nb-actually-blocks`). From Basilisp you don't need it — `(:import os subprocess)` and own the call:

```clojure
(subprocess/Popen (python/list cmd)
                  **
                  :shell false :cwd cwd :env (shell-env)
                  :stdin subprocess/DEVNULL
                  :stdout subprocess/DEVNULL
                  :stderr subprocess/DEVNULL
                  :start_new_session true)   ; no .communicate() → returns now
```

Two fns cover everything: **`sh-detached!`** (above — long-running: apps, servers, watchers) and **`sh!`** (`:stdout PIPE :text true` + `.communicate` → returns stdout; sub-second commands only). `**` before kwargs is Basilisp's kwarg syntax.

**Prefer an argv vector over a shell string.** Each element is one argv entry, so paths with spaces need no quoting — `/Applications/Rebelle 8.app/...`, `~/dev/ps script/` — which is the exact class of bug that silently broke earlier commands. Use `:cwd` instead of `cd '…' &&`. Only use a shell string when the arg string arrives raw from a grammar and needs word-splitting.

`shell-env`: copy `os/environ`, prepend `/opt/homebrew/bin:/usr/local/bin` — Talon's PATH is minimal.

Verified: detached child gets `PGID == PID` (own process group → survives Talon restart); launcher returned in 31ms instead of hanging forever.
