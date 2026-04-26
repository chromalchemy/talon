app.name: Roam Research 
mode: command
-

## +++++++++++++++++++++ debug helpers .

print source <user.roam_source>:
    print("command ran")
    print(roam_source)

## ++++++++++++++++++ show hide labels .

show [block] hats | [block] hats show | [block] hats on: 
    user.roam_fn("(hats-on!)")

hide [block] hats | [block] hats off :
    user.roam_fn("(hats-off!)")

## ++++++++++++++++++++++++++++ edit block .
## (LEGACY — uses :edit true flag, not yet in v1 envelope)

(go) <user.letters>:
    user.roam_fn("(select! [:{letters}] {{:edit true}})")

(make | mark | big) <user.letters>  (todo | to do | task | action): 
    user.roam_fn("(select! [:{letters}] {{:edit true}})")
    sleep(300ms)
    key(cmd-return)
    sleep(100ms)
    key(esc:2)

mark <user.letters> done:
    user.roam_fn("(select! [:{letters}] {{:edit true}})")
    sleep(300ms)
    key(cmd-return)
    sleep(100ms)
    key(esc:2) 
    
make <user.letters> done: 
    user.roam_fn("(select! [:{letters}] {{:edit true}})")
    sleep(300ms)
    key(cmd-return:2)
    sleep(100ms)
    key(esc:2)

## +++++++++++++ generic single-target action (PHASE F) .
## One rule subsumes ~6 single-verb rules. Spoken vocabulary lives in
## ~/.talon/user/roam-vocabulary/roam-actions.csv. Rule shape:
##   {verb} <target>          e.g. "chuck A", "fold every child of B"
## Compound rules (transfers, swaps, two-letter lists, edit-mode legacy,
## moveToPosition, addToSelection, fold-children sugar, etc.) keep
## their own grammar below.

{user.roam_action_verb} <user.roam_target>:
    user.roam_action(roam_action_verb, roam_target)

## +++++++++++++++++++++ select blocks (PHASE E composable) .
## Generic "take A" / "mark A" handled by the action-verb rule above.
## Compound select rules below.

# Two-letter list (multi-mark setSelection)
(take) <user.letters> and <user.letters>:
    t1 = '{:type "primitive" :mark {:type "label" :value "' + letters_1.upper() + '"}}'
    t2 = '{:type "primitive" :mark {:type "label" :value "' + letters_2.upper() + '"}}'
    user.roam_action("setSelection", '{:type "list" :elements [' + t1 + ' ' + t2 + ']}')

# Hard-take variants stay legacy (drop into edit mode then escape)
(take) <user.letters> (classic) | (hard take) <user.letters> :
    user.roam_fn("(select! [:{letters}] {{:edit true}})")
    sleep(800ms)
    key(esc)

((take) (add | ad | also) | (also | and) take | (ad | add) to selected [blocks]) <user.roam_target> | (ad | add) <user.roam_target> to (selection | select | take | selected [blocks]):
    user.roam_action("addToSelection", roam_target)

(un take | not take | take not | unselect | deselect | remove from [block] (selection | select | selected [blocks]) ) <user.roam_target> | remove <user.roam_target> from (selection | select | selected [blocks]):
    user.roam_action("removeFromSelection", roam_target)

## ++++++++++++++++++++++++ fold block (PHASE E composable) .
## NOTE: spoken-form-to-action mapping preserved from legacy:
##   "fold A" / "expand A"   → collapse  (legacy `fold!`)
##   "unfold A" / "collapse A" → expand  (legacy `unfold!`)
## Generic "fold A" handled by the action-verb rule at the top of this
## file (vocabulary in roam-actions.csv). Children-sugar rules below.

# Spoken-form sugar: "fold children of A" → collapse with every:child modifier.
# Equivalent to "fold every child of A" via the generic rule above.
(fold | expand) (children | kids) [of] <user.letters>:
    target = '{:type "primitive" :mark {:type "label" :value "' + letters.upper() + '"} :modifiers [{:type "every" :scope "child"}]}'
    user.roam_action("collapse", target)

