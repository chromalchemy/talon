app.name: Code
tag: user.cursorless
-

bookmark manager settings:
    user.vscode("bookmark-manager.changeSetting")

## +++++++++++++++++++++++++++++ panel .

(show | toggle | hide) (bookmarks | marks):
    user.vscode("bookmark-manager.toggleVisibility")

(bar | exit) (bookmarks | marks) [bar]: 
    user.vscode("workbench.view.extension.bookmark-manager")

(go | focus) (bookmarks | marks) [bar]:
    user.vscode("bookmark-manager.focus")

[view] (marks | bookmarks) [as] tree | mark tree view:
    user.vscode("bookmark-manager.viewAsTree")
    
[view] (marks | bookmarks) [as] list | mark list view:
    user.vscode("bookmark-manager.viewAsList")

#--------------------create bookmarks

(toggle | create | add | new) [line] (bookmark | mark) | (bookmark | mark) line: 
    user.vscode("bookmark-manager.toggleLineBookmark")

(toggle | create | add | new) (color | colored) [line] (bookmark | mark) | (bookmark | mark) line [with] color: 
    user.vscode("bookmark-manager.toggleLineBookmarkWithColor")

(toggle | create | add | new) (selection | range) (bookmark | mark) | (bookmark | mark) (selection | range):
    user.vscode("bookmark-manager.toggleBookmarkWithSelection")


## ++++++++++++++++++++++ create labeled mark .

(bookmark | mark) line (named | labeled | label): 
    user.vscode("bookmark-manager.toggleLineBookmarkWithLabel")

(bookmark | mark) that [(named | labeled | label)]: 
    t= edit.selected_text()
    user.vscode("bookmark-manager.toggleLineBookmarkWithLabel")
    sleep(100ms)
    user.paste(t)
    sleep(100ms)
    key(enter)
    
(bookmark | mark) (that | line) [with] [label] <user.text>:
    user.vscode("bookmark-manager.toggleLineBookmarkWithLabel")
    user.paste(text)
    sleep(300ms)
    key(enter)

(bookmark | mark) (that | line) (paste | pace):
    user.vscode("bookmark-manager.toggleLineBookmarkWithLabel")
    sleep(200ms)
    edit.paste()
    sleep(200ms)
    key(enter)


## ++++++++++++++++++++++++ pick marks from dropdown list

## ++++++ pick bookmark from current file 

(hunt | search | pick | list) [file] (bookmark | bookmarks | mark | marks ) [in] [current] [file] [for] [<user.text>]:
    user.vscode("bookmark-manager.listBookmarksInCurrentFile")
    sleep(100ms)
    user.paste(text or "")

(hunt | search | pick | list) [file] (bookmark | bookmarks | mark | marks ) [in] [current] [file] [for]  pop  <user.text>:
    user.vscode("bookmark-manager.listBookmarksInCurrentFile")
    sleep(100ms)
    user.paste(text)
    sleep(100ms)
    key(enter)
    
## +++++++++++++++++++ pick from group .

list marks in [selected] group:
    user.vscode("bookmark-manager.listBookmarksInSelectedGroup")

## +++++++++++++++++++++ Pick from all .

(hunt | search | pick | list) all (bookmark | bookmarks | mark | marks ) [for] [<user.text>]:
    user.vscode("bookmark-manager.quickJumpTo")
    sleep(100ms)
    user.paste(text or "")

[go] (marks | (bookmark | mark) all) <user.text>:
    user.vscode("bookmark-manager.quickJumpTo")
    sleep(100ms)
    user.paste(text)
    sleep(100ms)
    key(enter)

#open pasted bookmark bookmark name, from all files
(hunt | search | pick | list) [all] (bookmark | bookmarks | mark | marks ) (paste | pace):
    user.vscode("bookmark-manager.quickJumpTo")
    sleep(100ms)
    edit.paste()
    sleep(100ms)
    key(enter)

## ++++++++++++++++++++++ jump to bookmark .

(go | jump) [to] (bookmark | mark) [source] [(location | locations)]:    
    user.vscode("bookmark-manager.gotoSourceLocation")

### not developed yet
# open mark in editor: 
#     user.vscode("bookmark-manager.openInEditor")

## +++++++++++++++++++++++ reveal file .

