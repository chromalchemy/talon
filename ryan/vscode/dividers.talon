app.name: Code
app.name: Cursor
app.name: Windsurf
-

(insert | add | make | new) divider [line]: 
    user.run_rpc_command("comment-divider.insertSolidLine")

(insert | add | make | new) (header | head or) [<user.text>]: 
    insert("{text or ''}")
    sleep(100ms)
    user.run_rpc_command("comment-divider.makeSubHeader")

(talon | talent) (subhead | subheader) pretext: 
    insert("## ++++++++++++++++++")
