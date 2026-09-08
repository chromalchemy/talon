💡 `nvk`'s ~170ms is 2× babashka boot — invoker itself runs *inside* your daemon, so call it over the socket instead (~7ms, 20×).

**The cost:** `nvk` (bbin-installed `io.github.filipesilva/invoker`) is a bb script (`#!/usr/bin/env bb`) that writes a temp deps.edn and `process/exec`s a **second** bb with the invoker dep. 2 × ~80ms interpreter boot ≈ the entire measured cost. Identical in a terminal and from Talon — the subprocess layer is innocent.

**The lever:** invoker doesn't work in those processes. It connects to the existing nREPL via `.nrepl-port` and evaluates there, `add-lib`ing itself into that process on first use. So `invoker.utils/cli/http/repl` are **already loaded in the daemon you hold a socket to**:

```clojure
(let [[v raw]     (invoker.utils/parse-var-and-args
                    ((requiring-resolve 'babashka.process/tokenize) params))
      [args opts] (invoker.utils/parse-raw-args v raw)]
  (invoker.utils/dispatch v (cond-> args (seq opts) (conj opts))))
```

**Call invoker's own parser — never paren-wrap the CLI string.** `babashka.cli/auto-coerce` makes bare words **strings** (`hello` → `"hello"`, not a symbol), `:a 3` / `--a 3` / `--a=3` become a trailing opts map, and `dispatch` **derefs** value/atom vars instead of calling them. A naive `(ns/fn args…)` breaks on all three.

Verified 12 cases identical (only diff: nvk pprints, socket `pr-str`s). Dep is add-lib'd, not baked in — fall back to the CLI if `invoker.utils/dispatch` doesn't resolve.
