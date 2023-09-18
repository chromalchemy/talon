app.name: Code
-
# already in community
# select breadcrumb: user.vscode("breadcrumbs.focusAndSelect")
file context | path | crumb | breadcrumb | breadcrumbs: user.vscode("breadcrumbs.focusAndSelect")
parent ([file] context | path | crumb | breadcrumb | breadcrumbs): 
    user.vscode("breadcrumbs.focusAndSelect")
    key(left down)
(go | focus) (file context | path | crumb | breadcrumb | breadcrumbs): user.vscode("breadcrumbs.focus")
(toggle | show | hide) (file context | path | crumb | breadcrumb | breadcrumbs): user.vscode("breadcrumbs.toggle")

clone string:
    s = edit.selected_text()
    insert("[{s}")
    key(delete space)
    sleep(100ms)
    insert("{s}")
    sleep(100ms)
    # key(delete)

(add | ad) post:
    s = edit.selected_text()
    insert("[{s}")
    key(delete space)
    sleep(100ms)
    insert("{:post \"")

(add | ad) pre:
    s = edit.selected_text()
    insert("[{s}")
    key(delete space)
    sleep(100ms)
    insert("{:pre \"")

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

[(add | new)] insert action:
    insert("insert(\"\")")
    key(left:2)

[(add | new)] code action:
    insert("user.vscode(\"\")")
    key(left:2)

paste code action:
    # mimic("take tail")
    # sleep(500ms)
    mimic("new code action")
    sleep(500ms)
    edit.past()

insert hyper key [token]:   insert("cmd-ctrl-alt-shift-")

#general editor stuff

choose [color] theme:       user.menu_select('Code|Settings…|Theme|Color Theme [⌘K ⌘T]')

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

(show | reveal) file [in] [(explore | explorer)] | dock reveal | bar file: user.vscode("workbench.files.action.showActiveFileInExplorer")
(show | reveal) file [in] (finder | files): user.vscode("workbench.files.action.showActiveFileInExplorer")

collapse (explore | Explorer) [(bar | view)] [folders]: user.vscode("workbench.files.action.collapseExplorerFolders")

((activity bar | icons bar) (toggle | show | hide | view) | (toggle | show | hide | view) (activity bar | icons bar)):
    user.vscode("workbench.action.toggleActivityBarVisibility")

(focus | go) (activity bar | icons bar): user.vscode("workbench.action.toggleActivityBarVisibility")

(toggle | show | hide | view) [left] (sidebar | bar): user.vscode("workbench.action.toggleSidebarVisibility")   
[left] bar (toggle | show | hide): user.vscode("workbench.action.toggleSidebarVisibility")

(toggle | show | hide | view) right (sidebar | bar): user.vscode("workbench.action.toggleAuxiliaryBar")
right bar (toggle | show | hide): user.vscode("workbench.action.toggleAuxiliaryBar")

(toggle | show | hide | view | close) [bottom] panel: user.vscode("workbench.action.togglePanel")
panel (close | toggle | show | hide | view): user.vscode("workbench.action.togglePanel")

[move] panel right: user.vscode("workbench.action.positionPanelRight")
[move] panel left: user.vscode("workbench.action.positionPanelLeft")
[move] panel (bottom | down.): user.vscode("workbench.action.positionPanelBottom")
(panel | term | terminal) (max | min | regular | default): user.vscode("workbench.action.toggleMaximizedPanel")


(go | toggle | enter | exit | leave) (in | then | zen | zend | full) mode: user.vscode("workbench.action.toggleZenMode")
(toggle | show | hide) line numbers: user.vscode("lntoggle.toggle")

bar (extension | extensions | plugins): user.vscode("workbench.view.extensions")

wrap (words | lines) | toggle (word | line) wrap: user.vscode("editor.action.toggleWordWrap")

#general edit commands

# vscode delete line action
kill (line | lines) | killing | k line | cline: user.vscode("editor.action.deleteLines")

############### search

#search bar

bar search <user.text>:
    user.vscode("workbench.view.search")
    sleep(100ms)
    insert(text)

