❌ In-process JVM inside Talon is a hard no-go on macOS — killed empirically in one dlopen.

Spike 2026-06-11: via Basilisp nREPL (port 7891), `ctypes.CDLL` of arm64 Temurin 18 libjvm.dylib inside Talon's process → dlopen error: "code signature … not valid for use in process: mapping process and mapped file (non-platform) have different Team IDs".

Cause: Talon.app has hardened runtime (`flags=0x10000(runtime)`) with `allow-jit` and `allow-unsigned-executable-memory` but **no `com.apple.security.cs.disable-library-validation`** → library validation rejects any non-Apple dylib signed by a different Team ID. All JDKs (Temurin/Oracle/Homebrew) fail this. cljbridge/libpython-clj embedded mode is therefore impossible without re-signing Talon (loses TCC grants + updates) or disabling SIP/AMFI — not worth it.

Consequence: "JVM Clojure as dominant orchestrator" must use the external-brain pattern — external JVM process + thin Basilisp RPC shim (see basilisp-vs-libpython-clj-for-talon, tmem bb-bridge precedent on port 6888).

Reusable technique: failed dlopen is a safe, 10-minute kill-shot for any "embed X into closed app" idea — check entitlements first (`codesign -d --entitlements`).
