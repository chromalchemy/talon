# Shortcat
#show targets
(target | shortcat | cat) [point] | cat point: 
    key(alt-shift-cmd-ctrl-f12)

#pick target
(shortcat | cat) [(pick | pic)] <user.letters>: 
    insert(" {letters}")
    sleep(200ms)
    key(enter)

#pick number from popup menu menu
(shortcat | cat) [(pick | pic)] [item] <number>:
    key("cmd-{number}")


## ++++++++ search shortcat popup menu .

(short | cat) menu: key(cmd)

#  search menus for letter
((target | shortcat | cat) (hunt | search) [(menu | menus)] | (search | hunt) [cat] (menu | menus | target | targets)) <user.letter>:
    key("alt-shift-cmd-ctrl-f12")
    sleep(300ms)
    insert(letter)

#  search menus for phrase   
^((target | shortcat | cat) (hunt | search) [(menu | menus)] | (search | hunt) [cat] (menu | menus | target | targets)) [<user.text>]:
    key("alt-shift-cmd-ctrl-f12")
    sleep(300ms)
    insert("{text or ''}")

# (search | hunt) [ray] (menu | menus) 

# Search menus for phrase and automatically choose first    
((target | shortcat | cat) (hunt | search) [(menu | menus)] | (search | hunt) [cat] (menu | menus | target | targets)) force <user.text>:
    key("alt-shift-cmd-ctrl-f12")
    sleep(300ms)
    insert(text)
    sleep(300ms)
    key("enter")

#refresh menu
(short | target) refresh: key(cmd-r)    
    

