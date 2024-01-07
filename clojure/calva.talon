app: vscode
-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.snippets
tag(): user.splits
tag(): user.tabs

#----------------------- paredit navigation

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

#----------------------- paredit selection

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
expand selection | take more | take expand: user.vscode("paredit.sexpRangeExpansion")
shrink selection | take less: user.vscode("paredit.sexpRangeContraction")
take back or up: user.vscode("paredit.selectBackwardSexpOrUp")
take forward or up: user.vscode("paredit.selectForwardSexpOrUp")
take it: user.vscode("calva.selectCurrentForm")

(tap (that | form) | create tap ): user.vscode("calva.tapSelection")

###

# wrap [in] (brackets | vector | square): key(ctrl-shift-alt-s)

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
 
(close | hide) [(repl | ripple)] ((repl | ripple) | results | output) [(view | window | tab)]:
    user.vscode("calva.showOutputWindow")
    user.vscode("workbench.action.closeActiveEditor")
    
go [(repl | ripple)] ((repl | ripple) | results | output) [(view | window | tab)] top:
    user.vscode("calva.showOutputWindow")
    user.vscode("workbench.action.closeActiveEditor")
    key(cmd-up)
    user.vscode("workbench.action.navigateBack")
    
(hide | clear) inline (results | eval | evaluations): user.vscode("calva.clearInlineResults")

## ++++++++++++++++++++++++++ evaluation

please calva (evaluate | eval):
    key(cmd-shift-p)
    insert("evaluate ")

[(rep | repl | ripple | rebel)] (load | run) file [in (rep | repl | ripple | rebel)]: user.vscode("calva.loadFile")

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

(interrupt | cancel) [running] repl (evaluation | evaluations): user.vscode("calva.interruptAllEvaluations")

toggle send evaluated code to repl [window]: user.vscode("calva.toggleEvaluationSendCodeToOutputWindow")
toggle repl pretty printing: user.vscode("calva.togglePrettyPrint") 

joyride evaluate selection: user.vscode("joyride.evaluateSelection")

 ## ++++++++++++++++++++++++++++ formatting

format (form | expression): user.vscode("calva-fmt.formatCurrentForm")

# Calva Format: Format and Align Current Form (recursively, experimental)
format and align (form  | expression): user.vscode("calva-fmt.alignCurrentForm")

format and trim (form | expression): user.vscode("calva-fmt.trimCurrentFormWhiteSpace")

dedent [line]: user.vscode("calva-fmt.tabDedent")
indent [line]: user.vscode("calva-fmt.tabIndent")

infer parens: user.vscode("calva-fmt.inferParens")

## ++++++++++++++++++++++++++ parinfer .

disable ((par | pear) infer | parent for): user.vscode("parinfer.disable")
toggle ((par | pear) infer | parent for) mode: user.vscode("parinfer.toggleMode") 
iner parens: user.vscode("calva-fmt.inferParens")

## +++++++++++ threading refactor cmds .

thread last: user.vscode("clojureLsp.refactor.threadLast")
thread last all: user.vscode("clojureLsp.refactor.threadLastAll")
thread first: user.vscode("clojureLsp.refactor.threadFirst")
thread first all: user.vscode("clojureLsp.refactor.threadFirstAll")
unwind thread: user.vscode("clojureLsp.refactor.unwindThread")
unwind all: user.vscode("clojureLsp.refactor.unwindAll")

## +++++++++++ other lsp refactor commands .

introduce let: user.vscode("clojureLsp.refactor.introduceLet")
expand let: user.vscode("clojureLsp.refactor.expandLet")
inline symbol: user.vscode("clojureLsp.refactor.inlineSymbol")
expand to new function: user.vscode("clojureLsp.refactor.extractFunction")

add missing require: user.vscode("clojureLsp.refactor.addMissingLibspec")

## ++++++++ other refactoring commands .

replace with pretty (print | printed): user.vscode("calva.prettyPrintReplaceCurrentForm")

## ++++++++++ comments

[(insert | add)] comment (symbol | mark): insert("#_")
(make | add) rich comment: user.vscode("paredit.addRichComment")

## ++++++++++++++++++ paredit commands .

please (paredit | pare edit | pear edit):
    key(cmd-shift-p)
    insert("calva paredit ")

open [paredit] list: user.vscode("paredit.openList")
    
slurp [forward]: user.vscode("paredit.slurpSexpForward")
slurp (backward | back): user.vscode("paredit.slurpSexpBackward")
barf [forward]: user.vscode("paredit.barfSexpForward")
barf (backward | back): user.vscode("paredit.barfSexpBackward")

(transpose | swap) (forms | expressions): user.vscode("paredit.transpose")

#------------------------------- portal clearing

launch portal: user.vscode("extension.portalOpen")

launch portal clearing: 
    user.run_rpc_command("calva.runCustomREPLCommand", "p")

tap top: 
    user.run_rpc_command("calva.runCustomREPLCommand", "t")

tap that: 
    user.run_rpc_command("calva.runCustomREPLCommand", "f")

# ---------------------------  settings

open calva settings: 
    user.vscode("workbench.action.openSettings2")
    insert("calva")
    
# ---------------------------  custom repl commands
    
# open calva repl snippets: user.vscode("calva.customREPLCommandSnippets")
open ((user | global) repl snippets | calva (user | global) config) [eden]: user.vscode("calva.openUserConfigEdn")

refresh [user] (repl snippets | calva user config): user.vscode("calva.rereadUserConfigEdn")

# todo: need enumerated versions of this?
# (run | pick | choose) [custom] repl (command  | function | snippet): user.vscode("calva.runCustomREPLCommand")

## +++++++++++++ specific repl command .

#  need to localize to a vscode workspace
[repl] (build | rebuild) (templates | theme): 
    user.vscode("calva.loadFile")
    sleep(500ms)
    user.run_rpc_command("calva.runCustomREPLCommand", "b")
    
test run repl command:
    user.run_rpc_command("calva.runCustomREPLCommand", "f")
    # user.run_rpc_command("calva.runCustomREPLCommand", "\{
    #     \"ns\": \"user\",
    #     \"snippet\": \"(prn \"hello\")\",
    # \}")

## +++++++++++++++++++++++++ joyride

Open joyride [user] script: user.vscode("joyride.openUserScript")
Open joyride (workspace | work space | project) script: user.vscode("joyride.openWorkspaceScript")
