app.name: Code
-

#talon edit fns
sleep action <user.number_string>:
    a = "sleep(" + number_string
    b = a + "ms)"
    insert(b)


[(add | new)] key action:
    insert("key()")
    key(left)

[(add | new)] action:
    insert("insert(\"\")")
    key(left:2)

[(add | new)] sleep action:
    insert("sleep(ms)")
    key(left:3)

[(add | new)] code action:
    insert("user.vscode(\"\")")
    key(left:2)

paste code action:
    # mimic("take tail")
    # sleep(500ms)
    mimic("new code action")
    sleep(500ms)
    mimic("paste that")

insert hyper key [token]:  insert("cmd-ctrl-alt-shift-")

    
#general editor stuff

choose [color] theme: user.menu_select('Code|Settings…|Theme|Color Theme [⌘K ⌘T]')

#use axkit command
# (show | reveal) file [in] finder:
#     #todo: not working
#     # key(cmd-alt-r)
#     key(cmd-shift-p)
#     sleep(100ms)
#     insert("reveal in finder")
#     sleep(100ms)
#     key(enter)

#bars

(show | reveal) [file] [in] (explore | explorer): user.vscode("workbench.files.action.showActiveFileInExplorer")
    
collapse (explore | Explorer) [(bar | view)]: user.vscode("workbench.files.action.collapseExplorerFolders")

((activity bar | icons bar) (toggle | show | hide | view) | (toggle | show | hide | view) (activity bar | icons bar)):
    user.vscode("workbench.action.toggleActivityBarVisibility")

(focus | go) (activity bar | icons bar): user.vscode("workbench.action.toggleActivityBarVisibility")
    
(toggle | show | hide | view) [left] (sidebar | bar): key(cmd-b)
bar (toggle | show | hide): key(cmd-b)
(toggle | show | hide) bar: key(cmd-b)
(toggle | show | hide | view) right (sidebar | bar): key(cmd-alt-b)
((toggle | show | hide | view) [bottom] panel | [bottom] panel (toggle | show | hide | view)): key(cmd-j)
panel (toggle | show | hide | view): key(cmd-j)
(toggle | show | hide) zen mode: key(cmd-k z)
(toggle | show | hide) line numbers: key(ctrl-shift-l)

bar extension: user.vscode("workbench.view.extensions")

wrap (words | lines) | toggle (word | line) wrap: user.vscode("editor.action.toggleWordWrap")

#general edit commands

# vscode delete line action
kill (line | lines) | killing | k line | cline: user.vscode("editor.action.deleteLines")


#search 

[new] search to side: user.vscode("search.action.openNewEditorToSide")

collapse search results: user.vscode("search.action.collapseSearchResults")

clear search results: user.vscode("search.action.clearSearchResults")
    
find file [<user.text>]: 
    key(cmd-p)
    sleep(100ms)
    insert(text)

# find text  (deprecate for knausj?)
(find [text] [in file] | search file): key(cmd-f)
(search | find) in files:   user.vscode("workbench.action.findInFiles")
(search | find) [in] folder:  key(shift-alt-f)
# key(shift-cmd-e) # not reliable toggles back and forth
(search | find) that in folder:
    key(shift-alt-f)
    sleep(200ms)
    key(cmd-v)
(search | find in) in folder <user.text>:
    key(shift-alt-f)
    sleep(200ms)
    insert(text)

[(search | find) and] replace [text]: key(cmd-alt-f)
[(search | find) and] that:
    key(cmd-alt-f)
    sleep(200ms)
    key(cmd-v)
[(search | find) and] replace <user.text>:
    key(cmd-alt-f)
    sleep(200ms)
    insert(text)

[toggle] hunt [in] (selection | [whole] page10): key(alt-cmd-l)


#navigate forms todo: what is this
# [go] (last |  previous | prev) form: key(alt-up)
# [go] next form: key(alt-down)

#navigate locations
go back edit: user.vscode("workbench.action.navigateBackInEditLocations")
go (forward | fore | four) edit: user.vscode("workbench.action.navigateForwardInEditLocations")

go back nav: user.vscode("workbench.action.navigateBackInNavigationLocations")
go (forward | fore | four) nav: user.vscode("workbench.action.navigateForwardInNavigationLocations")

go [to] last edit: user.vscode("workbench.action.navigateToLastEditLocation")

#comment
(comment |  uncomment) that: key(cmd-/)


#bookmark


(toggle | show | hide | go | view | bar) (bookmarks | links) [(bar | panel | view)]: key(cmd-ctrl-alt-shift-b)

((toggle | create | add) [line] bookmark) | bookmark (that | line) | (remove | delete) bookmark: key(cmd-alt-k)

