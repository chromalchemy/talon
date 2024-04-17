app: vscode
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

(comment |  uncomment) that: key(cmd-/)

(uncomment | remove comment [from]) <user.cursorless_target>:
     user.cursorless_command("setSelectionBefore", cursorless_target)
     key(backspace:3)

insert (semicolon | semi colon); 
    user.vscode("paredit.insertSemiColon")

[(insert | add)] comment (symbol | mark): 
    insert("#_")

[(insert | add)] dub comment (symbol | symbols | mark | marks): 
    insert("#_#_")

(make | add) rich comment: 
    user.vscode("paredit.addRichComment")

(comment |  uncomment) form: 
    key(cmd-/)
    
(comment |  uncomment) line: 
    key(shift-right cmd-/)

(comment |  uncomment) point:
    key("shift:down")
    mouse_click(0)
    user.mouse_drag_end() 
    key(shift-right cmd-/)