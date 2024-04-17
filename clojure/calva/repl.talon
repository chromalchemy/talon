app: vscode
-

## +++++++++++++++++++ connect to repl .

(jack in  |  restart) repl | repl  (jack in  |  restart):
    user.vscode("calva.jackIn")

[new] repl menu:
    user.vscode("calva.startOrConnectRepl")

## ++++++++++++++++++++++++++++++ misc .

clear repl history: 
    user.vscode("calva.clearReplHistory")

# what is this?
show [result] output destination:
    user.vscode("calva.showResultOutputDestination")

## ++++++++++++++ calva (repl) output channel .
    
show [calva] [says] (results | output | repl | ripple) channel:
    user.vscode("calva.showOutputChannel")

## +++++++++++++++++++ calva repl output/results terminal .

show [calva] (output | results | repl | ripple) (term | terminal):
    user.vscode("calva.showOutputTerminal")

## +++++++++++ repl results editor tab window.

(focus | go) [(repl | ripple)] (results | output) [(window | tab)]: 
    user.vscode("calva.showOutputWindow")

(show | open) [(repl | ripple)] (results | output) [(window | tab)]: 
    user.vscode("calva.showOutputWindow")
    sleep(300ms)
    user.vscode("workbench.action.navigateBack")

clear [(repl | ripple)] (results | output) [(window | tab)]:
    user.vscode("calva.showOutputWindow")
    sleep(200ms)
    key(cmd-a)
    key(delete)
    sleep(200ms)
    user.vscode("workbench.action.openPreviousRecentlyUsedEditor")
    # user.vscode("workbench.action.navigateBack")
 
(close | hide) [(repl | ripple)] (results | output) [(window | tab)]:
    user.vscode("calva.showOutputWindow")
    sleep(200ms)
    user.vscode("workbench.action.closeActiveEditor")
    
go [(repl | ripple)] (results | output) [(window | tab)] top:
    user.vscode("calva.showOutputWindow")
    user.vscode("workbench.action.closeActiveEditor")
    key(cmd-up)
    sleep(200ms)
    user.vscode("workbench.action.navigateBack")

## ++++++++++++++++++++ output channel .

open [(repl  | calva)] output channel:
    user.vscode("calva.showOutputChannel")
    
## ++++++++++++++++++++ inline results .

(hide | clear) inline [(repl | ripple)] [(results | eval | evaluations)]: user.vscode("calva.clearInlineResults")

## ++++++++++++++++++++++++ print docs in repl .

print [clojure] [docs] examples:
    user.vscode("calva.printClojureDocsToOutputWindow")