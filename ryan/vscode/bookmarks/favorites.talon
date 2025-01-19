app.name: Code
app.name: Cursor
app.name: Windsurf
tag: user.cursorless
-

new (favorites | favorite) group:
    user.vscode("favorites.group.newGroup")

pick (favorites | favorite) group:
    user.vscode("favorites.group.changeGroup")

refresh favorites:
    user.vscode("favorites.nav.refresh")

(remove | delete) favorite:
    user.vscode("favorites.deleteFavorite")

reveal favorite [in] (files | finder):
    user.vscode("favorites.revealInOS.mac")

reveal favorite: 
    user.vscode("favorites.revealInSideBar")

## +++++++++++++++++++++++ show panels .

open (favourites | favorites):
    user.vscode("favorites.open")

# [show] favorites: 
#     user.vscode("workbench.view.extension.favorites-explorer")

(focus | go | bar) favorites: 
    user.vscode("favorites-full-view.focus")

# not doing anything
open favorites to side:
    user.vscode("favorites.openToSide")

(focus | go | bar) (explore |explorer) favorites: 
    user.vscode("favorites.focus")

(toggle | hide | show) [(explore |explorer)] favorites:
    user.vscode("favorites.toggleVisibility")


## +++++++++++++++++++++++++++ pickers .

pick favorite <user.text>:
    user.vscode("favorites-full-view.focus")
    sleep(100ms)
    insert(text)

go favorite <user.text>:
    user.vscode("favorites-full-view.focus")
    sleep(100ms)
    insert(text)
    key(enter)
    user.vscode("workbench.action.keepEditor")

file (add | send) [to] (favorite | favorites) | make file favorite | add [(file | tab)] [to] (favorite | favorites): 
    user.vscode("favorites.addToFavorites")

remove [(file | tab)] from (favorite | favorites): 
    user.vscode("favorites.deleteFavorite")

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
