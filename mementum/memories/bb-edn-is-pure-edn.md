🔁 `bb.edn` is read as pure EDN — no Clojure reader macros

**Symptom:** `bb tasks` fails to load `bb.edn` with:
```
java.lang.RuntimeException: No dispatch macro for: (
  at clojure.lang.EdnReader$DispatchReader.invoke(...)
```
pointing at a line containing `#(...)` or another reader macro that's
Clojure-only.

**Cause:** bb parses `bb.edn` with the EDN reader. EDN supports `#_`
(discard) and namespaced maps but **not**:
- `#(...)` anonymous function literals
- `#"..."` regex literals (Clojure has them via reader macro)
- `'(...)` quote? — wait, quote IS edn-legal as `'sym`, that's fine
- `#=(...)` eval reader
- tagged literals only work if you've registered them

**Fix:** rewrite `#(...)` as `(fn [x] ...)`. Yes it's longer, eat it.

**Common gotcha pattern:**
```clojure
;; broken — bb.edn won't parse
up {:task (.addShutdownHook (Runtime/getRuntime)
                            (Thread. #(do (println "bye")
                                          (cleanup))))}

;; works
up {:task (.addShutdownHook (Runtime/getRuntime)
                            (Thread. (fn []
                                       (println "bye")
                                       (cleanup))))}
```

**Note:** the `:task` value itself is *evaluated* by bb at task-run
time (so it's effectively Clojure-flavored sci code), but the
surrounding `bb.edn` file is *read* as EDN first. Reader macros must
survive the read pass to even reach the eval pass.

**Future me:** anytime a `bb.edn` edit yields "No dispatch macro for: (",
hunt for `#(...)` first.
