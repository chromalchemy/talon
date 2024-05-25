app.name: Roam Research 
mode: command
-

## +++++++++++++++++++++ block folding .

(fold | close | hide (children | kids)) block: 
    key(cmd-up)
(unfold | open | show (children | kids)) block: 
    key(cmd-down)

(collapse | fold) tree: 
    key(cmd-p)
    sleep(100ms)
    user.paste("collapse current block tree")
    sleep(100ms)
    key(enter)

#only exands one leve deep (not recursive)
(expand | unfold) block:
    key(cmd-p)
    sleep(100ms)
    user.paste("Expand current block tree")
    sleep(100ms)
    key(enter)
    
(collapse | fold) all [blocks]: 
    key(cmd-p)
    sleep(100ms)
    user.paste("collapse all blocks on page")
    sleep(100ms)
    key(enter)
    
(expand | unfold) all [blocks]: 
    key(cmd-p)
    sleep(100ms)
    user.paste("expand all blocks on page")
    sleep(100ms)
    key(enter)

#working kind of inconsistanly
#how to take a digit, do math on in, then use as key
(expand | fold) all [blocks] <number_small>: 
    mynumber = number_small + 1
    key(cmd-p)
    sleep(100ms)
    user.paste("wb expand/collapse block tree")
    sleep(100ms)
    key(enter)
    sleep(500ms)
    key("{mynumber}")
