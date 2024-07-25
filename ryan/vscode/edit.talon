app.name: Code
-

#todo make this hard prefix operational in vscode
(number  | numb) <user.number_string>: "{number_string}"

######## clone lines
clone string:
    s = edit.selected_text()
    insert("[{s}")
    key(delete space)
    sleep(100ms)
    insert("{s}")
    sleep(100ms)
    # key(delete)

# Native vscode move form commands

code move up: key(alt-up)
code move down: key(alt-down)

##### general edit commands

[(show | go)] (context menu [(here | curse | cursor)]) | menu (curse | cursor):
    user.vscode("editor.action.showContextMenu")

menu point: 
    mouse_click(1)

#delete line
kill (line | lines) | killing | k line | cline: user.vscode("editor.action.deleteLines")

break <user.cursorless_target>:
    user.cursorless_command("setSelectionBefore", cursorless_target)
    user.vscode("hideSuggestWidget")
    key("enter")
    
break:
    user.vscode("hideSuggestWidget")
    key("enter")

^complete: user.vscode("editor.action.triggerSuggest")
^complete inline: user.vscode("editor.action.inlineSuggest.trigger")
 
