app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

[new] [(line | text)] comment [<user.prose>]:
    user.paste(";; {prose or ''}")

(comment |  uncomment) that: key(cmd-/)

(uncomment | remove comment [from]) <user.cursorless_target>:
     user.cursorless_command("setSelectionBefore", cursorless_target)
     key(backspace:3)

insert (semicolon | semi colon):
    user.run_rpc_command("paredit.insertSemiColon")

[(insert | add)] comment (symbol | mark): 
    insert("#_")

[(insert | add)] dub comment (symbol | symbols | mark | marks): 
    insert("#_#_")

(make | add) rich comment: 
    user.run_rpc_command("paredit.addRichComment")

(comment |  uncomment) form: 
    key(cmd-/)
    
(comment |  uncomment) line: 
    key(shift-right cmd-/)

(comment |  uncomment) point:
    key("shift:down")
    mouse_click(0)
    user.mouse_drag_end() 
    key(shift-right cmd-/)