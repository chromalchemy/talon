❌ `user.system_command_nb` is misnamed — it actually blocks. Use `system_command_detached` for long-running procs.

**Location:** `~/.talon/user/community/core/system_command.py`

**The misleading API:**

```python
def system_command_nb(cmd: str):
    """execute a command on the system without blocking"""
    process = subprocess.Popen(cmd, shell=True, ...)
    stdout, stderr = process.communicate()   # <-- BLOCKS until child exits
```

Despite the `_nb` ("non-blocking") suffix and the docstring, `.communicate()`
waits for the child to complete. So:

- Calling it on `bb up` (which `(deref (promise))` blocks forever) →
  **Talon's command thread hangs forever, voice recognition stops.**
- Calling it on a brief command (`bb down`, `git status`) → fine,
  blocking is sub-second.

**The real fix — actually-non-blocking variant I added:**

```python
def system_command_detached(cmd: str):
    """Fire-and-forget. Returns immediately. Safe for long-running procs."""
    subprocess.Popen(
        cmd,
        shell=True,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        stdin=subprocess.DEVNULL,
        start_new_session=True,   # detach from Talon's process group
        env=env,
    )
    # no .communicate(), no .wait()
```

Three things make this truly detached:
1. **No `.communicate()`** — returns immediately after `Popen` constructs.
2. **`start_new_session=True`** — child becomes its own process group
   leader. Survives Talon restart (otherwise SIGHUP propagates).
3. **`DEVNULL` on all three streams** — no pipe buffer to fill up and
   later deadlock the child.

**Decision rule:**

| Command type | Use |
|---|---|
| Short (<1s, exits cleanly) | `system_command_nb` (blocking is fine) |
| Long-running (server, watcher, REPL) | `system_command_detached` |
| Need stdout back in Talon | `system_command_nb_get_text` (also blocks) |

**Subtle gotcha — `shell=True` with unquoted paths containing spaces:**

```talon
# Broken: shell tokenizes on space
user.system_command_nb("cd ~/dev/ps script/foo && bb up")
# → cd ~/dev/ps  (fails)
#   script/foo   (treated as stray arg)

# Fixed: quote the path
user.system_command_nb("cd '/Users/ryan/dev/ps script/foo' && bb up")
```

This caught me in the `launch photo master` command — the path with
"ps script" in it silently failed and `bb up` never ran.

**Why I didn't "fix" `system_command_nb` itself:** it's in
`community/` (shared upstream code). Changing its semantics could
break other people's commands. Better to add a new correctly-named
action.

**Future me:** any time a Talon command kicks off a long-running shell
process, use `system_command_detached`. The `_nb` suffix is a lie.
