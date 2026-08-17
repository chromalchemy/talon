❌ zsh history-expands `!` inside double quotes → `bb eval "(foo!)"` fails with `event not found`

**Symptom:** From an interactive zsh terminal,
`bb eval "(set-default-brush!)"` errors with `zsh: event not found`.
The command never reaches `bb` — zsh's history expansion fires first.

**Mechanism:** In interactive zsh, `!` triggers **history expansion
even inside double quotes** (unlike bash, where `""` mostly suppresses
it). `!)` is read as a history event reference, none matches → abort.
Single quotes suppress it entirely; so does a non-interactive shell
(which is why the same command run via an agent's tool shell — histexpand
off — succeeds while the user's terminal fails).

**Why this bites constantly here:** Clojure's mutation convention ends
side-effecting fns in `!` — `select-brush!`, `stroke!`, `draw-line!`,
`fast-dry!`, `clear-layer!`, `set-default-brush!`. Every voice-loop /
REPL-CLI repo (rebelle-api `bb eval`, tmem bridge, brain) hits this.

**Fix — single-quote all REPL-CLI args:**
```zsh
bb eval '(set-default-brush!)'          # ✅ correct
bb eval "(set-default-brush!)"          # ❌ event not found
bb eval "(set-default-brush\!)"         # ⚠️ works but ugly (escaped)
```
Standing rule: **single-quote every `bb eval` / nrepl CLI expression.**
Bonus: single quotes also avoid `$`, backtick, and glob surprises.

**Future me:** if a user reports `event not found` (or a mangled
command) running a Clojure CLI eval, it's the bang + double quotes.
Tell them to single-quote. Don't touch their shell config.
