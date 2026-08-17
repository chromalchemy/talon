🎯 clj-kondo on .lpy: suppress the linters, do NOT `:lint-as defn`.

Basilisp ships no clj-kondo config (verified: 0 kondo/lint/edn files in
the whole basilisp-lang/basilisp tree). clj-kondo has no model of .lpy —
`tlisp.talon/defaction` names, `[arg :- python/type := default]`
gradual-type params, and interop nses (python/str, importlib) all read
as unresolved.

Empirically tested against rebelle.lpy:
- `:lint-as {tlisp.talon/defaction clojure.core/defn}` → **WORSE**
  (12 → 15 errors): clj-kondo rejects `:- python/str` as an
  "unsupported binding form" + bogus arity errors. This is the param
  munging tracked at basilisp-lang/basilisp#1212.
- Suppress the two dialect linters → **0/0, clean**:
  ```
  {:linters {:unresolved-symbol    {:level :off}
             :unresolved-namespace {:level :off}}}
  ```

Full recipe (matches slack guidance from basilisp maintainers):
1. `.clj-kondo/config.edn` with the suppression above (NB: an empty
   0-byte config.edn breaks EVERY kondo run — "EOF while reading").
2. blank `deps.edn` (`{}`) → tree recognized as a Clojure project by
   clojure-lsp/Calva.
3. Calva: associate `*.lpy` with `clojure` (editor setting).

Tradeoff: unresolved-symbol off is tree-wide (fine here — no vanilla
.clj). A defaction clj-kondo hook would be the surgical-but-heavy
alternative if real .clj ever lands. Applies to every future
.py→.lpy migration.

⚠️ `.clj-kondo/` is gitignored in this tree (.gitignore:4), so
config.edn does NOT survive a fresh checkout — re-apply step 1 on a new
machine/clone or the false positives return. deps.edn IS tracked.
