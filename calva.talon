app: vscode
-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.snippets
tag(): user.splits
tag(): user.tabs

#lookup helpers
please calva (evaluate | eval):
    key(cmd-shift-p)
    insert("evaluate ")

please (paredit | pare edit | pear edit):
    key(cmd-shift-p)
    insert("calva paredit ")
    

#-----------------------navigate

go back down [form]: user.vscode("paredit.backwardDownSexp")
(move | go) back (form | expression):  user.vscode("paredit.backwardSexp")
go back up [form]: user.vscode("paredit.backwardUpSexp")
go forward [down] [form]: user.vscode("paredit.forwardDownSexp")
go up [form]: user.vscode("paredit.forwardUpSexp")
go [form]: user.vscode("paredit.forwardSexp")
go to end: user.vscode("paredit.closeList")
# go back to start: 
go forward up: user.vscode("paredit.forwardUpSexp")
go back or up: user.vscode("paredit.backwardSexpOrUp")
Go forward or up: user.vscode("paredit.forwardSexpOrUp")

#-----------------------select

take back down: user.vscode("paredit.selectBackwardDownSexp")
take back up: user.vscode("paredit.selectBackwardUpSexp")
take back: user.vscode("paredit.selectBackwardSexp")
take back to start: user.vscode("paredit.selectOpenList")
take top level: user.vscode("paredit.rangeForDefun")
take forward down: user.vscode("paredit.selectForwardDownSexp")
take forward up: user.vscode("paredit.selectForwardUpSexp")
take (forward | ahead): user.vscode("paredit.selectForwardSexp")
take [forward] to end: user.vscode("paredit.selectCloseList")
take right: user.vscode("paredit.selectRight")
(expand selection | take more): user.vscode("paredit.sexpRangeExpansion")
(shrink selection | take less): user.vscode("paredit.sexpRangeContraction")
take back or up: user.vscode("paredit.selectBackwardSexpOrUp")
take forward or up: user.vscode("paredit.selectForwardSexpOrUp")
take it: user.vscode("calva.selectCurrentForm")

(tap (that | form) | create tap ): user.vscode("calva.tapSelection")

###

# wrap [in] (brackets | vector | square): key(ctrl-shift-alt-s)

slurp [forward]: user.vscode("paredit.slurpSexpForward")
slurp (backward | back): user.vscode("paredit.slurpSexpBackward")
barf [forward]: user.vscode("paredit.barfSexpForward")
barf (backward | back): user.vscode("paredit.barfSexpBackward")

(transpose | swap) (forms | expressions): user.vscode("paredit.transpose")



(jack in repl | repl  jack in): user.vscode("calva.jackIn")



# repl results view

(show | open) [(repl | ripple)] ((repl | ripple) | results | output) [(view | window | tab)]: 
    user.vscode("calva.showOutputWindow")
    user.vscode("workbench.action.navigateBack")

focus [(repl | ripple)] ((repl | ripple) | results | output) [(view | window | tab)]: 
    user.vscode("calva.showOutputWindow")
    

clear [(repl | ripple)] ((repl | ripple) | results | output) [(view | window | tab)]:
    user.vscode("calva.showOutputWindow")
    sleep(200ms)
    key(cmd-a)
    key(delete)
    sleep(200ms)
    user.vscode("workbench.action.navigateBack")
 
close [(repl | ripple)] ((repl | ripple) | results | output) [(view | window | tab)]:
    user.vscode("calva.showOutputWindow")
    user.vscode("workbench.action.closeActiveEditor")
    
go [(repl | ripple)] ((repl | ripple) | results | output) [(view | window | tab)] top:
    user.vscode("calva.showOutputWindow")
    user.vscode("workbench.action.closeActiveEditor")
    key(cmd-up)
    user.vscode("workbench.action.navigateBack")
    


(hide | clear) inline (results | eval | evaluations): user.vscode("calva.clearInlineResults")

#evaluate


[(rep | repl | ripple)] load file [in (rep | repl | ripple)]: user.vscode("calva.loadFile")


#eval top form
(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) [it] [(top | top form)]:
    user.vscode("calva.evaluateCurrentTopLevelForm")

