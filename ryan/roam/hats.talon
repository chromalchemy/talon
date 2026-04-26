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

## +++++++++++++++++++++ select blocks (PHASE E composable) .

(take | mark) <user.roam_target>:
    user.roam_action("setSelection", roam_target)

# Two-letter list (multi-mark setSelection)
(take) <user.letters> and <user.letters>:
    t1 = {"type": "primitive", "mark": {"type": "label", "value": letters_1.upper()}}
    t2 = {"type": "primitive", "mark": {"type": "label", "value": letters_2.upper()}}
    user.roam_action("setSelection", {"type": "list", "elements": [t1, t2]})

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

(fold | expand) <user.roam_target>:
    user.roam_action("collapse", roam_target)

(unfold | collapse) <user.roam_target>:
    user.roam_action("expand", roam_target)

# Spoken-form sugar: "fold children of A" → collapse with every:child modifier.
# Equivalent to "fold every child of A" via the generic rule above.
(fold | expand) (children | kids) [of] <user.letters>:
    target = {"type": "primitive",
              "mark": {"type": "label", "value": letters.upper()},
              "modifiers": [{"type": "every", "scope": "child"}]}
    user.roam_action("collapse", target)

(unfold | collapse) (children | kids) [of] <user.letters>:
    target = {"type": "primitive",
              "mark": {"type": "label", "value": letters.upper()},
              "modifiers": [{"type": "every", "scope": "child"}]}
    user.roam_action("expand", target)

## ++++++++++++++++++++++++ zoom block (PHASE E composable) .

# zoom out to current page (cursor → containing page)
(zoom | load) (out | (parent | parents | parens) [of] (top | root) [block] | top | root):
    target = {"type": "primitive", "mark": {"type": "cursor"},
              "modifiers": [{"type": "containing", "scope": "page"}]}
    user.roam_action("zoom", target)

# generic zoom: letter | ref | tag | daily | pronoun, with optional modifier chain
(zoom | load) <user.roam_target>:
    user.roam_action("zoom", roam_target)

# Day-relative zoom (preserves legacy spoken forms)
(zoom | load) (forward | next) day $:
    user.roam_action("zoom", {"type": "primitive", "mark": {"type": "daily", "value": "next-day"}})

(zoom | load) (back | previous | prev | last) day $:
    user.roam_action("zoom", {"type": "primitive", "mark": {"type": "daily", "value": "prev-day"}})

(zoom | load) (forward | next | plus) <number_small> [days]:
    user.roam_action("zoom", {"type": "primitive", "mark": {"type": "daily", "value": number_small}})

(zoom | load) (back | previous | minus) <number_small> [days]:
    user.roam_action("zoom", {"type": "primitive", "mark": {"type": "daily", "value": -number_small}})

## +++++++++++++ open block in sidebar (PHASE E composable) .

(bar | sidebar) <user.roam_target>:
    user.roam_action("openInSidebar", roam_target)

# Legacy spoken form preserved for muscle memory
open <user.letters> in (bar | sidebar):
    target = {"type": "primitive", "mark": {"type": "label", "value": letters.upper()}}
    user.roam_action("openInSidebar", target)

## ++++ move block to first/last child (PHASE E composable) .
## moveToTarget / linkToTarget / aliasMove via composable destination AST.

# Single-list reorder: "move A to first" / "alias selected to last" / "B to start"
# → moveToTarget src=<target> dest={to + position:start|end + parent-of-source}.
# Bridge.clj's implicit destination for moveToTarget is exactly this shape, so
# we let it default when no destination is spoken.
[move] <user.roam_target> [to] (first | start | top) $:
    parent_dest = dict(roam_target)
    parent_dest["modifiers"] = list(parent_dest.get("modifiers", [])) + [
        {"type": "containing", "scope": "parent"},
        {"type": "position", "at": "start"}]
    dest = {"type": "destination", "insertionMode": "to", "target": parent_dest}
    user.roam_action_pair("moveToTarget", roam_target, dest)

[move] <user.roam_target> [to] (last | end | bottom) $:
    parent_dest = dict(roam_target)
    parent_dest["modifiers"] = list(parent_dest.get("modifiers", [])) + [
        {"type": "containing", "scope": "parent"},
        {"type": "position", "at": "end"}]
    dest = {"type": "destination", "insertionMode": "to", "target": parent_dest}
    user.roam_action_pair("moveToTarget", roam_target, dest)

# Full transfer: "move/link/alias <target> to <destination>"
# Destination grammar: {to|before|after} [start of|end of] <target>.
<user.roam_transfer_verb> <user.roam_target> <user.roam_destination>:
    action_name = {":move": "moveToTarget",
                   ":link": "linkToTarget",
                   ":alias": "aliasMove"}[roam_transfer_verb]
    user.roam_action_pair(action_name, roam_target, roam_destination)

## ++++++++++++++++++++ nudge block (PHASE E composable) .

[nudge] <user.letters> <user.roam_direction>:
    target = {"type": "primitive", "mark": {"type": "label", "value": letters.upper()}}
    user.roam_nudge(target, roam_direction[1:])

[nudge] block <user.roam_direction>:
    user.roam_nudge({"type": "implicit"}, roam_direction[1:])

## ++++++++++++++++++++++++++ swap blocks (PHASE E composable) .

swap <user.letters> [and | with] <user.letters>:
    t1 = {"type": "primitive", "mark": {"type": "label", "value": letters_1.upper()}}
    t2 = {"type": "primitive", "mark": {"type": "label", "value": letters_2.upper()}}
    user.roam_swap(t1, t2, False)

swap content <user.letters> [and | with] <user.letters>:
    t1 = {"type": "primitive", "mark": {"type": "label", "value": letters_1.upper()}}
    t2 = {"type": "primitive", "mark": {"type": "label", "value": letters_2.upper()}}
    user.roam_swap(t1, t2, True)

## ++++++++++++++++++++++ delete block (PHASE E composable) .

(delete | chuck) <user.roam_target>:
    user.roam_action("remove", roam_target)
