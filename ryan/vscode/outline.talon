app.name: Code
app.name: Cursor
app.name: Windsurf
-

(bar | go | focus) outline$: 
    user.vscode("outline.focus")


(bar | go | focus | hunt) outline <user.text>: 
    user.vscode("outline.focus")
    sleep(100ms)
    insert(text)

(bar | go | focus | hunt) outline <user.format_code>+$: 
    user.vscode("outline.focus")
    sleep(100ms)
    user.insert_many(format_code_list)

[toggle] outline follow:
    user.vscode("outline.followCursor")

[toggle] outline filter [on] type:
    user.vscode("outline.filterOnType")

unfold outline | outline unfold:
    user.vscode("outline.expand")

fold outline | outline fold:
    user.vscode("outline.collapse")

outline sort [by] position:
    user.vscode("outline.sortByPosition")
outline sort [by] name:
    user.vscode("outline.sortByName")
outline sort [by] (kind | category):
    user.vscode("outline.sortByKind")

    