---
type: 💡
symbol: 💡
title: nriley's community plugins need nriley's talon-axkit fork
related: [talon-reload-signature-change-zombie-context]
---
💡 nriley's community repo (`~/.talon/repos/nriley`) calls actions that
only his **AXKit fork** defines: `github.com/nriley/talon-axkit`, default
branch `nriley` (not `main`, and not phillco/talon_axkit). Example:
`user.focused_element_safe` (`inspect.py`), used by `plugin/menu_select`
and `core/dynamic_ui`. His commits say "(from AXKit)" but mean the fork.

A missing action is a runtime error, not a load error, so a copied plugin
looks fine until that code path runs. The earlier local workaround, a
hand-written `menu_select_helpers.py`, also re-declared an action that
already existed and never ran.

When copying an nriley plugin:
1. `grep -ohE "actions\.user\.[a-z_]+" <plugin>/*.py | sort -u`
2. Check each name against the live registry via :7891
   (`(.-actions (.-decls (.-registry talon)))`).
3. If one is missing, search nriley's forks (`gh repo list nriley`).
   GitHub code search skips forks.

Since 2026-11-07, `user/talon_axkit` merges `nriley/nriley` (remote
`nriley`) on top of phillco's main and the local commits.
