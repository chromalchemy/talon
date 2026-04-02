app.name: Roam Research 
mode: command
-

show [block] hats | [block] hats show | [block] hats on: 
    user.roam_fn("(hats-on!)")

hide [block] hats | [block] hats off :
    user.roam_fn("(hats-off!)")

## ++++++++++++++++++++++++++++ edit block

(go) <user.letters>:
    user.roam_fn("(select! [:{letters}] {{:edit true}})")

## +++++++++++++++++++++ select blocks .

(take) <user.letters>:
    user.roam_fn("(select! [:{letters}])")

# use edit block, then esc to select block with real ui mechanism, so can move block after
(take) <user.letters> (classic) | (hard take) <user.letters> :
    user.roam_fn("(select! [:{letters}] {{:edit true}})")
    sleep(800ms)
    key(esc)

(take) <user.letters> and <user.letters>:
    user.roam_fn("(select! [:{letters_1} :{letters_2}])")

((take) (add | ad | also) | (add | ad | also) take) <user.letters>:
    user.roam_fn("(select-add! [:{letters}])")

(un take | not take | take not | unselect | remove from [block] selection ) <user.letters> | remove <user.letters> from selection:
    user.roam_fn("(select-remove! [:{letters}])")

## ++++++++++++++++++++++++ fold block .

(fold | expand) <user.letters> :
    user.roam_fn("(fold! [:{letters_1}])")

(unfold | collapse) <user.letters> :
    user.roam_fn("(unfold! [:{letters_1}])")

## ++++++++++++++++++++++++ zoom block .

zoom (out | parent) block | go (parent | parents | parens):
    user.roam_fn("(zoom-out!)")

zoom [block] <user.letters> :
    user.roam_fn("(zoom! :{letters_1})")

zoom parent [block] [of] <user.letters> :
    user.roam_fn("(zoom-parent! :{letters_1})")

## +++++++++++++ open block in sidebar .

(bar | sidebar) <user.letters> | open <user.letters> in (bar | sidebar):
    user.roam_fn("(open-sidebar! :{letters_1})")

## ++++ move block to first/last child .

[<user.roam_position>] child <user.letters> :
    user.roam_fn("(reorder! [:{letters_1}] {roam_position or ':last'})")

## ++++++++++++++++++++++++ move block(s) .
## Source: label (A), ref name (agenda), or "selected"
## Target: label, page name, or ref name
## Position: top/first/bottom/last (child), before/after (sibling)
## Mode: alias (move + leave ref behind), link (ref only, don't move)
##
## "move A to D"              → (move! {:labels [:A]} {:label :D})
## "move A to D top"          → (move! {:labels [:A]} {:label :D} {:order :first})
## "move A to D after"        → (move! {:labels [:A]} {:after :D})
## "move A to D alias"        → (move! {:labels [:A]} {:label :D} {:alias true})
## "move A to D link"         → (link! {:labels [:A]} {:label :D})
## "move selected to D"       → (move! {:selected true} {:label :D})
## "move agenda to D"         → (move! {:source-uid "CGDDdKiFq"} {:label :D})

move <user.roam_source> to <user.letters> [<user.roam_position>] [<user.roam_move_mode>]:
    user.roam_move_or_link(roam_source, ":label", letters, roam_position or "", roam_move_mode or "")

## ++++++++++++++++++++++ move to page .

move <user.roam_source> to {user.roam_tag} [<user.roam_position>] [<user.roam_move_mode>]:
    user.roam_move_or_link(roam_source, ":page", roam_tag, roam_position or "", roam_move_mode or "")

## +++++++++++++++++++++++ move to ref .

move <user.roam_source> to {user.roam_ref} [<user.roam_position>] [<user.roam_move_mode>]:
    user.roam_move_or_link(roam_source, ":uid", roam_ref, roam_position or "", roam_move_mode or "")

## ++++++++++++++++++++++ delete block .

(delete | chuck) <user.letters>:
    user.roam_fn("(delete! [:{letters}])")
