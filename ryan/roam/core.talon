app.name: Roam Research 
mode: command
-

# tag(): user.roam

####################

basil (roam | rome) test:
    user.roam_basil_test()

# todo: setup defualt timeout
    
#command palette
please: user.roam_open_command_palette():

please [command] <user.text>$: 
    user.roam_open_command_palette():
    sleep(500ms)
    insert(text)
 
(show | hide | bar) (devtools | dev tools | inspector | inspect):
    key(cmd-alt-i)
    # user.menu_select('View|Toggle Developer Tools')

(reload | load | low) [developer] (extensions | extension | plugin | plugins):
    user.run_roam_command("reload developer extensions")

[force] reload [all]:
    key(cmd-shift-r)

#bug not working
go all pages: 
    user.run_roam_command("(wb) all pages")

## +++++ pick from tag picker dropdown .

# community dropdown cmd: 
# (drop [down] | pick | pic) <number_small>: 
    # key("down:{number_small} enter")

# todo: turn this into proper ordinal
^(choose | pick | pic) (<number_small> | (that | top)):
    spacesDown= number_small or 1
    key("down:{spacesDown}") 
    sleep(200ms)
    key(enter)
    key(space)

^(choose | pick) [<user.ordinals>]:
    spacesDown= ordinals or 1
    print("spacesDown: {spacesDown}")
    key("down:{spacesDown}")
    key(enter)
    key(space)
    
# do I need these overrides?
# exit: key(esc)
# nope: key(cmd-z)

