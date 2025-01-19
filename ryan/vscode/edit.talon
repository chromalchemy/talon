app.name: Code
app.name: Cursor
app.name: Windsurf
-

#todo make this hard prefix operational in vscode
(number  | numb) <user.number_string>: "{number_string}"

## clone string,  for ps config edn?
# clone string photo:
#     s = edit.selected_text()
#     insert("[{s}")
#     key(delete space)
#     sleep(100ms)
#     insert("{s}")
#     sleep(100ms)
    # key(delete)



## +++++++++++ Native vscode move form .
#move form defined in calva.talon

code move up: key(alt-up)
code move down: key(alt-down)

 ## +++++++++++++ general edit commands .

#delete line
(chuck | kill) lines | (kill line | killing | k line | cline): 
    user.vscode("editor.action.deleteLines")

(chuck | kill) lines point | (kill line | killing | k line | cline) point:
    key(shift:down)
    mouse_click(0) 
    user.vscode("editor.action.deleteLines")

## ++++++++++++++++++++++++ break line .

break <user.cursorless_target>:
    user.cursorless_command("setSelectionBefore", cursorless_target)
    user.vscode("hideSuggestWidget")
    key("enter")
    
break [line]:
    user.vscode("hideSuggestWidget")
    key("enter")


## +++++++++++++ inline context popups .

show ([(code | token)] hint | (function | fun) (signature | parameters | params)):
    user.vscode("editor.action.triggerParameterHints")

## +++++++++++++++++++++++ completions .

^complete: 
    user.vscode("editor.action.triggerSuggest")

^complete inline: 
    user.vscode("editor.action.inlineSuggest.trigger")
 
trim [line] (whitespace | white | space):
    user.vscode("editor.action.trimTrailingWhitespace")

## +++++++++++++++++ refactor commands .

refactor that | pick refactor [action]:
    user.vscode("editor.action.refactor")

refactor rename:
    user.vscode("editor.action.rename")