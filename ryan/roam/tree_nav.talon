app.name: Roam Research 
mode: command
-

# stays on same level
#same as block below?
[go] next block: 
    # key(ctrl-n) # doesnt work reliably on broken paragraphs
    user.roam_select_block()
    key(down)   

## ___________________________________ .

go parent [block]: 
    key(ctrl-alt-u)
    # user.run_roam_command("go to parent block")

go [first] child [block]:
    user.roam_select_block_text()
    key(right)
    key(down)  

#todo 
# go nth child:

## +++++++++++ page top/bottom

go [to] ([page] (top | crown) | (top | crown) [of] [page] | first block [on page]): 
    key(cmd-shift-t) 
    # user.run_roam_command("jump top")

go [to] ([page] bottom | base [of] [page] | last block [on page]): 
    key(cmd-shift-enter)
    # user.run_roam_command("jump bottom")

# go top and bottom doesnt work, overriden by gener edit cmds?
# tail doesnt work either

(go | page | scroll) [to] top: key(home) 

go [to] crown [of] [page]: 
    key(cmd-alt-shift-t)
    # user.run_roam_command("wb jump to top of page")

