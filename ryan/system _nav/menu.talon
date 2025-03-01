## ++++++++++++ Navigate osx file menu .


go menu: 
    key(fn-ctrl-f2)

#match menu by letters or text

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

# ++++++++++ start typing in to match .

menu pick <user.text>: 
    insert(text)
    
menu (touch | punch | hit | press | select) <user.text>: 
    insert(text)
    key(enter)

## ++++++++++++++++++++ # search menus .

(search | hunt) (ray | raycast) [app] (menu | menus) [(item | items)] [<user.text>]: 
    user.raycast_select_app_menu_command(text or "")

## +++++++++++++++++++++ run menu item .

(run | hit | do) [app] (menu | menus) [item] <user.text>:
    user.raycast_run_app_menu_command(text)