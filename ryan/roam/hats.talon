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
    # print("bridge --zoom {letters_1}")
    user.roam_bb_task("bridge --zoom {letters_1}")

zoom parent [block] [of] <user.letters> :
    user.roam_bb_task("bridge --zoom-parent {letters_1}")

## +++++++++++++ open block in sidebar .

(bar | sidebar) <user.letters> | open <user.letters> in (bar | sidebar):
    user.roam_bb_task("bridge --open-sidebar {letters_1}")

## ++++ move block to first/last child .

first child <user.letters> :
    user.roam_bb_task("bridge --reorder {letters_1} --first")

last child <user.letters> :
    user.roam_bb_task("bridge --reorder {letters_1}")

## ++++++++++++++++++++++++ move block(s) to child of target block .

move (selected [blocks] | [block] selection) to [top] [of] <user.letters>:
    user.roam_bb_task("bridge --move-selected --to {letters}")

move (selected [blocks] | [block] selection) to bottom [of] <user.letters>:
    user.roam_bb_task("bridge --move-selected --to {letters} --last")
    
move <user.letters> to <user.letters> top:
    user.roam_bb_task("bridge --move {letters_1} --to {letters_2} --first")

move <user.letters> to <user.letters> [bottom]:
    user.roam_bb_task("bridge --move {letters_1} --to {letters_2}")

## ++++++++ move block(s) before/after target block

move <user.letters> after <user.letters>:
    user.roam_bb_task("bridge --move {letters_1} --after {letters_2}")

move <user.letters> before <user.letters>:
    user.roam_bb_task("bridge --move {letters_1} --before {letters_2}")

## ++++++++++++++++++++++ move to page .

move <user.letters> to {user.ryan.roam.tags.list} [bottom]:
    user.roam_bb_task("bridge --move {letters_1} --page '{user.ryan.roam.tags.list or ''}'")

move <user.letters> to {user.ryan.roam.tags.list} top:
    # print("{user.ryan.roam.tags.list or ''}")
    user.roam_bb_task("bridge --move {letters_1} --page '{user.ryan.roam.tags.list or ''}' --first")



## +++++++++++++++++++++++ move to ref .

move <user.letters> to {user.ryan.roam.refs.list} [bottom]:
    user.roam_bb_task("bridge --move {letters_1} --ref {user.ryan.roam.refs.list or ''}")

move <user.letters> to {user.ryan.roam.refs.list} top:
    user.roam_bb_task("bridge --move {letters_1} --ref {user.ryan.roam.refs.list or ''} --first")

# name = user.formatted_text(text, "COMMA_SEPARATED_NOSPACE")

# {user.ryan.roam.tags.list or ''}
# {user.ryan.roam.refs.list}

## ++++++++++++++++++++++ delete block .

(delete | chuck) <user.letters>:
    user.roam_bb_task("bridge --delete {letters}")

