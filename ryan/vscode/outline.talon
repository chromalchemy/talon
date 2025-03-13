app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

(bar | go | focus) outline$: 
    user.run_rpc_command("outline.focus")


(bar | go | focus | hunt) outline <user.text>: 
    user.run_rpc_command("outline.focus")
    sleep(100ms)
    insert(text)

(bar | go | focus | hunt) outline <user.format_code>+$: 
    user.run_rpc_command("outline.focus")
    sleep(100ms)
    user.insert_many(format_code_list)

[toggle] outline follow:
    user.run_rpc_command("outline.followCursor")

[toggle] outline filter [on] type:
    user.run_rpc_command("outline.filterOnType")

unfold outline | outline unfold:
    user.run_rpc_command("outline.expand")

fold outline | outline fold:
    user.run_rpc_command("outline.collapse")

outline sort [by] position:
    user.run_rpc_command("outline.sortByPosition")
outline sort [by] name:
    user.run_rpc_command("outline.sortByName")
outline sort [by] (kind | category):
    user.run_rpc_command("outline.sortByKind")

    