#eval top fresh    
(rep | repl | ripple | evaluate | eval | compute | run it  | running ) [top] fresh:
    mimic("clear repl results")
    user.vscode("calva.evaluateCurrentTopLevelForm")


#eval top form as comment
(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) [it] [(top | top form)] [as] comment:
    user.vscode("calva.evaluateTopLevelFormAsComment")

#eval enclosing form
(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) (parent | enclosing | wrapping | form | outside) [form]:
    user.vscode("calva.evaluateEnclosingForm")

#eval selected text or current form @ caret
(rep | repl | ripple |  evaluate | eval | compute | comp | run | runt) (here | that | selection):
    user.vscode("calva.evaluateSelection")

#eval selected text or current form as comment
(rep | repl | ripple |  evaluate | eval | compute | comp | run | runt) (here | that | selection) [as] comment:
    user.vscode("calva.evaluateSelectionAsComment")


(copy | take) last [repl] (result | evaluation): user.vscode("calva.copyLastResults")

evaluate and replace [with result]: user.vscode("calva.evaluateSelectionReplace")

evaluate from (start of file | file start):  user.vscode("calva.evaluateStartOfFileToCursor")
evaluate from (start of list | list start): user.vscode("calva.evaluateToCursor")
evaluate from top: user.vscode("calva.evaluateTopLevelFormToCursor")

(interrupt | cancel) [running] (repl | evaluation | evaluations): user.vscode("calva.interruptAllEvaluations")

toggle send evaluated code to repl [window]: user.vscode("calva.toggleEvaluationSendCodeToOutputWindow")
toggle repl pretty printing: user.vscode("calva.togglePrettyPrint") 

joyride evaluate selection: user.vscode("joyride.evaluateSelection")

open [paredit] list: user.vscode("paredit.openList")

#format

replace with pretty (print | printed): user.vscode("calva.prettyPrintReplaceCurrentForm")

please calva format:
    key(cmd-shift-p)
    insert("calva format ")

# Calva Format: Format and Align Current Form (recursively, experimental)
format and align (form  | expression): user.vscode("calva-fmt.alignCurrentForm")

format (form | expression): user.vscode("calva-fmt.formatCurrentForm")
format and trim (form | expression): user.vscode("calva-fmt.trimCurrentFormWhiteSpace")


#parinfer
disable ((par | pear) infer | parent for): user.vscode("parinfer.disable")
toggle ((par | pear) infer | parent for) mode: user.vscode("parinfer.toggleMode") 
iner parens: user.vscode("calva-fmt.inferParens")

#-------------

thread last: user.vscode("clojureLsp.refactor.threadLast")
thread last all: user.vscode("clojureLsp.refactor.threadLastAll")
thread first: user.vscode("clojureLsp.refactor.threadFirst")
thread first all: user.vscode("clojureLsp.refactor.threadFirstAll")
unwind thread: user.vscode("clojureLsp.refactor.unwindThread")
unwind all: user.vscode("clojureLsp.refactor.unwindAll")

introduce let: user.vscode("clojureLsp.refactor.introduceLet")
expand let: user.vscode("clojureLsp.refactor.expandLet")
inline symbol: user.vscode("clojureLsp.refactor.inlineSymbol")
expand to new function: user.vscode("clojureLsp.refactor.extractFunction")

add missing require: user.vscode("clojureLsp.refactor.addMissingLibspec")

[(insert | add)] comment (symbol | mark): insert("#_")

(make | add) rich comment: user.vscode("paredit.addRichComment")

launch portal: user.vscode("extension.portalOpen")





open calva settings: 
    user.vscode("workbench.action.openSettings2")
    insert("calva")
    
# ---------------------------  custom repl commands

    
# open calva repl snippets: user.vscode("calva.customREPLCommandSnippets")
open calva [user] [repl snippets] config [eden]: user.vscode("calva.openUserConfigEdn")

# todo: need enumerated versions of this?
run custom (repl command  | function): user.vscode("calva.runCustomREPLCommand")


# Invoke actual snippets
#  need to localize to workspace
 
[repl] (build | rebuild) (templates | theme): 
    user.vscode("calva.runCustomREPLCommand")
    # sleep(100ms)
    key(b)
    key(enter)