bookmark (that | line) (name | named): key(cmd-alt-ctrl-k)

bookmark (that | line) <user.text>:
    key(cmd-alt-ctrl-k)
    insert(text)
    sleep(300ms)
    key(enter)

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

(search bookmarks | bookmarks list) [<user.text>]:
    key(cmd-shift-p)
    insert("bookmarks list")
    key(enter)
    sleep(300ms)
    insert(text)

(search all bookmarks | all bookmarks list) [<user.text>]:
    key(cmd-shift-p)
    insert("bookmarks list from all files  ")
    key(enter)
    sleep(300ms)
    insert(text)

#open copied bookmark
open bookmark [(text | name)]:
    key(cmd-shift-p)
    insert("bookmarks list from all files  ")
    key(enter)
    sleep(300ms)
    key(cmd-v)
    sleep(300ms)
    key(enter)

focus (bookmarks | links) [(bar | panel | view)]:
    key(cmd-shift-p)
    insert("bookmarks focus on explorer view")
    key(enter)

[go] next bookmark:         key(cmd-alt-l)
[go] (previous | prev | last) bookmark: key(cmd-alt-j)

copy line link: user.vscode("extension.linkLine")

[(show | view | bar)] projects: user.vscode("projectsExplorerFavorites.focus")

#favorites
    
[(show | view | bar)] favorites: user.vscode("workbench.view.extension.favorites-explorer")

(focus | go) favorites [(panel | bar)]: user.vscode("favorites-full-view.focus")


[bar] (explore |explorer) (focus | go) favorites: user.vscode("favorites.focus")
    
    
file (add | send) [to] (favorite | favorites) | make file favorite: user.vscode("favorites.addToFavorites")

file remove [from] (favorite | favorites): user.vscode("favorites.deleteFavorite")

(add | send) to favorites | make favorite: 
    mouse_click(1)
    sleep(300ms)
    insert("add to favorites")
    key(enter)

remove from favorites: 
    mouse_click(1)
    sleep(300ms)
    insert("remove")
    key(enter)
    


#cursorless 



copy action id:
    mouse_click(1)
    sleep(500ms)
    key(down:2 enter)
   
copy action name:
    mouse_click(1)
    sleep(100ms)
    key(down)
    # sleep(300ms)
    # key(down)
    # sleep(300ms)
    # key(down)
    # sleep(300ms)
    # key(enter)
    


key(cmd-4): mimic("copy action id")

key(cmd-3): mimic("copy action name")

# key(cmd-2): 
#     mimic("copy action id")
#     sleep(300ms)
#     mimic("copy action name")
#     sleep(500ms)
#     mimic("clippy")
#     # mimic("paste one")


kill process: key(ctrl-c)


reset [(code | app)] zoom: user.vscode("workbench.action.zoomReset")

Zoom out font: user.vscode("editor.action.fontZoomOut")
Zoom in font: user.vscode("editor.action.fontZoomIn")
reset font (zoom | size) | zoom font (reset | default): user.vscode("editor.action.fontZoomReset")

pick code (window | winner | win): user.vscode("workbench.action.switchWindow")
swap code (window | winner | win) | code (window | winner | win) swap: 
    user.vscode("workbench.action.switchWindow")
    key(enter)

(hide | clear) notifications: user.vscode("notifications.clearAll")

#tab navigation

(bar | show | go | focus) open (files | editors) [view]: user.vscode("workbench.files.action.focusOpenEditorsView")
split editor: user.vscode("workbench.action.splitEditor")
split editor down: user.vscode("workbench.action.splitEditorDown")
split editor up: user.vscode("workbench.action.splitEditorUp")
Split editor left:  user.vscode("workbench.action.splitEditorLeft")
split editor right: user.vscode("workbench.action.splitEditorRight")
split editor ortho: user.vscode("workbench.action.splitEditorOrthogonal")

split editor in group: user.vscode("workbench.action.toggleSplitEditorInGroup")

split editor to right: user.vscode("workbench.action.splitEditorToRightGroup")
split editor to next: user.vscode("workbench.action.splitEditorToNextGroup")
split editor to first: user.vscode("workbench.action.splitEditorToFirstGroup")
split editor to last: user.vscode("workbench.action.splitEditorToLastGroup")
split editor to above: user.vscode("workbench.action.splitEditorToAboveGroup")
split editor to below: user.vscode("workbench.action.splitEditorToBelowGroup")

(tab | tabby) (right | push): user.vscode("workbench.action.moveEditorRightInGroup")
(tab | tabby) (left | pull): user.vscode("workbench.action.moveEditorLeftInGroup")

