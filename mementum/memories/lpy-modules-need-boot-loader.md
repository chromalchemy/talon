❌→✅ Pure-Basilisp action modules silently vanished on every Talon restart — boot never imported them.

Found 2026-06-11 during brain spike: after a clean Talon restart, `ryan.roam.roam` (67 actions) and all other .lpy modules were NOT in sys.modules — every defaction-registered action was gone. The watcher only (re)imports on *save*; nothing imported .lpy at boot. The roam migration had only ever been verified through live reloads, so the gap was invisible.

Fix: `load_all_lpy()` in lisp/00_boot.py — walk USER_ROOT for *.lpy (pruning dot/_ dirs and node_modules), map via `_module_name_for`, import each with bytecode-writing + quiet-analyzer context, skip if already in sys.modules (idempotent across Talon's reloads of boot). Runs after watcher start. Per-module failures print and continue.

🔁 Lesson: "verified via live reload" ≠ "survives restart". Any registration that lives in a dynamically-loaded module needs an explicit cold-boot path, and the canary test must include a full app restart ("basil roam test" after quitting Talon).

Side effect: boot-loading tlisp.brain fires its defonce pre-warm thread, so the JVM brain comes up at Talon boot.