(unfold | collapse) (children | kids) [of] <user.letters>:
    target = '{:type "primitive" :mark {:type "label" :value "' + letters.upper() + '"} :modifiers [{:type "every" :scope "child"}]}'
    user.roam_action("expand", target)

## ++++++++++++++++++++++++ zoom block (PHASE E composable) .

# zoom out to current page (cursor → containing page)
(zoom | load) (out | (parent | parents | parens) [of] (top | root) [block] | top | root):
    user.roam_action("zoom", '{:type "primitive" :mark {:type "cursor"} :modifiers [{:type "containing" :scope "page"}]}')

# Generic "zoom A" / "load A" handled by the action-verb rule above.
# Day-relative zoom (preserves legacy spoken forms)
(zoom | load) (forward | next) day $:
    user.roam_action("zoom", '{:type "primitive" :mark {:type "daily" :value "next-day"}}')

(zoom | load) (back | previous | prev | last) day $:
    user.roam_action("zoom", '{:type "primitive" :mark {:type "daily" :value "prev-day"}}')

(zoom | load) (forward | next | plus) <number_small> [days]:
    user.roam_action("zoom", '{:type "primitive" :mark {:type "daily" :value ' + str(number_small) + '}}')

(zoom | load) (back | previous | minus) <number_small> [days]:
    user.roam_action("zoom", '{:type "primitive" :mark {:type "daily" :value ' + str(-number_small) + '}}')

## +++++++++++++ open block in sidebar (PHASE E composable) .
## Generic "bar A" / "sidebar A" handled by the action-verb rule above.

# Legacy "open A in sidebar" phrasing preserved for muscle memory
open <user.letters> in (bar | sidebar):
    user.roam_action("openInSidebar", '{:type "primitive" :mark {:type "label" :value "' + letters.upper() + '"}}')

## ++++ move block to first/last child (PHASE E composable) .
## moveToTarget / linkToTarget / aliasMove via composable destination AST.

# Single-list reorder: "move A to first" / "alias selected to last" / "B to start"
# → moveToTarget src=<target> dest={to + position:start|end + parent-of-source}.
[move] <user.roam_target> [to] (first | start | top) $:
    user.roam_move_to_position(roam_target, "start")

[move] <user.roam_target> [to] (last | end | bottom) $:
    user.roam_move_to_position(roam_target, "end")

# Full transfer: "move/link/alias <target> to <destination>"
# Destination grammar: {to|before|after} [start of|end of] <target>.
# roam_transfer_verb values are ":move"/":link"/":alias" (legacy clj keywords).
move <user.roam_target> <user.roam_destination>:
    user.roam_action_pair("moveToTarget", roam_target, roam_destination)

link <user.roam_target> <user.roam_destination>:
    user.roam_action_pair("linkToTarget", roam_target, roam_destination)

(alias | leave ref | leave alias) <user.roam_target> <user.roam_destination>:
    user.roam_action_pair("aliasMove", roam_target, roam_destination)

## ++++++++++++++++++++ nudge block (PHASE E composable) .

[nudge] <user.letters> <user.roam_direction>:
    user.roam_nudge('{:type "primitive" :mark {:type "label" :value "' + letters.upper() + '"}}', roam_direction[1:])

[nudge] block <user.roam_direction>:
    user.roam_nudge('{:type "implicit"}', roam_direction[1:])

## ++++++++++++++++++++++++++ swap blocks (PHASE E composable) .

swap <user.letters> [and | with] <user.letters>:
    t1 = '{:type "primitive" :mark {:type "label" :value "' + letters_1.upper() + '"}}'
    t2 = '{:type "primitive" :mark {:type "label" :value "' + letters_2.upper() + '"}}'
    user.roam_swap(t1, t2, 0)

swap content <user.letters> [and | with] <user.letters>:
    t1 = '{:type "primitive" :mark {:type "label" :value "' + letters_1.upper() + '"}}'
    t2 = '{:type "primitive" :mark {:type "label" :value "' + letters_2.upper() + '"}}'
    user.roam_swap(t1, t2, 1)

## "delete A" / "chuck A" handled by the action-verb rule at the top.
