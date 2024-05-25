app.name: Roam Research 
mode: command
-

# tag(): user.roam

####################

# todo: setup defualt timeout
    
#command palette
please [<user.text>]: 
    key(cmd-p)
    sleep(200ms)
    insert(text)

#bug not working
go all pages: 
    key(cmd-p)
    sleep(500ms)
    user.paste("(wb) all pages")
    sleep(1000ms)
    key(enter) 

jump link: key(ctrl-o)

# community dropdown cmd: drop up <number_small>: key("up:{number_small} enter")
# todo: turn this into proper ordinal
^(choose | pick) (<number_small> | that): 
    key("down:{number_small or 1}")
    key(enter)
    key(space)

^(choose | pick) <user.ordinals>: 
    key("down:{ordinals}")
    key(enter)
    key(space)
    
# do I need these overrides?
exit: key(esc)
nope: key(cmd-z)
