🎯 python-nrepl-client-libs-rejected-for-lpy

Both **cemerick/nrepl-python-client** (rejected `7492a2e` shim hardening)
and its community fork **clojure-vim/nrepl-python-client** (re-evaluated
2026-08-17) are a no-go for `lisp/tlisp/nrepl.lpy`. Same verdict, four
reasons:

1. **Wrong language direction** — the workstream migrates Talon
   scripting *to* Basilisp; a Python nREPL client reverses it.
2. **Violates `prefer-basilisp-shipped-infrastructure`** — the library
   ships a hand-rolled `bencode.py`; `7492a2e` deliberately moved us
   onto `basilisp.contrib.bencode` (same impl as the :7891 server).
3. **3.14t maintenance tax** — every Talon Python bump forces pure-Python
   reinstalls into site-packages. `nrepl.lpy` adds ZERO Python deps
   (basilisp + stdlib socket/threading).
4. **Parity already inverted** — `nrepl.lpy` has reconnect-once + `:ensure!`
   (auto-boots the brain JVM), `interrupt!`, per-client lock, never-throws,
   `eval-async!`; the library's synchronous `connect()` has none.

The clojure-vim fork is unmaintained (last commit 2018, targets Py 2.7/3.3).

💡 Only borrowable idea (design, not code): `WatchableConnection`'s async
watch + predicate-dispatch model — worth remembering IF we ever stream
`out`/`err` from long-running evals across multiple sessions live (e.g.
brain stdout → app.notify). ~15 lines atop the existing `recv-msg!` loop,
not a reason to pull the dep.