go [bar] search [bar] (list | results): user.vscode("search.action.focusSearchList")

bar search tree:            user.vscode("search.action.viewAsTree")
bar search list:            user.vscode("search.action.viewAsList")

bar search fold | (collapse | clap | fold) search [results]: user.vscode("search.action.collapseSearchResults")

bar search expand | (expand | unfold) search [results]: user.vscode("search.action.expandSearchResults")

bar search (clear | new) | clear search results | new bar search: user.vscode("search.action.clearSearchResults")

###  search editor(s)

new [workspace] search [(editor | tab)]: user.vscode("search.action.openNewEditor")

new [workspace] search (to side | right): user.vscode("search.action.openNewEditorToSide")

open [workspace] [search] results to side: user.vscode("search.action.openInEditor")
bar search [results] to tab: user.vscode("search.action.openInEditor")
search results to tab:      user.vscode("search.action.openInEditor")

move search results to tab:
    user.vscode("search.action.openInEditor")
    user.vscode("search.action.clearSearchResults")

#scrolls to top and focuses new input
(go) [workspace] search [(editor | tab)]: user.vscode("search.action.openEditor")

# why is this popping normal search editor
(search | find) in files:   user.vscode("workbench.action.findInFiles")

### search files

#todo: use file hunt commands instead?
(open | find | fine | search) (file | files) [<user.text>]:
    key(cmd-p)
    sleep(100ms)
    insert(text)

## find in folder

(search | find in) folder: key(shift-alt-f)

# key(shift-cmd-e) # not reliable toggles back and forth
(search | find) that in folder:
    key(shift-alt-f)
    sleep(200ms)
    key(cmd-v)

(search | find) in folder <user.text>:
    key(shift-alt-f)
    sleep(200ms)
    insert(text)

### find text in current file

# find text  (deprecate for knausj?)
# (find [text] [in file] | search file): key(cmd-f)

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

##########  navigation

(focus | go) editor: user.vscode("workbench.action.focusActiveEditorGroup")

go back: user.vscode("workbench.action.navigateBack")
go (forward | for | next) : user.vscode("workbench.action.navigateForward")

##back/forward form
# [go] (last |  previous | prev) form: key(alt-up)
# [go] next form: key(alt-down)

## navigate edit locations

#back/forward edit location
go back (edit | at it): user.vscode("workbench.action.navigateBackInEditLocations")
go (forward | for | next) (edit | at it): user.vscode("workbench.action.navigateForwardInEditLocations")

go (prev | previous) (edit | at it): user.vscode("workbench.action.navigatePreviousInEditLocations")

go [to] last (edit | at it): user.vscode("workbench.action.navigateToLastEditLocation")

## navigation locations

#back/forward nav location
go back nav:  user.vscode("workbench.action.navigateBackInNavigationLocations")
go (forward | for | next) nav: user.vscode("workbench.action.navigateForwardInNavigationLocations")
go (prev | previous) nav: user.vscode("workbench.action.navigatePreviousInNavigationLocations")

go [to] last nav: user.vscode("workbench.action.navigateToLastNavigationLocations")

 
#back/forwardused the recent editor
pop back | go back used [(editor | tab)]: user.vscode("workbench.action.openPreviousRecentlyUsedEditor")
pop forward | go (next | forward | for) used [(editor | tab)] : user.vscode("workbench.action.openNextRecentlyUsedEditor")

(pop back | go back used [(editor | tab)]) group: user.vscode("workbench.action.openPreviousRecentlyUsedEditorInGroup")
(pop forward | go (next | forward | for) used) group: user.vscode("workbench.action.openNextRecentlyUsedEditorInGroup")

(join | merge) [(editor | tab)] groups: user.vscode("workbench.action.joinAllGroups")
(join | merge) [(editor | tab)] group with next : user.vscode("workbench.action.joinTwoGroups")


####### comments
(comment |  uncomment) that: key(cmd-/)

#bookmark

(toggle | show | hide | go | view | bar) (bookmarks | links) [(bar | panel | view)]: 
    user.vscode("workbench.view.extension.bookmarks")

