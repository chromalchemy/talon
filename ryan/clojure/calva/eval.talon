app: vscode
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

## +++++++++++++++++++++ show commands .

please calva (evaluate | eval):
    key(cmd-shift-p)
    insert("evaluate ")

## +++++++++++++++++++++++++ load file .

[(rep | repl | ripple | rebel)] (load | reload) file [in (rep | repl | ripple | rebel)]: 
    user.vscode("calva.loadFile")
    sleep(300ms)
    user.vscode("notifications.clearAll")

[(rep | repl | ripple | rebel)] (load | reload) file [in (rep | repl | ripple | rebel)] (alert | alerts | raw) : 
    user.vscode("calva.loadFile")

## +++++++++++++++++++++ eval whole file .

[(rep | repl | ripple | rebel)] (evaluate | eval | compute | comp | run | runt) [(whole | entire)] file:
    user.vscode("editor.action.selectAll") 
    user.vscode("calva.evaluateSelection")
    user.vscode("cursorUndo")

## +++++++++++++++++++++ eval top form .

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt | rennet) [it] [(top | top form)] [fresh]:
    user.vscode("calva.evaluateCurrentTopLevelForm")

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) [(top | top form)] <user.cursorless_target>:
    user.cursorless_ide_command("calva.evaluateCurrentTopLevelForm", cursorless_target)

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) [it] [(top | top form)] [fresh] point:
    mouse_click(0)
    user.vscode("calva.evaluateCurrentTopLevelForm")

#eval top form to comment
(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) [it] [(top | top form)] [( as | to | too | two )] comment:
    user.vscode("calva.evaluateTopLevelFormAsComment")

## +++++++++++++++ eval enclosing form .

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) ([this] form | (enclosing | in closing | wrapping) [form]):
    user.vscode("calva.evaluateEnclosingForm")


## ++++++++++ eval selection or current form @ caret .

(rep | repl | ripple |  evaluate | eval | compute | comp | run | runt) (here | that | selection):
    user.vscode("calva.evaluateSelection")

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) <user.cursorless_target>:
    user.cursorless_ide_command("calva.evaluateSelection", cursorless_target)

(rep | repl | ripple |  evaluate | eval | compute | comp | run | runt) point:
    mouse_click(0)
    user.vscode("calva.evaluateSelection")


## ++++++++++ eval selection, closing brackets .

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) (here | that | selection) (closing | close | closed):
    user.vscode("calva.evaluateSelectionToSelectionEnd")

(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) (closing | close | closed) <user.cursorless_target>:
    user.cursorless_ide_command("calva.evaluateSelectionToSelectionEnd", cursorless_target)

(rep | repl | ripple |  evaluate | eval | compute | comp | run | runt) (closing | close | closed) point:
    key(shift:down)
    mouse_click(0)
    user.vscode("calva.evaluateSelectionToSelectionEnd")

# combination w paredit
#operates on selection, leaves start to cursor selected
#same effect as calva.evaluateToCursor ?
(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) (selection [from] start | [from]  start (closing | close | closed)):
    user.vscode("paredit.selectBackwardUpSexp")
    user.vscode("calva.evaluateSelectionToSelectionEnd")
    





## ++++++++++++++++ copy last repl result.

(copy | take) [last] [repl] (result | output | evaluation | eval): 
    user.vscode("calva.copyLastResults")

## ++++++++++++ eval to cursor (closing brackets) .

# eval from start of the current enclosing list to cursor 
# not available when text selected
(evaluate | eval | run | runt) [from] ([(list | form)] start | start of list): 
    user.vscode("calva.evaluateToCursor")

# eval from start of top level form to cursor
(evaluate | eval | run | runt) (from top [form] | top (closing | close | closed)) : 
    user.vscode("calva.evaluateTopLevelFormToCursor")

(evaluate | eval | run | runt) [from] (start of file | file (start | top) ):  
    user.vscode("calva.evaluateStartOfFileToCursor")

run top (symbol | name):
    user.run_rpc_command("calva.runCustomREPLCommand", "ets")

## ++++++++++++++++++++ eval and print (selection) .

#eval selected text or current form as comment
(rep | repl | ripple |  evaluate | eval | compute | comp | run | runt) (here | that | selection) [as] comment:
    user.vscode("calva.evaluateSelectionAsComment")

#eval selection and replace with result
evaluate and replace [with result]: 
    user.vscode("calva.evaluateSelectionReplace")

## +++++++++++++++++ paste last result .

(pace | paste) [last] [repl] (result | output | evaluation | eval): 
    user.vscode("calva.copyLastResults")
    edit.paste()

(pace | paste) [last] [repl] (result | output | evaluation | eval) [(to | too | two)] new [(file | editor | tab | window)]: 
    user.vscode("calva.copyLastResults")
    user.vscode("workbench.action.files.newUntitledFile")
    sleep(200ms)
    user.vscode("workbench.action.moveEditorToRightGroup")
    user.vscode("workbench.action.editor.changeLanguageMode")
    sleep(100ms)
    insert("clojure")
    sleep(100ms)
    key(enter)
    sleep(100ms)
    key(enter)
    edit.paste()

## ++++++++++++++++++++++++++++++ misc .

(interrupt | cancel | kill) [(running | current)] repl [(evaluation | evaluations)]: 
    user.vscode("calva.interruptAllEvaluations")

toggle send evaluated code to repl [window]: 
    user.vscode("calva.toggleEvaluationSendCodeToOutputWindow")

toggle repl pretty printing: 
    user.vscode("calva.togglePrettyPrint") 


