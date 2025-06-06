app.name: Roam Research 
mode: command
-

(fold | close | hide (children | kids)) block: 
    key(cmd-up)
(unfold | open | show (children | kids)) block: 
    key(cmd-down)

(collapse | fold) tree:
    user.run_roam_command("collapse current block tree") 

#only exands one leve deep (not recursive)
(expand | unfold) block:
    user.run_roam_command("Expand current block tree")
    
(collapse | fold) all [blocks]: 
    user.run_roam_command("collapse all blocks on page")
    
(expand | unfold) all [blocks]:
    user.run_roam_command("expand all blocks on page") 

#working kind of inconsistanly
#how to take a digit, do math on in, then use as key
(expand | fold) all [blocks] <number_small>: 
    mynumber = number_small + 1
    user.run_roam_command("wb expand/collapse block tree")
    sleep(500ms)
    key("{mynumber}")
