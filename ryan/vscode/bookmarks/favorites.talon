app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
tag: user.cursorless
-

new (favorites | favorite) group:
    user.run_rpc_command("favorites.group.newGroup")

pick (favorites | favorite) group:
    user.run_rpc_command("favorites.group.changeGroup")

refresh favorites:
    user.run_rpc_command("favorites.nav.refresh")

(remove | delete) favorite:
    user.run_rpc_command("favorites.deleteFavorite")

reveal favorite [in] (files | finder):
    user.run_rpc_command("favorites.revealInOS.mac")

reveal favorite: 
    user.run_rpc_command("favorites.revealInSideBar")

## +++++++++++++++++++++++ show panels .

open (favourites | favorites):
    user.run_rpc_command("favorites.open")

# [show] favorites: 
#     user.run_rpc_command("workbench.view.extension.favorites-explorer")

(focus | go | bar) favorites: 
    user.run_rpc_command("favorites-full-view.focus")

# not doing anything
open favorites to side:
    user.run_rpc_command("favorites.openToSide")

(focus | go | bar) (explore |explorer) favorites: 
    user.run_rpc_command("favorites.focus")

(toggle | hide | show) [(explore |explorer)] favorites:
    user.run_rpc_command("favorites.toggleVisibility")


## +++++++++++++++++++++++++++ pickers .

pick favorite <user.text>:
    user.run_rpc_command("favorites-full-view.focus")
    sleep(100ms)
    insert(text)

go favorite <user.text>:
    user.run_rpc_command("favorites-full-view.focus")
    sleep(100ms)
    insert(text)
    key(enter)
    user.run_rpc_command("workbench.action.keepEditor")

file (add | send) [to] (favorite | favorites) | make file favorite | add [(file | tab)] [to] (favorite | favorites): 
    user.run_rpc_command("favorites.addToFavorites")

remove [(file | tab)] from (favorite | favorites): 
    user.run_rpc_command("favorites.deleteFavorite")

(add | send) (this | that) to favorites | make favorite:
    mouse_click(1)
    sleep(300ms)
    insert("add to favorites")
    key(enter)

remove (this | that) from favorites:
    mouse_click(1)
    sleep(300ms)
    insert("remove")
    key(enter)
