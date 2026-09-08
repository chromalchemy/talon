---
title: rebelle-api — Clojure/Babashka bridge to Rebelle 8's MotionIO WebSocket
status: active
category: workstream
tags: [rebelle, babashka, websocket, talon, clojure, nrepl, voice]
related: [basilisp-talon, tmem-roam-bridge]
depends-on: []
---

# rebelle-api

A **babashka** script that drives Rebelle 8 (Escape Motions' painting
app) over its **MotionIO WebSocket API**, exposed to a growing set of
**Talon voice commands**.

- Repo: `~/dev/rebelle-api` (flat, no `src/` — `main.clj`,
  `motion_io.clj`, `deps.edn`, `bb.edn`, `launch-rebelle.bash`)
- Talon side: `~/.talon/user/ryan/rebelle/` (many `.talon` grammars +
  `rebelle.lpy`; `rebelle.py` retired → `.migrated-to-lisp`)
- MotionIO API docs:
  https://www.escapemotions.com/products/rebelle/motionio_doc/

## Architecture

Two layers in `main.clj` (this split is clean — preserve it):

1. **Event builders** — pure fns returning Clojure maps. E.g.
   `(new-artwork {...})`, `(set-brush {...})`, `(color r g b)` /
   `(color "RRGGBB")`, `(pointer-press x y)`, `(fast-dry)`. No I/O.
2. **Action fns** — end in `!`, call `send-command!` internally. E.g.
   `select-brush!`, `change-color!`, `stroke!`, `draw-line!`,
   `draw-circle!`, `fast-dry!`, `set-default-brush!`. **These
   self-send** — do NOT wrap them in another sender.

**Transport:** persistent WebSocket to `ws://[::1]:8265` (IPv6 localhost
form flagged "critical" in code). `send-command!` JSON-encodes with
`camel-snake-kebab` so `:event-type "SET_BRUSH"` → `{"event_type":
"SET_BRUSH"}`. Optional `expect-response?` arg waits (5s) on a promise.

**Launch Rebelle with the server on:** `bb app` (bb.edn task) →
`Rebelle 8 -websocket-server-enable -websocket-port 8265
-websocket-allowed-ip-addresses 172.20.10.7,127.0.0.1`.

**`motion_io.clj` is a SEPARATE, offline path** — runs `Rebelle 8
Motion IO.app` headless with `-batch-json`/`-batch-out-rgba` to render a
PNG. Not part of the live WebSocket loop.

## The live loop — nREPL on :7888

`main.clj` starts its own **babashka nREPL on port 7888** and writes
`.nrepl-port`. This is the surface Talon commands and CLI drive.

⚠️ **Cross-repo note:** state.md said 7891 was chosen because "7888 was
taken by an unrelated java nREPL." That "unrelated" server is almost
certainly *this* rebelle-api bb nREPL (bb, not java). Reconcile if it
resurfaces.

## Entry points (current as of 2026-09-08)

The Talon layer is `ryan/rebelle/rebelle.lpy` (Basilisp; `rebelle.py`
retired 2026-08-17). **The socket is the default path** — everything
else is a fallback:

| Entry | Cost | Notes |
|---|---|---|
| `nrepl/eval-async!` / `value!` on the persistent `:7888` client | ~0–7ms | `rebelle-eval`, `rebelle-cmd`, `rebelle-nrepl-eval`; `{:ns "main"}` per message, no shell, no escaping |
| invoker over that same socket | ~7ms | `invoker-clj-eval`; see below |
| `nvk <params>` subprocess | ~170ms | `sh-invoker!` fallback |
| `bb eval '<expr>'` (bb.edn task) | ~170ms | `sh-bb-eval!`; **auto-wraps** `(do (in-ns 'main) …)` |
| `clj-nrepl-eval -p 7888` | ~70ms | `sh-nrepl-eval!`; lands in `user` ns — wrap in `(in-ns 'main)` |

Shell fallbacks no longer go through `user.system_command_nb` (it
blocks); they use local `sh!` / `sh-detached!` wrapping `subprocess`
with an argv vector + `:cwd`. Memory:
`lpy-shell-out-detached-subprocess`.

### `invoker-clj-eval` — CLI ergonomics at socket speed
`nvk` costs 2× babashka boot, but invoker **evals in this very daemon**
(it `add-lib`s itself in on first use), so `invoker.utils` is already
loaded on `:7888`. The action calls invoker's own
`parse-var-and-args` → `parse-raw-args` → `dispatch` over the socket:
20× faster with byte-identical semantics (auto-coerce, `:k v`/`--k v`
opts, atom deref). Falls back to the `nvk` subprocess if the daemon
lost the dep. **Do not hand-roll the arg parsing** — bare words coerce
to *strings*, and value vars are deref'd, not called. Memory:
`nvk-invoker-evals-in-your-nrepl`.

