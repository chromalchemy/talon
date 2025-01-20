app.name: Code
app.name: Cursor
app.name: Windsurf
tag: user.cursorless
-

bookmark manager settings:
    user.run_rpc_command("bookmark-manager.changeSetting")

## +++++++++++++++++++++++++++++ panel .

(show | toggle | hide) (bookmarks | marks):
    user.run_rpc_command("bookmark-manager.toggleVisibility")

(bar | exit) (bookmarks | marks) [bar]: 
    user.run_rpc_command("workbench.view.extension.bookmark-manager")

(go | focus) (bookmarks | marks) [bar]:
    user.run_rpc_command("bookmark-manager.focus")

[view] (marks | bookmarks) [as] tree | mark tree view:
    user.run_rpc_command("bookmark-manager.viewAsTree")
    
[view] (marks | bookmarks) [as] list | mark list view:
    user.run_rpc_command("bookmark-manager.viewAsList")

#--------------------create bookmarks

(toggle | create | add | new) [line] (bookmark | mark) | (bookmark | mark) line: 
    user.run_rpc_command("bookmark-manager.toggleLineBookmark")

(toggle | create | add | new) (color | colored) [line] (bookmark | mark) | (bookmark | mark) line [with] color: 
    user.run_rpc_command("bookmark-manager.toggleLineBookmarkWithColor")

(toggle | create | add | new) (selection | range) (bookmark | mark) | (bookmark | mark) (selection | range):
    user.run_rpc_command("bookmark-manager.toggleBookmarkWithSelection")


## ++++++++++++++++++++++ create labeled mark .

(bookmark | mark) line (named | labeled | label): 
    user.run_rpc_command("bookmark-manager.toggleLineBookmarkWithLabel")

(bookmark | mark) that [(named | labeled | label)]: 
    t= edit.selected_text()
    user.run_rpc_command("bookmark-manager.toggleLineBookmarkWithLabel")
    sleep(100ms)
    user.paste(t)
    sleep(100ms)
    key(enter)
    
(bookmark | mark) (that | line) [with] [label] <user.text>:
    user.run_rpc_command("bookmark-manager.toggleLineBookmarkWithLabel")
    user.paste(text)
    sleep(300ms)
    key(enter)

(bookmark | mark) (that | line) (paste | pace):
    user.run_rpc_command("bookmark-manager.toggleLineBookmarkWithLabel")
    sleep(200ms)
    edit.paste()
    sleep(200ms)
    key(enter)


## ++++++++++++++++++++++++ pick marks from dropdown list

## ++++++ pick bookmark from current file 

(hunt | search | pick | list) [file] (bookmark | bookmarks | mark | marks ) [in] [current] [file] [for] [<user.text>]:
    user.run_rpc_command("bookmark-manager.listBookmarksInCurrentFile")
    sleep(100ms)
    user.paste(text or "")

(hunt | search | pick | list) [file] (bookmark | bookmarks | mark | marks ) [in] [current] [file] [for]  pop  <user.text>:
    user.run_rpc_command("bookmark-manager.listBookmarksInCurrentFile")
    sleep(100ms)
    user.paste(text)
    sleep(100ms)
    key(enter)
    
## +++++++++++++++++++ pick from group .

list marks in [selected] group:
    user.run_rpc_command("bookmark-manager.listBookmarksInSelectedGroup")

## +++++++++++++++++++++ Pick from all .

(hunt | search | pick | list) all (bookmark | bookmarks | mark | marks ) [for] [<user.text>]:
    user.run_rpc_command("bookmark-manager.quickJumpTo")
    sleep(100ms)
    user.paste(text or "")

[go] (marks | (bookmark | mark) all) <user.text>:
    user.run_rpc_command("bookmark-manager.quickJumpTo")
    sleep(100ms)
    user.paste(text)
    sleep(100ms)
    key(enter)

#open pasted bookmark bookmark name, from all files
(hunt | search | pick | list) [all] (bookmark | bookmarks | mark | marks ) (paste | pace):
    user.run_rpc_command("bookmark-manager.quickJumpTo")
    sleep(100ms)
    edit.paste()
    sleep(100ms)
    key(enter)

## ++++++++++++++++++++++ jump to bookmark .

(go | jump) [to] (bookmark | mark) [source] [(location | locations)]:    
    user.run_rpc_command("bookmark-manager.gotoSourceLocation")

### not developed yet
# open mark in editor: 
#     user.run_rpc_command("bookmark-manager.openInEditor")

## +++++++++++++++++++++++ reveal file .