((toggle | create | add) [line] bookmark) | bookmark (that | line) | (remove | delete) bookmark: user.vscode("bookmarks.toggle")

bookmark (that | line) (name | named): user.vscode("bookmarks.toggleLabeled")

bookmark (that | line) <user.text>:
    user.vscode("bookmarks.toggleLabeled")
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
    user.vscode("bookmarks.list")
    sleep(300ms)
    insert(text)

(search all bookmarks | all bookmarks list) [<user.text>]:
    user.vscode("bookmarks.listFromAllFiles")
    sleep(300ms)
    insert(text)

#open copied bookmark
open bookmark [(text | name)]:
    user.vscode("bookmarks.listFromAllFiles")
    sleep(300ms)
    key(cmd-v)
    sleep(300ms)
    key(enter)

(bar | focus | go) (bookmarks | links) [(bar | panel | view)]:
    user.vscode("bookmarksExplorer.focus")

[go] next bookmark:         key(cmd-alt-l)
[go] (previous | prev | last) bookmark: key(cmd-alt-j)

copy line link:             user.vscode("extension.linkLine")

[(show | view | bar)] projects: user.vscode("projectsExplorerFavorites.focus")

#favorites

[(show | view | bar)] favorites: user.vscode("workbench.view.extension.favorites-explorer")

(focus | go | bar) favorites: user.vscode("favorites-full-view.focus")

(focus | go | bar) (explore |explorer) favorites: user.vscode("favorites.focus")

file (add | send) [to] (favorite | favorites) | make file favorite | add [file] [to] (favorite | favorites): user.vscode("favorites.addToFavorites")

[file] remove [file] [from] (favorite | favorites): user.vscode("favorites.deleteFavorite")

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

key(cmd-4):                 mimic("copy action id")

key(cmd-3):                 mimic("copy action name")

# key(cmd-2):
#     mimic("copy action id")
#     sleep(300ms)
#     mimic("copy action name")
#     sleep(500ms)
#     mimic("clippy")
#     # mimic("paste one")

kill process:               key(ctrl-c)

reset [(code | app)] zoom:  user.vscode("workbench.action.zoomReset")

Zoom out font:              user.vscode("editor.action.fontZoomOut")
Zoom in font:               user.vscode("editor.action.fontZoomIn")
reset font (zoom | size) | zoom font (reset | default): user.vscode("editor.action.fontZoomReset")

pick code (window | winner | win): user.vscode("workbench.action.switchWindow")

code (swap | next | last) (window | winner | win):
    user.vscode("workbench.action.switchWindow")
    key(enter)
(swap | next | last) code (window | winner | win):
    user.vscode("workbench.action.switchWindow")
    key(enter)
code (window | winner | win) (swap | next | last):
    user.vscode("workbench.action.switchWindow")
    key(enter)

restart ( lsp | ell es pee) [server]: user.vscode("calva.clojureLsp.restart") 
    
(hide | clear) notifications: user.vscode("notifications.clearAll")


#tab navigation

move (editor | tab | group): 
    key(cmd-shift-p)
    insert("view move editor")

(bar | show | go | focus) open (files | editors) [view]: user.vscode("workbench.files.action.focusOpenEditorsView")
split (editor | tab) (right | horizontally ):               user.vscode("workbench.action.splitEditor")

split (editor | tab) (down  | vertically):          user.vscode("workbench.action.splitEditorDown")

split (editor | tab) up:            user.vscode("workbench.action.splitEditorUp")
Split (editor | tab | column) left:          user.vscode("workbench.action.splitEditorLeft")
split (editor | tab | column) right:         user.vscode("workbench.action.splitEditorRight")
split [(editor | tab)] (ortho | orthogonal | other) :         user.vscode("workbench.action.splitEditorOrthogonal")

split [(editor | tab)] [in group]:      user.vscode("workbench.action.toggleSplitEditorInGroup")

