## ++++++++++++ Navigate osx file menu .

go menu: 
    key(fn-ctrl-f2)

go menu <user.letter>: 
    key(fn-ctrl-f2)
    insert(letter)
    key(down)

go menu <user.letters> : 
    key(fn-ctrl-f2)
    insert(letters)
    key(down)

go menu <user.text>: 
    key(fn-ctrl-f2)
    insert(text)
    key(down)

menu pick <user.text>: 
    insert(text)
    
menu (touch | punch | hit | press | select) <user.text>: 
    insert(text)
    key(enter)

## ++++++++++++++++++++ # search menus .

(search | hunt) ray (menu | menus) [<user.text>]: 
    key(cmd-alt-shift-ctrl-l)
    sleep(200ms)
    insert("{text or ''}")
