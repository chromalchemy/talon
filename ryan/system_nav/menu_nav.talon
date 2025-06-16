os: mac
-

## ++++++++++++ Navigate osx file menu .

go menu: 
    key(fn-ctrl-f2)

#match menu tli item by letters or text

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

# ++++++++++ start typing in to match and select menu item .

menu pick <user.text>: 
    insert(text)
    
menu (touch | punch | hit | press | select) <user.text>: 
    insert(text)
    key(enter)
