💡 `babashka.tasks/shell` registers a JVM shutdown hook → can't use it inside another shutdown hook

**Symptom:** When a `bb` task registers its own `Runtime/addShutdownHook`
to do cleanup on Ctrl-C, any `(shell ...)` call inside that hook throws:

```
java.lang.IllegalStateException: Shutdown in progress
  at java.lang.ApplicationShutdownHooks.add(...)
  at babashka.process$process_STAR_.invokeStatic(process.cljc:433)
  at babashka.impl.tasks$shell.invokeStatic(...)
```

**Mechanism:** `babashka.tasks/shell` is a thin wrapper around
`babashka.process/shell`, which defaults `:shutdown` to `destroy-tree`.
Every call therefore tries to register *another* shutdown hook to clean
up the child process. The JVM forbids adding hooks once shutdown has
started.

**Fixes (best first):**

1. `(babashka.process/shell {:shutdown nil :continue true} "cmd" ...)`
   — explicitly opt out of the hook registration. Keeps idiomatic API.
2. `(babashka.process/sh "cmd" ...)` — defaults `:shutdown` to `nil`,
   captures output as strings; good when you don't need inherited I/O.
3. Last resort: raw `java.lang.ProcessBuilder`. Don't reach for this
   first — option 1 is the right idiom.

**Defaults table (`babashka.process` 0.5.x / 0.6.x):**

| fn      | `:shutdown` default | I/O default |
|---------|--------------------|--|
| `process` | `nil`              | piped |
| `sh`      | `nil` (inherits)   | `:string` |
| `shell`   | `destroy-tree`     | `:inherit` |

So `shell` is the odd one out — it registers a hook *by design* to kill
subprocesses on JVM exit. That's great for foreground spawns but fatal
for in-hook use.

**Concrete example pattern:**
```clojure
:init (do
  (defn sh! [& cmd]
    ;; Safe to call from inside shutdown hooks.
    (apply babashka.process/shell {:shutdown nil :continue true} cmd)))

up {:task (do
            (.addShutdownHook (Runtime/getRuntime)
                              (Thread. #(sh! "osascript" "-e" "...")))
            (run 'dev))}
```

**Future me:** if Ctrl-C on a long-running bb task stack-traces with
"Shutdown in progress", the offender is almost always a `(shell ...)`
inside the hook. Check first.
