🎯 Basilisp vs libpython-clj for Talon scripting — Basilisp wins for in-process; JVM belongs outside.

Talon is a closed app that owns an embedded CPython, so Python is the immovable host. Basilisp compiles to Python bytecode: native `talon.actions` access, runs on the calling Talon thread, zero bridge cost, survives via pip in Talon's venv.

libpython-clj's relevant mode is the inverted one (cljbridge: Python host boots a JVM in-process via JNI; bridge is bidirectional, JVM Clojure can hold live Talon objects). A "JVM as dominant orchestrator" architecture is possible: thin shim registers actions, JVM owns logic/state/ecosystem/real-threads. Risks: GIL↔JVM-thread re-entry (UI calls need Talon main thread), two GCs coupling object lifetimes (rctx!), macOS hardened-runtime may block loading libjvm into Talon.app at all, crash blast radius, JVM boot per launch, JNI fragility on every Talon upgrade.

Key reframe: orchestrator-dominance doesn't need embedding. External JVM Clojure + thin Basilisp RPC shim (tmem bb-bridge pattern, port 6888) gets ~95% of the value with process isolation. Verdict: Basilisp = in-process nervous system; JVM = external brain.