reveal mark (in explorer | file):
    user.vscode("bookmark-manager.revealInExplorer")

## ++++++++++++++++++++ cursorless use .

#doesn't work
# demo dog <user.cursorless_target>:
#     user.private_cursorless_action_or_ide_command("showQuickFix", cursorless_target)

# walk my crown:
#     user.private_cursorless_action_or_ide_command("scrollToTop", "currentSelection")

 ## ++++++++++++++++++++ edit bookmark

(edit mark name | (rename | renamed) mark) [<user.text>]:
    user.vscode("bookmark-manager.editLabel")
    sleep(100ms)
    insert(text or "")

(edit mark name | (rename | renamed) mark) [<user.text>] pop$:
    user.vscode("bookmark-manager.editLabel")
    sleep(100ms)
    insert(text)
    sleep(100ms)
    key(enter)

(edit mark name | (rename | renamed) mark) (paste | pace):
    user.vscode("bookmark-manager.editLabel")
    sleep(100ms)
    edit.paste()
    sleep(100ms)
    key(enter)
    
# copy mark name:
#     user.vscode("bookmark-manager.editLabel")
#     sleep(100ms)
#     edit.copy()
#     # key(esc)

edit mark description: 
    user.vscode("bookmark-manager.editDescription")

change mark group | move :
    user.vscode("bookmark-manager.changeBookmarkGroup")

(change | pick) mark color:
    user.vscode("bookmark-manager.changeBookmarkColor")

rename mark color: 
    user.vscode("bookmark-manager.changeBookmarkColorName")

(remove | delete | chuck) bookmark: 
    user.vscode("bookmark-manager.deleteBookmark")
    

## +++++++++++++++++++++++ clear marks .

(chuck | clear) all (marks | bookmarks): 
    user.vscode("bookmark-manager.clearAllBookmarks")
    
(chuck | clear) ([all] (marks | bookmarks) in file | file (marks | bookmarks)): 
    user.vscode("bookmark-manager.clearAllBookmarksInCurrentFile")

(chuck | clear) all (marks | bookmarks) (in | with) color: 
    user.vscode("bookmark-manager.clearAllBookmarksInColor")

(chuck | clear) all (marks | bookmarks) in group: 
    user.vscode("bookmark-manager.clearAllBookmarksInGroup")
    
## +++++++++++++++++++ edit mark group .

(add | new | create) mark group [<user.text>]:
    user.vscode("bookmark-manager.addBookmarkGroup")
    sleep(100ms)
    key(enter)
    sleep(100ms)
    insert(text or "")

edit mark group name | rename mark group:
    user.vscode("bookmark-manager.changeBookmarkGroupLabel")

change mark group color:
    user.vscode("bookmark-manager.changeBookmarkGroupColor")

(pick | set) (active | default) mark group:
    user.vscode("bookmark-manager.setAsDefaultActivedGroup")

(remove | delete) mark group: 
    user.vscode("bookmark-manager.deleteBookmarkGroup")

## ++++++++++++++++++++ group marks by .

group marks [by] color:
    user.vscode("bookmark-manager.groupedByColor")

group marks [by] default:
    user.vscode("bookmark-manager.groupedByDefault")

group marks [by] (custom | group):
    user.vscode("bookmark-manager.groupedByCustom")

group marks [by] workspace:
    user.vscode("bookmark-manager.groupedByWorkspace")

## +++++++++++++++++++++++ walkthrough .

show mark (walkthrough | walkthrougs | (walked | walk) (through | troughs)):
    user.vscode("bookmark-manager.showWalkthroughs")

## ++++++++++++++++++++++++++++++ sort bookmarks .

sort marks by ([(creation | create)] date | date created):
    user.vscode("bookmark-manager.sortedByCreateTime")
    
sort marks by custom:
    user.vscode("bookmark-manager.sortedByCustom")

sort marks by line [(number | num | knumb)]:
    user.vscode("bookmark-manager.sortedByLineNumber")


## ++++++++ universal marks (snippets) .

(go | focus) universal (bookmarks | marks):
    user.vscode("bookmark-manager.universal.focus")

(show | bar | toggle) universal (bookmarks | marks):
    user.vscode("bookmark-manager.universal.toggleVisibility")