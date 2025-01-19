app.name: Code
app.name: Cursor
app.name: Windsurf
-

## +++++++++++++++++++ connect to repl .

(jack in | jacket) (repl | ripple | grapple) | (repl | ripple | grapple)  (jack in | jacket):
    user.vscode("calva.jackIn")
    sleep(2000ms)
    user.vscode("calva.showOutputTerminal")
    sleep(300ms)
    user.vscode("workbench.action.terminal.moveToEditor")
    sleep(200ms)
    user.vscode("workbench.action.moveEditorToRightGroup")
    sleep(200ms)
    user.vscode("workbench.action.closePanel")
    sleep(1000ms)
    user.vscode("calva.showOutputTerminal")
    

(repl | ripple | grapple)  ((jack in | jacket) again | restart):
    user.vscode("calva.jackIn")
    sleep(2000ms)
    user.vscode("calva.showOutputTerminal")


(jack in  |  restart) (repl | ripple) | (repl | ripple)  (jack in | jacket) manual:
    user.vscode("calva.jackIn")

(jack out  | kill | stop) (repl | ripple) | (repl | ripple) (jack out  | kill | stop)   :
    user.vscode("calva.jackOut")
    
[new] repl menu:
    user.vscode("calva.startOrConnectRepl")

## ++++++++++++++++++++++++++++++ misc .

clear repl history: 
    user.vscode("calva.clearReplHistory")


## +++++++++++++++++++ calva repl output/results terminal (tab) .

#generic?
(show | open) (output | results) destination:
    # user.vscode("calva.showResultOutputDestination")
    user.run_rpc_command("calva.showResultOutputDestination", "true")

(show | open) [(calva | repl | ripple )] (output | results) [(term | terminal)]:
    user.vscode("calva.showOutputTerminal")

(show | open) [(calva | repl | ripple )] (output | results) (window generic | generic window):
    user.vscode("calva.showOutputWindow")

#navigate open editors

go [calva] (output | results | repl | ripple) [(term | terminal)]:
    user.vscode("opened-editors.openedEditors")
    insert("Calva Output")
    key(enter)

[go] [calva] (output | results | repl | ripple) [(term | terminal)] (bottom | end):
    user.vscode("opened-editors.openedEditors")
    insert("Calva Output")
    key(enter)
    edit.file_end()

[go] [calva] (output | results | repl | ripple) [(term | terminal)] (top | start | beginning):
    user.vscode("opened-editors.openedEditors")
    insert("Calva Output")
    key(enter)
    edit.file_start()

# clear output terminal

(clear [(it | t | tea)] | clarity) | (clear | dump) [(repl | ripple)] (results | output) [(term | terminal)]:
    user.vscode("workbench.action.terminal.clear")

## +++++++++++++ move terminal output to tab or new window .

(open | move) [calva] (output | results | repl | ripple) [(term | terminal)] [(as | to | too | two)] tab:
    user.vscode("calva.showOutputTerminal")
    sleep(100ms)
    user.vscode("workbench.action.terminal.moveToEditor")
    # sleep(300ms)
    user.vscode("workbench.action.closePanel")

(open | show | move) [calva] (output | results | repl | ripple) [(term | terminal)] (as | to | too | two) [new] window:
    user.vscode("calva.showOutputTerminal")
    sleep(300ms)
    user.vscode("workbench.action.terminal.moveIntoNewWindow")

## +++++++++++ repl output window (not terminal)    

(show | open) [(repl | ripple)] (results | output) window: 
    user.vscode("calva.showReplWindow")

(focus | go) [(repl | ripple)] (results | output) window: 
    user.vscode("opened-editors.openedEditors")
    insert("repl.calva-repl")
    sleep(50ms)
    key(enter)
    
clear [(repl | ripple)] (results | output) window:
    user.vscode("opened-editors.openedEditors")
    insert("repl.calva-repl")
    sleep(50ms)
    key(enter)
    sleep(100ms)
    key(cmd-a)
    key(delete)
    sleep(200ms)
    user.vscode("workbench.action.openPreviousRecentlyUsedEditor")
    # user.vscode("workbench.action.navigateBack")
 
(close | hide) [(repl | ripple)] (results | output) window:
    user.vscode("opened-editors.openedEditors")
    insert("repl.calva-repl")
    sleep(50ms)
    key(enter)
    sleep(100ms)
    user.vscode("workbench.action.closeActiveEditor")
    
go [(repl | ripple)] (results | output) window top:
    # user.vscode("workbench.action.closeActiveEditor")
    user.vscode("opened-editors.openedEditors")
    insert("repl.calva-repl")
    sleep(50ms)
    key(enter)
    sleep(100ms)
    key(cmd-up)
    sleep(200ms)
    user.vscode("workbench.action.navigateBack")

## ++++++++++++++++++++ output channel .

(show | open | go) [calva] [says] (results | output | repl | ripple) channel:
    user.vscode("calva.showOutputChannel")
    
## ++++++++++++++++++++ inline results .

(hide | clear) inline [(repl | ripple)] [(results | eval | evaluations)]: user.vscode("calva.clearInlineResults")

## ++++++++++++++++++++++++ print docs in repl .

print [clojure] [docs] examples:
    user.vscode("calva.printClojureDocsToOutputWindow")