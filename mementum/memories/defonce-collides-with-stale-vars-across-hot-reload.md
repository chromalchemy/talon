❌ Hot-reload + defonce trap (Basilisp/Talon, bitten 2026-08-17
during the tlisp.nrepl extraction): reusing a var name for a
different kind of value across a refactor is unsafe under watcher
reloads — vars survive reload, so `defonce` keeps the STALE binding.

What happened: pre-refactor brain.lpy had `(defn- conn [] ...)`. The
refactor replaced it with `(defonce ^:private conn (nrepl/client ...))`.
On hot reload, defonce saw `conn` already bound (to the old FN) and
no-op'd → `@conn` blew up two layers down with "Object of type
<class 'function'> cannot be dereferenced".

Rules:
1. New kind of value ⇒ new var name (conn → brain-conn), OR
   `(ns-unmap 'the.ns 'old-var)` live before reloading.
2. Only a full Talon restart truly clears a namespace's old vars —
   watcher reloads and nREPL `:reload` both accrete.
3. Symptom signature: type errors deep inside code that "can't even
   be running anymore". Before blaming the new code, check whether an
   old var is shadowing the new def (`(type the-var)` via :7891).

Same family as basilisp-direct-linking-freezes-intra-ns-redefs: both
are "the live image remembers more than the file says" bugs.
