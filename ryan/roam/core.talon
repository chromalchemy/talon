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

# community dropdown cmd: 
# (drop [down] | pick | pic) <number_small>: 
    # key("down:{number_small} enter")

# todo: turn this into proper ordinal
^(choose | pick | pic) (<number_small> | (that | top)):
    n = number_small or 1
    spacesDown= number_small - 1  
    key("down:{spacesDown}") 
    sleep(200ms)
    key(enter)
    key(space)

^(choose | pick) <user.ordinals>:
    n = ordinals or 1
    spacesDown= number_small - 1  
    key("down:{spacesDown}")
    key(enter)
    key(space)
    
# do I need these overrides?
exit: key(esc)
nope: key(cmd-z)
