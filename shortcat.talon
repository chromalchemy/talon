# Shortcat
#show targets
target: key(alt-shift-cmd-ctrl-f12)

#pick target
short [(pick | pic)] <user.letters>: 
    insert(" {letters}")
    sleep(200ms)
    key(enter)

short menu: key(cmd)

#  search menus for letter
target <user.letter>:
    key("alt-shift-cmd-ctrl-f12")
    sleep(300ms)
    insert(letter)

#  search menus for phrase    
target <user.text>:
    key("alt-shift-cmd-ctrl-f12")
    sleep(300ms)
    insert(text)

# Search menus for phrase and automatically choose first    
target force <user.text>:
    key("alt-shift-cmd-ctrl-f12")
    sleep(300ms)
    insert(text)
    sleep(300ms)
    key("enter")

#refresh menu
(short | target) refresh: key(cmd-r)    
    
#pick number from popup menu menu
short [pick] <number>:
    key("cmd-{number}")
