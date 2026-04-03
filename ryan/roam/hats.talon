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

((take) (add | ad | also) | (also | and) take | (ad | add) to selected [blocks]) <user.letters> | (ad | add) <user.letters> to (selection | select | take | selected [blocks]):
    user.roam_fn("(select-add! [:{letters}])")

(un take | not take | take not | unselect | deselect | remove from [block] (selection | select | selected [blocks]) ) <user.letters> | remove <user.letters> from (selection | select | selected [blocks]):
    user.roam_fn("(select-remove! [:{letters}])")

## ++++++++++++++++++++++++ fold block .

(fold | expand) <user.letters> :
    user.roam_fn("(fold! [:{letters_1}])")

(unfold | collapse) <user.letters> :
    user.roam_fn("(unfold! [:{letters_1}])")

(fold | expand) (children | kids) [of] <user.letters> :
    user.roam_fn("(fold-children! :{letters_1})")

(unfold | collapse) (children | kids) [of] <user.letters> :
    user.roam_fn("(unfold-children! :{letters_1})")

## ++++++++++++++++++++++++ zoom block .

zoom (out | (parent | parents | parens) [of]) (top | root) [block]:
    user.roam_fn("(zoom-out!)")

zoom <user.roam_destination>:
    user.roam_fn('(zoom! {roam_destination})')

zoom (forward | next | plus) <number_small> [days]:
    user.roam_fn("(zoom! :daily {number_small})")

zoom (back | previous | minus) <number_small> [days]:
    user.roam_fn("(zoom! :daily -{number_small})")

zoom parent [block] [of] <user.letters> :
    user.roam_fn("(zoom-parent! :{letters_1})")

## +++++++++++++ open block in sidebar .

(bar | sidebar) <user.roam_destination>:
    user.roam_fn('(open-sidebar! {roam_destination})')

open <user.letters> in (bar | sidebar):
    user.roam_fn("(open-sidebar! :label :{letters})")

## ++++ move block to first/last child .
!
# intended  for use in single list (no alias commands)
[move] <user.roam_source> <user.roam_position> $:
    user.roam_fn("(transfer! {{ {roam_source} :position {roam_position or ':last'}}})")

<user.roam_action> <user.roam_source> ( to <user.roam_destination> [<user.roam_position>] | [to] [<user.roam_position>] [of] <user.roam_destination>)$:
    fn = """
    (transfer! 
      {{{roam_source} {roam_destination} 
       :position {roam_position or "nil"} 
       :action {roam_action}}})
    """
    user.roam_fn(fn)

## ++++++++++++++++++++ nudge block .

[nudge] <user.letters> <user.roam_direction>:
    user.roam_fn("(nudge! :{letters} {roam_direction})")

[nudge] block <user.roam_direction>:
    user.roam_fn("(nudge! {roam_direction})")

## ++++++++++++++++++++++++++ swap blocks .

swap <user.letters> [and | with] <user.letters>:
    user.roam_fn("(swap-blocks! :{letters_1} :{letters_2})")

swap content <user.letters> [and | with] <user.letters>:
    user.roam_fn("(swap-blocks! :{letters_1} :{letters_2} {{:content true}})")

## ++++++++++++++++++++++ delete block .

(delete | chuck) <user.letters>:
    user.roam_fn("(delete! [:{letters}])")
