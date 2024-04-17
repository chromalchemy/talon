# Shortcat
#show targets
(target | shortcat ): key(alt-shift-cmd-ctrl-f12)

#pick target
(short | cat) [(pick | pic)] <user.letters>: 
    insert(" {letters}")
    sleep(200ms)
    key(enter)

(short | cat) menu: key(cmd)

#  search menus for letter
(target | shortcat ) <user.letter>:
    key("alt-shift-cmd-ctrl-f12")
    sleep(300ms)
    insert(letter)

#  search menus for phrase   
((target | shortcat ) [(menu | menus)] | (search | hunt) [(short | cat)] (menu | menus)) [<user.text>]:
    key("alt-shift-cmd-ctrl-f12")
    sleep(300ms)
    insert("{text or ''}")

# (search | hunt) [ray] (menu | menus) 

# Search menus for phrase and automatically choose first    
((target | shortcat ) [(menu | menus)] | (search | hunt) [(short | cat)] (menu | menus)) force <user.text>:
    key("alt-shift-cmd-ctrl-f12")
    sleep(300ms)
    insert(text)
    sleep(300ms)
    key("enter")

#refresh menu
(short | target) refresh: key(cmd-r)    
    
#pick number from popup menu menu
(short | cat) [pick] [item] <number>:
    key("cmd-{number}")
