💡 `osascript -e 'tell app "X" to quit'` lies about success and side-launches missing apps

**Two related bugs in one pattern. Both bite silently.**

**Bug 1: Exit code is always 0.**
```bash
osascript -e 'tell application "Adobe Photoshop 9999" to quit'; echo $?
# → 0
```
Even when the app name doesn't exist. So you can't tell success from
failure by exit code. `{:continue true}` in a bb `shell` call has
nothing to swallow — it always "succeeds".

**Bug 2: If the app isn't running, `tell app "X" to quit` LAUNCHES it.**
AppleScript's `tell` opens the target app if needed to send the
message. So a "quit" command on a closed app:
1. Launches it (slow, takes seconds, splash screen, the works)
2. Immediately quits it

This is hilarious for Photoshop. Don't do it.

**Fix — guard with `if … is running`:**
```applescript
if application "X" is running then tell application "X" to quit
```
This both avoids the side-launch AND gives you a real no-op when the
app is absent.

**Best practice for "quit if running" wrappers:**
```clojure
(defn quit-app! [name]
  (sh! "osascript" "-e"
       (str "if application \"" name "\" is running "
            "then tell application \"" name "\" to quit"))
  (println "[quit-apps] quit:" name))
```
Add an explicit `println` because osascript's success is uninformative.

**Adobe app name gotchas (cross-reference for future):**
- `Adobe Photoshop (Beta)` — parens are part of the name, must be quoted
- `Adobe UXP Developer Tools` — *with* the trailing `s`; Adobe inconsistently uses both `Tool` and `Tools` across docs
- Year suffixes drift annually; always verify with
  `find /Applications -maxdepth 2 -iname "*photoshop*.app"` before
  hardcoding

**Future me:** when an "app quit" command appears to do nothing, check
whether the app name actually matches an installed app. `osascript`
won't tell you.
