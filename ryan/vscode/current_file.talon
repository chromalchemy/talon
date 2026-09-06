app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

revert file [to (saved | disk)] [version]: 
    user.run_rpc_command("workbench.action.files.revert")

kill current file:
    user.run_rpc_command("andreas.removeFile")

((hunt |  (open | hope (and | in))) ((file | frow)  | filename) | file (open | hope in)) [<user.text>]: 
    key(cmd-p)
    sleep(300ms)
    insert(text or "")

((hunt |  (open | hope and)) ((file | frow)  | filename) | file (open | hope in)) [<user.text>] pop: 
    key(cmd-p)
    sleep(300ms)
    insert(text)
    sleep(200ms)
    key(enter)


(show | reveal) [file] [in] (finder | files): 
    user.run_rpc_command("revealFileInOS")

#use axkit command
# (show | reveal) file [in] finder:
#     #todo: not working
#     # key(cmd-alt-r)
#     key(cmd-shift-p)
#     sleep(100ms)
#     insert("reveal in finder")
#     sleep(100ms)
#     key(enter)

duplicate [current] file:
    user.run_rpc_command("andreas.duplicateFile")

new (text | untitled) (file | document | doc | tab):
    user.run_rpc_command("workbench.action.files.newUntitledFile")
