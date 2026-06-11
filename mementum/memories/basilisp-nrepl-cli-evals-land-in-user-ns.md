💡 `clj-nrepl-eval` CLI sends no ns with eval requests → basilisp nREPL
evals all run in `user`, and basilisp's `(eval form a-namespace)` arity does
NOT redirect interning (`defn` interns via `*ns*`, not the namespace arg —
that arg only sets exec globals).

To redefine into a namespace from the CLI:

    (binding [*ns* (the-ns 'tlisp.demo)]
      (eval '(defn hello [text] ...)))

Symptom of getting it wrong: var lands as `#'user/hello` and import aliases
like `app/notify` fail to resolve ("unable to resolve symbol ... in this
context") — the alias error is a wrong-ns symptom, not a missing import.
Editor clients (Calva/CIDER) send ns per eval and don't hit this.
`(load-file "/abs/path.lpy")` is the simple alternative for whole-file sync.
