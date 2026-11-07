---
type: 💡
symbol: 💡
title: Hot reload can't change the signature of an action a file both declares and implements
related: [defonce-collides-with-stale-vars-across-hot-reload, nriley-plugins-need-nriley-axkit]
---
💡 If one file declares an action (`mod.action_class`) and implements it
(`ctx.action_class`), and an update changes its parameters, the hot
reload fails. The new Context implementation is type-checked against the
old declaration, which is still registered ("incompatible with
prototype ... Parameter count mismatch"). The import fails and the old
module stays loaded.

It also leaves a zombie `Context(<module>)` holding the old
implementations. Moving the file out and back did NOT clear it: the new
declarations loaded, then the zombie's old implementations failed
"failed type check", and the registry showed 2 implementations per
action. Only a Talon restart cleared it (2026-11-07, talon_axkit
`inspect.py` gaining `max_depth`).

Tells: the `Expected:` line in talon.log shows the old signature, or an
action that only one file defines has 2 implementations.

Before blaming the new code, test the rule with a throwaway probe file
under user/ (Module declaration + Context implementation variants), read
talon.log, then delete it. That showed unannotated `x=None` against
`Optional[int] = None` is fine.
