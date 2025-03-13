app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless

-
#usefull with portal

## ++++++++++++++++++++++++++ tap top form 

(tap | send) (it | top [form]):
    user.run_rpc_command("calva.tapCurrentTopLevelForm") 

(tap | send) [(top | top form)] <user.cursorless_target>:
    user.cursorless_ide_command("calva.tapCurrentTopLevelForm", cursorless_target)

(tap | send) (it | top [form]) point:
    mouse_click(0)
    user.run_rpc_command("calva.tapCurrentTopLevelForm") 

## ++++++++++++++++ tap selected text /caret from .

(tap | send) (that | form | here): 
    user.run_rpc_command("calva.tapSelection")

(tap | send) <user.cursorless_target>:
    user.cursorless_ide_command("calva.tapSelection", cursorless_target)
    
(tap | send) [(that | form | here)] point: 
    mouse_click(0)
    user.run_rpc_command("calva.tapSelection")
