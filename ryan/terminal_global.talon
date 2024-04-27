## ++++ open terminal and run commands .

term brew (upgrade | update): 
    user.switcher_focus("Warp")
    key(cmd-t)
    sleep(200ms)
    user.menu_select('Tab|Rename the Current Tab')
    insert("Brew")
    key(enter)
    insert("brew update")
    sleep(1000ms)
    key(enter)

(warp | term) [new] (babashka | b b | be be | bb ) [repl]: 
    user.switcher_focus("Warp")
    key(cmd-t)
    sleep(300ms)
    user.menu_select('Tab|Rename the Current Tab')
    insert("BB")
    key(enter)
    sleep(1000ms)
    insert("bb")
    key(enter)

(warp | term) [new] (node (bb | b b) | n b b | nbb | en be be ) [repl]: 
    user.switcher_focus("Warp")
    key(cmd-t)
    sleep(300ms)
    user.menu_select('Tab|Rename the Current Tab')
    insert("NBB")
    key(enter) 
    sleep(1000ms)
    insert("nbb")
    key(enter)

term (quit | exit) [( repl | command)]: 
    key(ctrl-c)
    # insert(":repl/quit")
    # key(enter)