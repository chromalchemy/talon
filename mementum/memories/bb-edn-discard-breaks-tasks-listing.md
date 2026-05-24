🔁 `#_#_` in `bb.edn` `:tasks` silently breaks `bb tasks` listing

**Symptom:** `bb tasks` prints "No tasks found." even though tasks are
defined and `bb run <task>` works fine.

**Cause:** Using a stacked discard reader macro like
```clojure
:tasks
{
 #_#_ http-server {:doc "Starts http server …"
                   :task (let [...] ...)}
 my-task {:task ...}}
```
to "comment out" a task. The discard form parses as valid EDN (correctly
removing the two following forms), but bb's task discovery logic for
`bb tasks` output gets confused and returns the empty set. The tasks
themselves still run.

**Fix:** Use `;;` line comments instead of `#_#_`.

**Diagnostic that pins it:**
`bb -e '(prn (:tasks (clojure.edn/read-string (slurp "bb.edn"))))'` shows
the tasks parsed correctly — that's the tell that EDN parsing is fine
and the bug is in bb's task discovery, not in the file.

**Bisection trick:** if `bb tasks` says "No tasks found", strip the
`:deps` block first (in case deps fail to resolve silently), then halve
the `:tasks` body until the listing returns. Saved me ~10 min next
time.

**Why future me cares:** very easy to copy a `#_#_`-stubbed task into a
new bb.edn and lose 15 min wondering why `bb tasks` shows nothing.
