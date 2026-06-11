---
title: External JVM brain for Talon
status: active
category: architecture
tags: [basilisp, talon, jvm, nrepl, brain]
related: [basilisp-talon]
depends-on: [basilisp-talon]
---

# External JVM brain for Talon

JVM Clojure as Talon's "external brain": full Java/Clojure ecosystem
available to voice actions, without embedding a JVM in Talon.

## Why not in-process

- libpython-clj/cljbridge embedded mode is **impossible**: Talon has
  hardened runtime without `disable-library-validation`; dlopen(libjvm)
  fails with "different Team IDs". Killed empirically in one call.
  Memory: `in-process-jvm-in-talon-blocked-by-library-validation`.
- Full analysis: memory `basilisp-vs-libpython-clj-for-talon`.
- Architecture is two nREPLs pointed at each other: Basilisp serves
  Talon state on **:7891**; JVM serves Java capabilities on **:7892**.
  Boundary is by-value EDN, fine for command-shaped APIs.
  Pattern memory: `nrepl-server-in-host-app-pattern` (3rd instance
  after Photoshop scittle + Roam bb bridge).

## Components

| Piece | Where |
|---|---|
| JVM project (deps.edn, nREPL :7892, sha256 demo) | `~/dev/talon-brain` (own git repo) |
| Uberjar build | `clojure -T:build uber` → `target/brain.jar` |
| Basilisp shim (bencode client) | `~/.talon/user/lisp/tlisp/brain.lpy` |
| Demo action + voice rule ("brain test") | `~/.talon/user/ryan/brain/brain_demo.{lpy,talon}` |
| Brain stdout log | `~/.talon/talon-brain.log` |

## Shim API (tlisp.brain)

- `(call! 'ns/fn arg ...)` — RPC: args quoted+EDN'd over, return value
  EDN-read back into Basilisp data. Throws on error.
- `(value! code-str)` / `(eval! code-str)` — string-level, never throws
  (`{:error ...}` when brain down).
- `(alive?)`, `(start!)`, `(close!)`.
- `(interrupt!)` — kills the in-flight eval (hung Java call) from any
  thread WITHOUT dropping the connection. Verified: 60s sleep killed in
  1.7s, connection still live.
- Persistent socket, TCP_NODELAY, reconnect-once. Wire format via
  **basilisp.contrib.bencode** (ships with Basilisp; same impl as the
  :7891 server) — replaced an earlier hand-rolled bencode. Costs ~2-3ms
  vs hand-rolled stream reads (median ~9ms vs ~7ms): accepted, prefer
  Basilisp-shipped infrastructure.
- Protocol hygiene per nrepl.org building-clients doc: clones a session
  at connect, all evals carry session+id, response loop filters by id
  (so interrupt acks on the shared socket don't confuse it). Evaluated
  cemerick/nrepl-python-client as alternative: rejected (unmaintained
  ~2015, new venv dep for ~60 working lines).

## Lifecycle

- Pre-warm: defonce daemon thread in brain.lpy runs `start!` at module
  load (so at Talon boot, via load_all_lpy).
- Auto-resurrect: `eval!` connect failure → spawn detached
  `java -jar target/brain.jar` (fallback `clojure -M:brain`), poll port
  ≤20s, retry. Brain survives Talon restarts (detached).
- Numbers: cold start 0.58s (jar; was 11.4s via clojure CLI), first
  call ~120ms (JIT), steady median 3.6–6.8ms/eval — nREPL server
  overhead, not transport. Voice-invisible.

## Gotchas (hard-won)

1. **lsof kill**: `lsof -ti :7892` lists BOTH ends — Talon holds the
   client socket; `| xargs kill` kills Talon. Always `-sTCP:LISTEN`.
2. **Boot loader**: .lpy modules are NOT auto-imported; without
   `load_all_lpy()` in 00_boot.py all pure-Basilisp actions vanish on
   restart. Memory: `lpy-modules-need-boot-loader`. Verify changes with
   a full Talon quit/relaunch, not just live reload.
3. nREPL eval of `(do (require ...) (alias/fn ...))` fails — analysis
   resolves symbols before require runs; eval require separately, or
   just use fully-qualified symbols (module is boot-loaded anyway).
   Related: `(local/attr ...)` on a let-bound Python module is analyzed
   as a namespace lookup — use `((.-attr local) ...)`.
4. Don't guess `talon.*` internals for registry checks — call through
   `(.-user (.-actions talon))`.
5. Rebuild the jar after changing brain src (`clojure -T:build uber`),
   else the shim resurrects stale code.

## Open

- Move brain port/dir to config instead of constants in brain.lpy.
- Brain has no supervision beyond resurrect-on-call; fine so far.
- Real Java-lib use cases: replace sha256 demo with actual needs
  (candidates: Datalevin, JVM-only libs, absorbing the bb roam bridge
  on :6888 into the brain).
- Voice double-check pending: "basil roam test" + "brain test".
