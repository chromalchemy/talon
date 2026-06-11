🔁 nREPL-server-in-host-app — third instance confirms the pattern.

When a closed app embeds a scriptable runtime, put a guest Lisp + nREPL server *inside* it; external Clojure gets full read/write agency over the host via eval. Instances: Photoshop (Scittle/SCI + scittle.nrepl, driven by `ps-eval` — ~/dev/ps script/plugins/ps-scittle-repl), Roam (bb bridge daemon, port 6888), Talon (Basilisp, port 7891). Boundary is by-value (EDN), not by-reference — fine for command-shaped APIs.

Latency tiers (orders of magnitude apart):
1. Spawn bb / clj-nrepl-eval per call: ~50–150ms — *felt* in the Photoshop integration. Never do this on a hot path.
2. Resident process, fresh TCP connection per call: ~1–5ms.
3. Resident process, persistent connection: ~0.1–1ms — invisible at voice timescales. Required tier for action→brain calls.

Protocol choice: nREPL over socket-REPL/prepl. Batsov's "nREPL forever" survey: every prepl-based tool (Tutkain, Chlorine) grew back into nREPL (request ids, sessions, interrupt). Whole local stack already speaks nREPL; bencode client is ~50 lines.

Shim vocabulary that worked in ps/dev.clj, reuse: eval!, alive?, safe error when brain is down.