split [(editor | tab)] to right [group]:      user.vscode("workbench.action.splitEditorToRightGroup")
split [(editor | tab)] to left [group]:      user.vscode("workbench.action.splitEditorToLeftGroup")
split [(editor | tab)] [to] next [group]:       user.vscode("workbench.action.splitEditorToNextGroup")
split [(editor | tab)] [to] first [group]:      user.vscode("workbench.action.splitEditorToFirstGroup")
split [(editor | tab)] [to] last [group]:       user.vscode("workbench.action.splitEditorToLastGroup")
split [(editor | tab)] [to] above [group]:      user.vscode("workbench.action.splitEditorToAboveGroup")
split [(editor | tab)] [to] below [group]:      user.vscode("workbench.action.splitEditorToBelowGroup")

[(shuffle | shift)] (editor | tab | tabby) (right | push | rate): user.vscode("workbench.action.moveEditorRightInGroup")
[(shuffle | shift)] (editor | tab | tabby) (left | pull): user.vscode("workbench.action.moveEditorLeftInGroup")

(send | .move) (editor | tab) group right: user.vscode("workbench.action.moveActiveEditorGroupRight")
(send | move) (editor | tab) group left: user.vscode("workbench.action.moveActiveEditorGroupLeft")
(send | move) (editor | tab) group up: user.vscode("workbench.action.moveActiveEditorGroupUp")
(send | move) (editor | tab) group down: user.vscode("workbench.action.moveActiveEditorGroupDown")

(send | move) (editor | tab) to right [group]: user.vscode("workbench.action.moveEditorToRightGroup")
(send | move) (editor | tab) to left [group]: user.vscode("workbench.action.moveEditorToLeftGroup")
(send | move) (editor | tab) ([to] above | up) [group]: user.vscode("workbench.action.moveEditorToAboveGroup")
(send | move) (editor | tab) ([to]  below | down) [group]: user.vscode("workbench.action.moveEditorToBelowGroup")
(send | move) (editor | tab) [to]  first [group]: user.vscode("workbench.action.moveEditorToFirstGroup")
(send | move) (editor | tab) [to]  last [group]: user.vscode("workbench.action.moveEditorToLastGroup")
(send | move) (editor | tab) [to]  (previous | prev) [group]: user.vscode("workbench.action.moveEditorToPreviousGroup")
(send | move) (editor | tab) [to]  next [group]: user.vscode("workbench.action.moveEditorToNextGroup")

[i] please  (send | move) (editor | tab):
    key(cmd-shift-p)
    insert("move editor")

#---------- layouts

[i] please layout:
    key(cmd-shift-p)
    insert("layout")

(toggle | flip | next | rotate | vertical | vertico | stacked | horizontal | column) (layout | lea): user.vscode("workbench.action.toggleEditorGroupLayout")

centered [column] layout: user.vscode("workbench.action.toggleCenteredLayout")
single [column] layout: user.vscode("workbench.action.editorLayoutSingle")
(to | two) (column | columns) layout: user.vscode("workbench.action.editorLayoutSingle")
(to | two) (row | rows) layout: user.vscode("workbench.action.editorLayoutTwoRows")

customize layout: usBeer.vscode("workbench.action.customizeLayout") 

# saved layouts extension
bar (layout | layouts | lout): user.vscode("workbench.view.extension.editor-layouts")
go (layout | layouts | lout) : user.vscode("layouts_list.focus")

[i] please (save | saved) (layout | layouts | lout):
    key(cmd-shift-p)
    insert("saved layout")
    
#restore editors extension

(bar | go) restore (layout | layouts | lout): user.vscode("restoreEditors.views.layouts.focus")
(bar | go) (layout | layouts | lout) restore: user.vscode("restoreEditors.views.layouts.focus")

[i] please restore (layout | layouts | lout):
    key(cmd-shift-p)
    insert("restore editor")

# dynamic layouts    

[i] please dynamic (layout | layouts | lout):
    key(cmd-shift-p)
    insert("dynamic layout")



#__________________

[i] please  (go | focus):
    key(cmd-shift-p)
    insert("view focus")

[i] please  (go | focus) [(editor | tab)]:
    key(cmd-shift-p)
    insert("view focus editor")




(toggle | show | hide ) mini map: user.vscode("editor.action.toggleMinimap")

