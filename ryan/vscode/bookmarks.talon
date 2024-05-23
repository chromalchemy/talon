app.name: Code
tag: user.cursorless
-

## ++++++++++++++++ line link url .

copy (line | code) (link | address):           
    user.vscode("extension.linkLine")

## +++++++++++++++++++ bookmarks panel .

(focus | show | bar) (bookmarks | marks | links) [(bar | panel | view)]:
    user.vscode("bookmarksExplorer.focus")

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
    
## ++++++++++++++++++++++ jump to bookmark via bookmark order .

[go] next (bookmark | mark):    user.vscode("bookmarks.jumpToNext")
[go] (previous | prev | last) (bookmark | mark): user.vscode("bookmarks.jumpToPrevious")

## ++++++ pick bookmark from current file .

(hunt | search | pick | list) [file] (bookmark | bookmarks | mark | marks ) [for] [<user.text>]:
    user.vscode("bookmarks.list")
    insert(text)

[go] (bookmark | mark) [file] <user.text>:
    user.vscode("bookmarks.list")
    # sleep(100ms)
    user.paste(text)
    sleep(100ms)
    key(enter)

#doesn't work
# demo dog <user.cursorless_target>:
#     user.private_cursorless_action_or_ide_command("showQuickFix", cursorless_target)

# walk my crown:
#     user.private_cursorless_action_or_ide_command("scrollToTop", "currentSelection")

## ++++++ pick bookmark from all files .
(hunt | search | pick | list) all (bookmark | bookmarks | mark | marks ) [for] [<user.text>]:
    user.vscode("bookmarks.listFromAllFiles")
    # sleep(100ms)
    key(enter)
    sleep(300ms)
    insert(text)

[go] (marks | (bookmark | mark) all) <user.text>:
    user.vscode("bookmarks.listFromAllFiles")
    key(enter)
    sleep(100ms)
    user.paste(text)
    sleep(100ms)
    key(enter)

    
#open pasted bookmark bookmark name, from all files
(hunt | search | pick | list) [all] (bookmark | bookmarks | mark | marks ) (paste | pace):
    user.vscode("bookmarks.listFromAllFiles")
    # sleep(100ms)
    key(enter)
    sleep(300ms)
    key(cmd-v)
    sleep(300ms)
    key(enter)

 ## ++++++++++++++++++++ panel bookmark hover .

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

## ============================== favorites (file bookmarks) .

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
