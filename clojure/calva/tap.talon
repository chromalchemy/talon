app: vscode
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless

-
#usefull with portal

## ++++++++++++++++++++++++++ tap top form 

tap (it | top [form]):
    user.vscode("calva.tapCurrentTopLevelForm") 

tap [(top | top form)] <user.cursorless_target>:
    user.cursorless_ide_command("calva.tapCurrentTopLevelForm", cursorless_target)

tap [(it | top [form])] point:
    mouse_click(0)
    user.vscode("calva.tapCurrentTopLevelForm") 

## ++++++++++++++++ tap selected text /caret from .

tap (that | form | here): 
    user.vscode("calva.tapSelection")

tap <user.cursorless_target>:
    user.cursorless_ide_command("calva.tapSelection", cursorless_target)
    
tap (that | form | here) point: 
    mouse_click(0)
    user.vscode("calva.tapSelection")
