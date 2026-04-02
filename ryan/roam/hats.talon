app.name: Roam Research 
mode: command
-

show [block] hats | [block] hats show | [block] hats on: 
    user.roam_bb_task("bridge --on")

hide [block] hats | [block] hats off :
    user.roam_bb_task("bridge --off")

## ++++++++++++++++++++++++++++ edit block

(go) <user.letters>:
    user.roam_bb_task("bridge --select {letters} -e")    

## +++++++++++++++++++++ select blocks .

(take) <user.letters>:
    user.roam_bb_task("bridge --select {letters}")

# use edit block,then esc to selecte block with real ui mechanism, so can move block after
(take) <user.letters> (classic) | (hard take) <user.letters> :
    user.roam_bb_task("bridge --select {letters} -e")
    sleep(800ms)
    key(esc)

(take) <user.letters> and <user.letters>:
    user.roam_bb_task("bridge --select {letters_1},{letters_2}")

((take) (add | ad | also) | (add | ad | also) take) <user.letters>:
    user.roam_bb_task("bridge --select-add {letters}")

(un take | not take | take not | unselect | remove from [block] selection ) <user.letters> | remove <user.letters> from selection:
    user.roam_bb_task("bridge --select-remove {letters}")

## ++++++++++++++++++++++++ fold block .

(fold | expand) <user.letters> :
    user.roam_bb_task("bridge --fold {letters_1}")

(unfold | collapse) <user.letters> :
    user.roam_bb_task("bridge --unfold {letters_1}")

## ++++++++++++++++++++++++ zoom block .

zoom (out | parent) block | go (parent | parents | parens):
    user.roam_bb_task("bridge --zoom-out")

zoom [block] <user.letters> :
    user.roam_bb_task("bridge --zoom {letters_1}")

zoom parent [block] [of] <user.letters> :
    user.roam_bb_task("bridge --zoom-parent {letters_1}")

## +++++++++++++ open block in sidebar .

(bar | sidebar) <user.letters> | open <user.letters> in (bar | sidebar):
    user.roam_bb_task("bridge --open-sidebar {letters_1}")

## ++++ move block to first/last child .

[<user.roam_position>] child <user.letters> :
    user.roam_bb_task("bridge --reorder {letters_1} {roam_position or ''}")

## ++++++++++++++++++++++++ move block(s) to child of target block .
## optional "alias" or "link" suffix on any move command:
##   "move A to D"       → --move A --to D
##   "move A to D alias" → --move A --to D --alias  (move + leave ref behind)
##   "move A to D link"  → --link A --to D           (don't move, create ref at target)

move (selected [blocks] | [block] selection) to [<user.roam_position>] [of] <user.letters> [<user.roam_move_mode>]:
    user.roam_bb_task(user.roam_move("bridge --move-selected --to {letters} {roam_position or ''}", roam_move_mode or ""))

move <user.letters> to <user.letters> [<user.roam_position>] [<user.roam_move_mode>]:
    user.roam_bb_task(user.roam_move("bridge --move {letters_1} --to {letters_2} {roam_position or ''}", roam_move_mode or ""))

## ++++++++ move block(s) before/after target block

move <user.letters> after <user.letters> [<user.roam_move_mode>]:
    user.roam_bb_task(user.roam_move("bridge --move {letters_1} --after {letters_2}", roam_move_mode or ""))

move <user.letters> before <user.letters> [<user.roam_move_mode>]:
    user.roam_bb_task(user.roam_move("bridge --move {letters_1} --before {letters_2}", roam_move_mode or ""))

## ++++++++++++++++++++++ move to page .

my tag test {user.roam_tag}:
    print("{roam_tag}") 

move <user.letters> to {user.roam_tag} [<user.roam_position>] [<user.roam_move_mode>]:
    user.roam_bb_task(user.roam_move("bridge --move {letters_1} --page '{user.roam_tag or ''}' {roam_position or ''}", roam_move_mode or ""))

## +++++++++++++++++++++++ move to ref .

move <user.letters> to {user.roam_ref} [<user.roam_position>] [<user.roam_move_mode>]:
    user.roam_bb_task(user.roam_move("bridge --move {letters_1} --ref {user.roam_ref or ''} {roam_position or ''}", roam_move_mode or ""))

# name = user.formatted_text(text, "COMMA_SEPARATED_NOSPACE")

# {user.roam_tag or ''}
# {user.roam_ref}

## ++++++++++++++++++++++ delete block .

(delete | chuck) <user.letters>:
    user.roam_bb_task("bridge --delete {letters}")