(send | move) (editor | tab) group right: user.vscode("workbench.action.moveActiveEditorGroupRight")
(send | move) (editor | tab) group left: user.vscode("workbench.action.moveActiveEditorGroupLeft")
(send | move) (editor | tab) group up: user.vscode("workbench.action.moveActiveEditorGroupUp")
(send | move) (editor | tab) group down: user.vscode("workbench.action.moveActiveEditorGroupDown")

(send | move) editor to right: user.vscode("workbench.action.moveEditorToRightGroup")
(send | move) editor to left: user.vscode("workbench.action.moveEditorToLeftGroup")
(send | move) editor to above: user.vscode("workbench.action.moveEditorToAboveGroup")
(send | move) editor to  below: user.vscode("workbench.action.moveEditorToBelowGroup")
(send | move) editor to  first: user.vscode("workbench.action.moveEditorToFirstGroup")
(send | move) editor to  last: user.vscode("workbench.action.moveEditorToLastGroup")
(send | move) editor to  previous: user.vscode("workbench.action.moveEditorToPreviousGroup")
(send | move) editor to  next: user.vscode("workbench.action.moveEditorToNextGroup")

[i] please  (send | move) (editor | tab): 
    key(cmd-shift-p)
    insert("move editor")

[i] please  (go | focus): 
    key(cmd-shift-p)
    insert("view focus")

[i] please  (go | focus) [(editor | tab)]: 
    key(cmd-shift-p)
    insert("view focus editor")
    

(toggle | show | hide ) mini map: user.vscode("editor.action.toggleMinimap")

(show | view) (tokens | scopes | scope): user.vscode("editor.action.inspectTMScopes")

(toggle | show | hide ) (cursors | curses): user.vscode("cursorless.toggleDecorations")

#settings 
open (settings | sitting): user.vscode("workbench.action.openSettings2")
open [user] (settings | sitting) (json | jay son): user.vscode("workbench.action.openSettingsJson")
open workspace (settings | sitting) (json | jay son): user.vscode("workbench.action.openWorkspaceSettingsFile")


(go [to] | pick) symbol: user.vscode("workbench.action.gotoSymbol")

#sources 
[(show | view | bar)] (sources | git | source control): user.vscode("workbench.view.scm")
[(show | view | bar)] remotes: user.vscode("gitlens.views.remotes.focus")

#todo make this hard prefix operational in vscode
(number  | numb) <user.number_string>: "{number_string}"

(find | show) references: user.vscode("references-view.findReferences")
(go | bar) references: user.vscode("references-view.tree.focus")


#andreas nav commands
[(focus | go)] tab {self.letter} [{self.letter}]:
    user.run_rpc_command("andreas.focusTab", "{letter_1}{letter_2 or ''}")

[(focus | go)] tab <number>:
    myNum = number - 1
    user.run_rpc_command("andreas.openEditorAtIndex", number) 

take to line <number>:
    user.run_rpc_command("andreas.selectTo", number) 
    
#file tree extension

# This opens the file tree in the sidebar
bar [file] tree: user.vscode("workbench.view.extension.filetree")
go [file] tree: user.vscode("filetree.focus")

# File tree commands
tree <user.letters>:
    user.run_rpc_command("talon-filetree.toggleDirectoryOrOpenFile", letters)
tree parent <user.letters>:
    user.run_rpc_command("talon-filetree.closeParent", letters)
tree <user.letters> <number>:
    user.run_rpc_command("talon-filetree.expandDirectory", letters, number)
tree collapse <user.letters>:
    user.run_rpc_command("talon-filetree.expandDirectory", letters, 0)
tree move <user.letters> to <user.letters>:
    user.run_rpc_command("talon-filetree.moveFile", letters_1, letters_2)
tree move <user.letters> [to] root:
    user.run_rpc_command("talon-filetree.moveFile", letters_1)
# the recommended way to open a file is using the "toggleDirectoryOrOpenFile" command
# but this may be useful for people that want to separate the two actions
# e.g. to create very distinct commands that are easier for talon to differentiate
tree open <user.letters>:
    user.run_rpc_command("talon-filetree.openFile", letters)
tree rename <user.letters>: 
    user.run_rpc_command("talon-filetree.renameFile", letters)
tree create <user.letters>:
    user.run_rpc_command("talon-filetree.createFile", letters)
tree delete <user.letters>:
    user.run_rpc_command("talon-filetree.deleteFile", letters)
tree collapse root:
    user.run_rpc_command("talon-filetree.collapseRoot")
tree select <user.letters>:
    user.run_rpc_command("talon-filetree.select", letters)
tree git:
    user.run_rpc_command("talon-filetree.toggleGitIgnoredFiles")
tree current:
    user.run_rpc_command("talon-filetree.revealCurrentFile")