reveal mark (in explorer | file):
    user.run_rpc_command("bookmark-manager.revealInExplorer")

## ++++++++++++++++++++ cursorless use .

#doesn't work
# demo dog <user.cursorless_target>:
#     user.private_cursorless_action_or_ide_command("showQuickFix", cursorless_target)

# walk my crown:
#     user.private_cursorless_action_or_ide_command("scrollToTop", "currentSelection")

 ## ++++++++++++++++++++ edit bookmark

(edit mark name | (rename | renamed) mark) [<user.text>]:
    user.run_rpc_command("bookmark-manager.editLabel")
    sleep(100ms)
    insert(text or "")

(edit mark name | (rename | renamed) mark) [<user.text>] pop$:
    user.run_rpc_command("bookmark-manager.editLabel")
    sleep(100ms)
    insert(text)
    sleep(100ms)
    key(enter)

(edit mark name | (rename | renamed) mark) (paste | pace):
    user.run_rpc_command("bookmark-manager.editLabel")
    sleep(100ms)
    edit.paste()
    sleep(100ms)
    key(enter)
    
# copy mark name:
#     user.run_rpc_command("bookmark-manager.editLabel")
#     sleep(100ms)
#     edit.copy()
#     # key(esc)

edit mark description: 
    user.run_rpc_command("bookmark-manager.editDescription")

change mark group | move :
    user.run_rpc_command("bookmark-manager.changeBookmarkGroup")

(change | pick) mark color:
    user.run_rpc_command("bookmark-manager.changeBookmarkColor")

rename mark color: 
    user.run_rpc_command("bookmark-manager.changeBookmarkColorName")

(remove | delete | chuck) bookmark: 
    user.run_rpc_command("bookmark-manager.deleteBookmark")
    

## +++++++++++++++++++++++ clear marks .

(chuck | clear) all (marks | bookmarks): 
    user.run_rpc_command("bookmark-manager.clearAllBookmarks")
    
(chuck | clear) ([all] (marks | bookmarks) in file | file (marks | bookmarks)): 
    user.run_rpc_command("bookmark-manager.clearAllBookmarksInCurrentFile")

(chuck | clear) all (marks | bookmarks) (in | with) color: 
    user.run_rpc_command("bookmark-manager.clearAllBookmarksInColor")

(chuck | clear) all (marks | bookmarks) in group: 
    user.run_rpc_command("bookmark-manager.clearAllBookmarksInGroup")
    
## +++++++++++++++++++ edit mark group .

(add | new | create) mark group [<user.text>]:
    user.run_rpc_command("bookmark-manager.addBookmarkGroup")
    sleep(100ms)
    key(enter)
    sleep(100ms)
    insert(text or "")

edit mark group name | rename mark group:
    user.run_rpc_command("bookmark-manager.changeBookmarkGroupLabel")

change mark group color:
    user.run_rpc_command("bookmark-manager.changeBookmarkGroupColor")

(pick | set) (active | default) mark group:
    user.run_rpc_command("bookmark-manager.setAsDefaultActivedGroup")

(remove | delete) mark group: 
    user.run_rpc_command("bookmark-manager.deleteBookmarkGroup")

## ++++++++++++++++++++ group marks by .

group marks [by] color:
    user.run_rpc_command("bookmark-manager.groupedByColor")

group marks [by] default:
    user.run_rpc_command("bookmark-manager.groupedByDefault")

group marks [by] (custom | group):
    user.run_rpc_command("bookmark-manager.groupedByCustom")

group marks [by] workspace:
    user.run_rpc_command("bookmark-manager.groupedByWorkspace")

## +++++++++++++++++++++++ walkthrough .

show mark (walkthrough | walkthrougs | (walked | walk) (through | troughs)):
    user.run_rpc_command("bookmark-manager.showWalkthroughs")

## ++++++++++++++++++++++++++++++ sort bookmarks .

sort marks by ([(creation | create)] date | date created):
    user.run_rpc_command("bookmark-manager.sortedByCreateTime")
    
sort marks by custom:
    user.run_rpc_command("bookmark-manager.sortedByCustom")

sort marks by line [(number | num | knumb)]:
    user.run_rpc_command("bookmark-manager.sortedByLineNumber")


## ++++++++ universal marks (snippets) .

(go | focus) universal (bookmarks | marks):
    user.run_rpc_command("bookmark-manager.universal.focus")

(show | bar | toggle) universal (bookmarks | marks):
    user.run_rpc_command("bookmark-manager.universal.toggleVisibility")