(show | view | visualize) (tokens | scopes | scope): user.vscode("editor.action.inspectTMScopes")

(toggle | show | hide ) (cursors | curses): user.vscode("cursorless.toggleDecorations")

#settings
open (settings | sitting):  user.vscode("workbench.action.openSettings2")
open [user] (settings | sitting) (json | jay son): user.vscode("workbench.action.openSettingsJson")
open workspace (settings | sitting) (json | jay son): user.vscode("workbench.action.openWorkspaceSettingsFile")

(go [to] | pick) symbol:    user.vscode("workbench.action.gotoSymbol")

(bar | hide | show) commits: user.vscode("gitlens.showCommitsView")
(bar | hide | show) file history: user.vscode("gitlens.showFileHistoryView")
go file history: user.vscode("gitlens.views.fileHistory.focus")

#sources
[(show | view | bar)] (sources | git | source control): user.vscode("workbench.view.scm")
go (sources | git | source control): user.vscode("workbench.scm.focus")
(show | view | bar | go) remotes: user.vscode("gitlens.views.remotes.focus")



#todo make this hard prefix operational in vscode
(number  | numb) <user.number_string>: "{number_string}"

(find | show) references:   user.vscode("references-view.findReferences")
(go | bar) references:      user.vscode("references-view.tree.focus")

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
bar [file] tree:            user.vscode("workbench.view.extension.filetree")
go [file] tree:             user.vscode("filetree.focus")

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

#which key menu
(which | witch) key:        user.vscode("whichkey.show")

copy relative path:         user.vscode("copyRelativeFilePath")
copy path:                  user.vscode("copyFilePath")

#pokey stuff
symbol last:                user.vscode("gotoNextPreviousMember.previousMember")
symbol next:                user.vscode("gotoNextPreviousMember.nextMember")

problem show:               user.vscode("workbench.panel.markers.view.focus")

term show: user.vscode("workbench.action.terminal.focus")
clear terminal: user.vscode("workbench.action.terminal.clear")    

show shortcuts:             user.vscode("workbench.action.openGlobalKeybindings")
show shortcuts json:        user.vscode("workbench.action.openGlobalKeybindingsFile")
show snippets:              user.vscode("workbench.action.openSnippets")

break <user.cursorless_target>:
    user.cursorless_command("setSelectionBefore", cursorless_target)
    user.vscode("hideSuggestWidget")
    key("enter")
break:
    user.vscode("hideSuggestWidget")
    key("enter")


(tab | editor | column) (close | clothes): key(cmd-w)


(bar | go) outline: user.vscode("outline.focus")

rename symbol: user.vscode("editor.action.rename")

browse (json | jason): user.vscode("vscode-json-editor.start")


(uncomment | remove comment [from]) <user.cursorless_target>:
    user.cursorless_command("setSelectionBefore", cursorless_target)
    key(backspace:3)

^complete: user.vscode("editor.action.triggerSuggest")
^complete inline: user.vscode("editor.action.inlineSuggest.trigger")

restore terminals: user.vscode("restore-terminals.restoreTerminals")

stencil [force] push command: insert("stencil push -d -a") 

move (view | widget): user.vscode("workbench.action.moveView")

reset all view locations: user.vscode("workbench.action.resetViewLocations")

format [current] (form | for): user.vscode("calva-fmt.formatCurrentForm")

(hide | close) (both | all) bars: 
    user.vscode("workbench.action.closeSidebar")
    user.vscode("workbench.action.closeAuxiliaryBar")

open project: user.vscode("vscode-open-project.openProject")

(terminal | term) font [size] down: user.vscode("terminalFontSize.decrease")
(terminal | term) font [size] up: user.vscode("terminalFontSize.increase")

(change | switch | tab | editor) (font | text) size: user.vscode("extension.switchFontSize")
[(change | switch | tab | editor)] (font | text) [size] <number>: 
    user.vscode("extension.switchFontSize")
    sleep(100ms)
    insert(number)
    sleep(100ms)
    key(enter)

check [for] extension updates | update extensions: user.vscode("workbench.extensions.action.checkForUpdates")