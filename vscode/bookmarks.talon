app.name: Code
-

## ++++++++++++++++++++++++++ bookmarks .

#--------------------create bookmarks

(toggle | create | add) [line] bookmark | bookmark line: user.vscode("bookmarks.toggle")

(remove | delete) bookmark: user.vscode("bookmarks.toggle")

bookmark (that | line) (named | labeled): user.vscode("bookmarks.toggleLabeled")

bookmark (that | line) [with] [label] <user.text>:
    user.vscode("bookmarks.toggleLabeled")
    insert(text)
    sleep(300ms)
    key(enter)

bookmark that [(paste | pace)]:
    edit.copy()
    user.vscode("bookmarks.toggleLabeled")
    edit.paste()
    sleep(300ms)
    key(enter)
    
## ++++++++++++++++++++++ jump to via bookmark order .

[go] next (bookmark | mark):    user.vscode("bookmarks.jumpToNext")
[go] (previous | prev | last) (bookmark | mark): user.vscode("bookmarks.jumpToPrevious")


## ++++++ pick bookmark from current file .

(hunt | search | pick | list) file (bookmark | bookmarks | mark | marks ) [for] [<user.text>]:
    user.vscode("bookmarks.list")
    # sleep(200ms)
    insert(text)

## ++++++ pick bookmark from all files .
(hunt | search | pick | list) [all] (bookmark | bookmarks | mark | marks ) [for] [<user.text>]:
    user.vscode("bookmarks.listFromAllFiles")
    # sleep(100ms)
    key(enter)
    sleep(300ms)
    insert(text)

       
#open copied bookmark from all files
open (bookmark | mark) [(paste | pace)]:
    user.vscode("bookmarks.listFromAllFiles")
    # sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-v)
    sleep(300ms)
    key(enter)

# bookmarks panel .
(focus | show | bar) (bookmarks | marks | links) [(bar | panel | view)]:
    user.vscode("bookmarksExplorer.focus")

 ## ++++++++++++++++++++ hover commands .

rename bookmark:
    mouse_click(1)
    sleep(300ms)
    key(down)
    key(enter)

rename bookmark [<user.text>]:
    mouse_click(1)
    sleep(300ms)
    key(down)
    key(enter)
    insert(text)
    sleep(300ms)
    key(enter)

copy bookmark name:
    mouse_click(1)
    sleep(300ms)
    key(down)
    key(enter)
    key(cmd-c)
    key(esc)

## ++++++++++++++++ line link url .

copy (line | code) (link | address):           
    user.vscode("extension.linkLine")

#go to link (via raycast) is in general.talon

## +++++++++++++++++++++++++ favorites (file bookmarks) .


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
