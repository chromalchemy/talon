app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless

-

(close | hide) (search | hunt) bar: 
    key(esc:2)

## ++++++++++++++ find/replace helpers .

#navigates to find field only if on empty space/line
(go | open | focus | show) (hunt [this] | scout | find in file) [panel]: 
    user.run_rpc_command("actions.find")

#navigates to replace field only if no text selected, and result is targeted 
(show | toggle | go) replace | replace (text | scout | target):    
    user.run_rpc_command("editor.action.startFindReplaceAction")

#pastes to replace field only if no text selected, and result is targeted 
replace (paste | pace):    
    user.run_rpc_command("editor.action.startFindReplaceAction") 
    sleep(100ms) 
    edit.paste()

replace (next | that):
    key(enter)

replace all:
    key(cmd-enter) 

# search in locked selection   
replace here:
    user.replace("")
    key(cmd-alt-l)

#todo: make this better?
replace <user.cursorless_target>:
    t = user.cursorless_get_text(cursorless_target)
    user.cursorless_command("setSelection", cursorless_target)
    sleep(100ms)
    user.replace("{t}")

#todo: make this better?
replace in <user.cursorless_target>:
    user.cursorless_command("setSelection", cursorless_target)
    sleep(100ms)
    user.replace("")
    key(cmd-alt-l)


# toggle find in selection lock
[toggle] (hunt | find | replace | scout) [in] (selection | selected | taken | [(whole | full)] page | rest): 
    key(alt-cmd-l)

swap replace: 
    edit.select_all()
    edit.copy()
    user.run_rpc_command("actions.find")
    edit.paste()
    user.run_rpc_command("editor.action.startFindReplaceAction")

toggle find (regex | rejects | regular expressions):
     user.run_rpc_command("toggleFindRegex")

[toggle] find [match] case [(sensitive | sensitivity | sense)]:
     user.run_rpc_command("toggleFindCaseSensitive")

toggle find [whole] word:
     user.run_rpc_command("toggleFindWholeWord")

