app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

## +++++++++++++++++++++ show commands .

please calva (evaluate | eval):
    key(cmd-shift-p)
    insert("evaluate ")

## +++++++++++++++++++++++++ load file .

[(rep | repl | ripple | rebel)] (load | reload) (file | pile) [in (rep | repl | ripple | rebel)] | (reload it | reloaded): 
    user.run_rpc_command("calva.loadFile")
    sleep(300ms)
    user.run_rpc_command("notifications.clearAll")

[(rep | repl | ripple | rebel)] (load | reload) (file | pile) [in (rep | repl | ripple | rebel)] (alert | alerts | raw) : 
    user.run_rpc_command("calva.loadFile")

## +++++++++++++++++++++ eval whole file .

[(rep | repl | ripple | rebel)] (evaluate | eval | compute | comp | run | runt) [(whole | entire)] (file | pile):
    user.run_rpc_command("editor.action.selectAll") 
    user.run_rpc_command("calva.evaluateSelection")
    user.run_rpc_command("cursorUndo")

## +++++++++++++++++++++ eval top form .

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt | rennet) [it] [(top | top form)] [fresh]:
    user.run_rpc_command("calva.evaluateCurrentTopLevelForm")

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) [(top | top form)] <user.cursorless_target>:
    user.cursorless_ide_command("calva.evaluateCurrentTopLevelForm", cursorless_target)

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) [it] [(top | top form)] [fresh] point:
    mouse_click(0)
    user.run_rpc_command("calva.evaluateCurrentTopLevelForm")

#eval top form to comment
(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) [it] [(top | top form)] [( as | to | too | two )] comment:
    user.run_rpc_command("calva.evaluateTopLevelFormAsComment")

## +++++++++++++++ eval enclosing form .

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) ([this] form | (enclosing | in closing | wrapping) [form]):
    user.run_rpc_command("calva.evaluateEnclosingForm")


## ++++++++++ eval selection or current form @ caret .

(rep | repl | ripple |  evaluate | eval | compute | comp | run | runt) (here | that | selection):
    user.run_rpc_command("calva.evaluateSelection")

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) <user.cursorless_target>:
    user.cursorless_ide_command("calva.evaluateSelection", cursorless_target)

(rep | repl | ripple |  evaluate | eval | compute | comp | run | runt) point:
    mouse_click(0)
    user.run_rpc_command("calva.evaluateSelection")


## ++++++++++ eval selection, closing brackets .

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) (here | that | selection) (closing | close | closed):
    user.run_rpc_command("calva.evaluateSelectionToSelectionEnd")

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) (closing | close | closed) <user.cursorless_target>:
    user.cursorless_ide_command("calva.evaluateSelectionToSelectionEnd", cursorless_target)

(rep | repl | ripple |  evaluate | eval | compute | comp | run | runt) (closing | close | closed) point:
    key(shift:down)
    mouse_click(0)
    user.run_rpc_command("calva.evaluateSelectionToSelectionEnd")

# combination w paredit
#operates on selection, leaves start to cursor selected
#same effect as calva.evaluateToCursor ?
(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) (selection [from] start | [from]  start (closing | close | closed)):
    user.run_rpc_command("paredit.selectBackwardUpSexp")
    user.run_rpc_command("calva.evaluateSelectionToSelectionEnd")
    





## ++++++++++++++++ copy last repl result.

(copy | take) [last] [repl] (result | output | evaluation | eval): 
    user.run_rpc_command("calva.copyLastResults")

## ++++++++++++ eval to cursor (closing brackets) .

# eval from start of the current enclosing list to cursor 
# not available when text selected
(evaluate | eval | run | runt) [from] (list | form | pair) [start] (to | two | too) (here | curse | cursor): 
    user.run_rpc_command("calva.evaluateToCursor")

(evaluate | eval | run | runt) [from] (list | form | pair) [start] (to | two | too) point: 
    mouse_click(0)
    user.run_rpc_command("calva.evaluateToCursor")

# eval from start of top level form to cursor, for threading macros
(evaluate | eval | run | runt) [from] [top] [form] (to | two | too) (here | curse | cursor): 
    user.run_rpc_command("calva.evaluateTopLevelFormToCursor")

(evaluate | eval | run | runt) [from] [top] [form] (to | two | too) point:
    mouse_click(0)
    user.run_rpc_command("calva.evaluateTopLevelFormToCursor")

(evaluate | eval | run | runt) [from] (start of file | file (start | top) ):  
    user.run_rpc_command("calva.evaluateStartOfFileToCursor")

    
run top (symbol | name):
    user.run_rpc_command("calva.runCustomREPLCommand", "ets")

## ++++++++++++++++++++ eval and print (selection) .

#eval selected text or current form as comment
(rep | repl | ripple |  evaluate | eval | compute | comp | run | runt) (here | that | selection) [as] comment:
    user.run_rpc_command("calva.evaluateSelectionAsComment")

#eval selection and replace with result
evaluate and replace [with result]: 
    user.run_rpc_command("calva.evaluateSelectionReplace")

## +++++++++++++++++ paste last result .

(pace | paste | print) [last] [repl] (result | output | evaluation | eval): 
    user.run_rpc_command("calva.copyLastResults")
    edit.paste()

(pace | paste | print) [last] [repl] (result | output | evaluation | eval) [(to | too | two)] new [(file | editor | tab | window | win)]: 
    user.run_rpc_command("calva.copyLastResults")
    user.run_rpc_command("workbench.action.files.newUntitledFile")
    sleep(100ms)
    user.run_rpc_command("workbench.action.editor.changeLanguageMode")
    sleep(100ms)
    insert("clojure")
    sleep(100ms)
    key(enter)
    sleep(100ms)
    # user.run_rpc_command("workbench.action.moveEditorToRightGroup")
    # user.run_rpc_command("workbench.action.moveEditorToNextGroup")
    # sleep(100ms)
    edit.paste()

## ++++++++++++++++++++++++++++++ misc .

(interrupt | cancel | kill) [(running | current)] repl [(evaluation | evaluations)]: 
    user.run_rpc_command("calva.interruptAllEvaluations")

toggle send evaluated code to repl [window]: 
    user.run_rpc_command("calva.toggleEvaluationSendCodeToOutputWindow")

toggle repl pretty printing: 
    user.run_rpc_command("calva.togglePrettyPrint") 

print [(clojure | closure)] (docs [examples] | examples):
    calva.printClojureDocsToOutputWindow() 