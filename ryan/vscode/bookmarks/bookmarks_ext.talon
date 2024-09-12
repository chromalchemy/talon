app.name: Code
tag: user.cursorless
-

(focus | show | bar) (bookmarks | marks | links) [(bar | panel | view)]:
    user.vscode("bookmarksExplorer.focus")

#--------------------create bookmarks

(toggle | create | add | new) [line] (bookmark | mark) | (bookmark | mark) line: 
    user.vscode("bookmarks.toggle")

(remove | delete) (bookmark | mark): 
    user.vscode("bookmarks.toggle")

(bookmark | mark) (that | line) (named | labelled): 
    user.vscode("bookmarks.toggleLabeled")

(bookmark | mark) that$:
    t= edit.selected_text()
    user.vscode("bookmarks.toggleLabeled")
    user.paste(t)
    sleep(300ms)
    key(enter)

(bookmark | mark) <user.cursorless_target>:
    t = user.cursorless_get_text(cursorless_target)
    user.cursorless_command("setSelection", cursorless_target)
    sleep(300ms)
    user.vscode("bookmarks.toggleLabeled")
    user.paste(t)
    sleep(300ms)
    key(enter)
    
(bookmark | mark) (that | line) [with] (label | labelled) <user.text>:
    user.vscode("bookmarks.toggleLabeled")
    insert(text)
    sleep(300ms)
    key(enter)

(bookmark | mark) that [(paste | pace)]:
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


go [file] (bookmark | mark) <user.text>:
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

rename (bookmark | mark):
    mouse_click(1)
    sleep(300ms)
    key(down)
    key(enter)

rename (bookmark | mark) [<user.text>]:
    mouse_click(1)
    sleep(300ms)
    key(down)
    key(enter)
    insert(text)
    sleep(300ms)
    key(enter)

copy (bookmark | mark) name:
    mouse_click(1)
    sleep(300ms)
    key(down)
    key(enter)
    key(cmd-c)
    key(esc)
