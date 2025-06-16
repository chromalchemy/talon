os: mac
-

## +++++++++++++++++ native osx menu search

^menu hunt <user.text>$:
    key("cmd-shift-/")
    insert(user.text)

## ++++++++++++++++++++ # raycast search menus .

(search | hunt) (ray | raycast) [app] (menu | menus) [(item | items)] [<user.text>]: 
    user.raycast_select_app_menu_command(text or "")

## run menu item .

(run | hit | do) [app] (menu | menus) [item] <user.text>:
    user.raycast_run_app_menu_command(text)


## ++++++++++++++ shortcat menu search .


(short | cat) menu: key(cmd)

#  search menus for letter
((target | shortcat | cat) (hunt | search) [(menu | menus)] | (search | hunt) [cat] (menu | menus | target | targets)) <user.letter>:
    user.shortcat_search_menu(letter)

#  search menus for phrase   
^((target | shortcat | cat) (hunt | search) [(menu | menus)] | (search | hunt) [cat] (menu | menus | target | targets)) [<user.text>]:
    user.shortcat_search_menu(text or '')

# (search | hunt) [ray] (menu | menus) 

# Search menus for phrase and automatically choose first    
((target | shortcat | cat) (hunt | search) [(menu | menus)] | (search | hunt) [cat] (menu | menus | target | targets)) force <user.text>:
    user.shortcat_search_menu_auto(text)