### Launching the app
`launch-rebelle-app` (voice: "power launch rebelle",
`ryan/rebelle/launch.talon`, deliberately **not** `app.name`-scoped —
Rebelle isn't frontmost yet) spawns the binary directly, detached, with
the websocket flags as an argv vector. It no longer goes through the
`bb app` task, so no bb parent lingers. ⚠️ The flags are now duplicated
in `rebelle.lpy` and `bb.edn` — keep them in sync or retire the task.

### Footgun 1 — zsh history-expands `!` inside double quotes
Clojure mutation fns end in `!`. In interactive zsh, `"(foo!)"`
→ `zsh: event not found` (history expansion fires even in double
quotes). **Fix: single-quote everything.** Memory:
`zsh-histexpand-breaks-bang-fns-in-double-quotes`.

### Footgun 2 — evals default to the `user` namespace
Fns live in `main`. `bb eval` hides this by auto-wrapping in
`(in-ns 'main)`, but `clj-nrepl-eval` does NOT. So:
```zsh
# WRONG: Unable to resolve symbol: set-default-brush!
clj-nrepl-eval -p 7888 "(set-default-brush!)"
# RIGHT — heredoc (no shell escaping) + explicit ns:
clj-nrepl-eval -p 7888 <<'EOF'
(in-ns 'main)
(set-default-brush!)
EOF
```
The clj-nrepl-eval **session is persistent per port**, so once you
`(in-ns 'main)` it stays in `main` until the bb server restarts —
subsequent calls can be bare `clj-nrepl-eval -p 7888 '(foo!)'`.
(`-p` is the valid short form of `--port`.) Same root cause as memory
`basilisp-nrepl-cli-evals-land-in-user-ns` (that was :7891 Talon).

### Footgun 3 — the Talon↔Clojure contract is unenforced (drift)
`rebelle_fn` shells an arbitrary Clojure string with zero validation.
Nothing stops the voice layer referencing a fn that doesn't exist in
`main.clj`; you only find out at voice-time via a log traceback.
**Recurring drift bugs (this surface is actively churning):**
- `rebelle_fn` wrapped its arg in `(send-rebelle-command …)` — a
  phantom symbol (real sender is `send-command!`) → `Unable to resolve
  symbol`. AND the wrapper was wrong: `set-default-brush!` is a
  self-sending action, not a builder.
- Later revision renamed the action `rebelle_fn` → `rebelle_cmd` and
  wraps in `(send-command …)` — **still drifted**: main.clj defines
  `send-command!` (with bang), so `send-command` won't resolve either.
  And `brush.talon` still calls the now-removed `user.rebelle_fn`.

**Two coherent designs — pick one and keep the layers consistent:**
- **A (action passthrough):** grammar passes a complete `!`-action;
  the Talon action evals it directly, no wrapper. (What
  `bb eval '(set-default-brush!)'` proved works.)
- **B (builder + sender):** grammar passes a *builder* map form; the
  Talon action wraps in `(send-command! …)` — note the **bang**.
Mixing them (wrap an action, or drop the bang) is the drift trap.

## Known code smells (unfixed — verify intent before trusting)

1. **Racy response correlation.** The MotionIO API carries no command
   id, so `on-message` delivers each response to `(apply max (keys
   @pending-commands))` — the most-recent pending command. Fine for
   serial voice input; mis-delivers under any concurrency. `send-command!`
   generates internal ids but they can't be matched to responses.
2. **`stroke!` sends press→move→release TWICE** (duplicated block).
   Likely a workaround (Rebelle needing a doubled stroke to register?)
   or leftover bug. Confirm before relying on it.

## Debug recipe: "voice command does nothing / errors"
1. `tail -F ~/.talon/talon.log` — the `rebelle_eval` action `print()`s
   the exact shell command; you'll see the `bb eval '…'` and any
   `clojure.lang.ExceptionInfo`.
2. `Unable to resolve symbol: X` → drift: the `.py`/`.talon` layer names
   a fn not in `main.clj`. Grep `main.clj` for the real name.
3. `.talon` file header: `app.name: Rebelle 8` scopes ALL commands in
   the file to Rebelle being frontmost (memory
   `talon-app-name-context-scopes-whole-file`).

## Open candidates
- Fix or document the racy correlation (needs an API id, or serialize).
- Resolve the doubled-`stroke!` mystery.
- Consider a thin contract/guard so `rebelle_fn` can't call phantom fns.
- Decide whether to record rebelle-api's :7888 in state.md's port map.
- De-duplicate the websocket launch flags (`rebelle.lpy` vs `bb.edn`).
- Untested: does the `nvk` fallback actually restore invoker after a
  *daemon restart*? (`add-lib` was a no-op when I faked absence with
  `ns-unmap`.) Worst case is the old ~170ms path, so it's not urgent.
- `invoker-clj-eval` has no caller — only a commented-out line in
  `brush/brush.talon`. Keep as the fallback bridge or delete?
