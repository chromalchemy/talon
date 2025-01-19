app.name: Code
app.name: Cursor
app.name: Windsurf
tag: user.cursorless
-

(show | bar | toggle) (bookmarks | marks):
    user.vscode("workbench.view.extension.bookmark_x")

(go | focus) (bookmarks | marks):
    user.vscode("bookmarksByGroup.focus")

#--------------------create bookmarks

(toggle | create | add) [line] bookmark | bookmark line: 
    user.vscode("bookmark_x.toggleBookmark")

bookmark (that | line) (named | labeled): 
    user.vscode("bookmark_x.toggleLabeledBookmark")

bookmark (that | line) [with] [label] <user.text>:
    user.vscode("bookmark_x.toggleLabeledBookmark")
    insert(text)
    sleep(300ms)
    key(enter)

bookmark that [(paste | pace)]:
    edit.copy()
    user.vscode("bookmark_x.toggleLabeledBookmark")
    edit.paste()
    sleep(300ms)
    key(enter)

## +++++++++++++++++++ delete bookmark .

(remove | delete | chuck) bookmark: 
    user.vscode("bookmark_x.deleteBookmark")
    
## ++++++++++++++++++++++ jump to bookmark .

go (bookmark | mark):    
    user.vscode("bookmark_x.jumpToBookmark")

reveal (bookmark | mark) [in] [current] [line]:
    user.vscode("bookmark_x.revealBookmark")

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

load [all] marks: 
    user.vscode("bookmark_x.loadBookmarksInWorkSpace")

#doesn't work
# demo dog <user.cursorless_target>:
#     user.private_cursorless_action_or_ide_command("showQuickFix", cursorless_target)

# walk my crown:
#     user.private_cursorless_action_or_ide_command("scrollToTop", "currentSelection")


## ++++++++++++++++++++++++++++++ save .

save (bookmarks | all marks):
    user.vscode("bookmark_x.saveBookmarksInWorkspace")

## ++++++ pick bookmark from all files .
(hunt | search | pick | list) all (bookmark | bookmarks | mark | marks ) [for] group [<user.text>]:
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

edit mark name:
    user.vscode("bookmark_x.editBookmarkName")

rename bookmark:
    mouse_click(1)
    user.vscode("bookmark_x.editBookmarkName")

rename bookmark [<user.text>]:
    mouse_click(1)
    sleep(300ms)
    user.vscode("bookmark_x.editBookmarkName")
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


## +++++++++++++++++++++++++++++ group .

add mark group:
    user.vscode("bookmark_x.addGroup")

edit mark group name:
    user.vscode("bookmark_x.editGroupName")

(remove | delete) mark group: 
    user.vscode("bookmark_x.deleteGroup")

activate mark group:
    user.vscode("bookmark_x.activateGroup")

add mark subgroup [here]:
    user.vscode("bookmark_x.addSubGroup")
