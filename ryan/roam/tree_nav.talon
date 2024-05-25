app.name: Roam Research 
mode: command
-

## ++++++++++++++++++++++++++ navigate .
# go top and bottom doesnt work, overriden by gener edit cmds?
# tail doesnt work either

(go | page | scroll) [to] top: key(home) 


go [to] crown [of] [page]: key(cmd-alt-shift-t)
# key(cmd-p)
# sleep(100ms)
# insert("wb jump to top of page")
# sleep(100ms)
# key(enter)    

go [to] base [of] [page]: key(cmd-shift-enter)   

next block: key(ctrl-n)

go [page] top: 
    key(cmd-p)
    sleep(100ms)
    user.paste("jump top")
    sleep(100ms)
    key(enter)

go [page] bottom: 
    key(cmd-p)
    sleep(100ms)
    user.paste("jump bottom")
    sleep(100ms)
    key(enter)

go back:  key(cmd-[)
go (forward | fore | ahead):  key(cmd-])

(zoom | focus) (block  | down): key(cmd-.)
(zoom | focus) (parent |  up): key(cmd-shift-ctrl-alt-u)

go parent [block]: key(ctrl-alt-u)
    # key(cmd-p)
    # sleep(200ms)
    # insert("go to parent block")
    # sleep(200ms)
    # key(enter)