🔁 Visible feedback for pure-Basilisp Talon actions: add a `notify!`
helper, don't reach for the `talon` module.

`ryan/roam/roam.lpy` binds only `actions` (= `talon.actions`), not the
`talon` module — so `brain_demo.lpy`'s `(.notify (.-app talon) ...)`
won't compile there. Get the app module the same way `roam.lpy` gets
actions (importlib sidesteps the top-level `:import` alias-munging bug):

```clojure
(def ^:private app-mod (.-app (importlib/import-module "talon")))
(defn- notify! [title body] (.notify app-mod title body))
```

`talon.app.notify(body, subtitle)` → two positional args = title+body
toast. Helper now sits beside `key!`/`sleep!`/`insert!`, reusable by any
roam action.

Applied to the `roam-basil-test` canary (2026-08-16): it was
`println`-only, which is exactly why it "looked like a no-op" — no
on-screen proof it fired (same trap the brain test already fixed). Now
it toasts "basil roam ✓".

🎯 Lesson: a smoke test with no visible output isn't a smoke test —
`app.notify` beats `println` for anything a human verifies by voice.
Live-redef via `(binding [*ns* (the-ns 'ryan.roam.roam)] (eval '...))`
on :7891 applied it without a reload.
