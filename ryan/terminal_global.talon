## ++++ open terminal and run commands .

term brew (upgrade | update): 
    user.warp_run_command_in_new_tab("brew upgrade", "Brew")

(warp | term) [new] (babashka | b b | be be | bb ) [repl]:
    user.warp_run_command_in_new_tab("bb", "BB") 

(warp | term) [new] (node (bb | b b) | n b b | nbb | en be be ) [repl]: 
    user.warp_run_command_in_new_tab("nbb", "NBB")

term (quit | exit) [( repl | command)]: 
    key(ctrl-c)
    # insert(":repl/quit")
    # key(enter)