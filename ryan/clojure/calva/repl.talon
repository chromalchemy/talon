app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

## +++++++++++++++++++ jack in to repl .

(jack in | jacket) (repl | ripple | grapple) | (repl | ripple | grapple)  (jack in | jacket):
    user.run_rpc_command("calva.jackIn")
    sleep(2000ms)
    user.run_rpc_command("calva.showOutputTerminal")
    sleep(300ms)
    user.run_rpc_command("workbench.action.terminal.moveToEditor")
    sleep(200ms)
    user.run_rpc_command("workbench.action.moveEditorToRightGroup")
    sleep(200ms)
    user.run_rpc_command("workbench.action.closePanel")
    sleep(1000ms)
    user.run_rpc_command("calva.showOutputTerminal")
    

(repl | ripple | grapple)  ((jack in | jacket) again | restart):
    user.run_rpc_command("calva.jackIn")
    sleep(2000ms)
    user.run_rpc_command("calva.showOutputTerminal")


(jack in  |  restart) (repl | ripple) | (repl | ripple)  (jack in | jacket) manual:
    user.run_rpc_command("calva.jackIn")

(jack out  | kill | stop) (repl | ripple) | (repl | ripple) (jack out  | kill | stop)   :
    user.run_rpc_command("calva.jackOut")
    
## +++++++++++++++++++++ repl  connect .

connect [to] [project] repl | repl connect:
    user.run_rpc_command("calva.connect")

disconnect repl | repl disconnect: 
    user.run_rpc_command("calva.disconnect")

## ++++++++++++++++++++++++++++++ misc .

[new] repl menu:
    user.run_rpc_command("calva.startOrConnectRepl")

clear repl history: 
    user.run_rpc_command("calva.clearReplHistory")


## +++++++++++++++++++ calva repl output/results terminal (tab) .

#generic?
(show | open) (output | results) destination:
    # user.run_rpc_command("calva.showResultOutputDestination")
    user.run_rpc_command("calva.showResultOutputDestination", "true")

(show | open) [(calva | repl | ripple )] (output | results) [(term | terminal)]:
    user.run_rpc_command("calva.showOutputTerminal")

(show | open) [(calva | repl | ripple )] (output | results) (window generic | generic window):
    user.run_rpc_command("calva.showOutputWindow")

#navigate open editors

go [calva] (output | results | repl | ripple) [(term | terminal)]:
    user.run_rpc_command("opened-editors.openedEditors")
    insert("Calva Output")
    key(enter)

[go] [calva] (output | results | repl | ripple) [(term | terminal)] (bottom | end):
    user.run_rpc_command("opened-editors.openedEditors")
    insert("Calva Output")
    key(enter)
    edit.file_end()

[go] [calva] (output | results | repl | ripple) [(term | terminal)] (top | start | beginning):
    user.run_rpc_command("opened-editors.openedEditors")
    insert("Calva Output")
    key(enter)
    edit.file_start()

# clear output terminal

(clear [(it | t | tea)] | clarity) | (clear | dump) [(repl | ripple)] (results | output) [(term | terminal)]:
    user.run_rpc_command("workbench.action.terminal.clear")

## +++++++++++++ move terminal output to tab or new window .

(open | move) [calva] (output | results | repl | ripple) [(term | terminal)] [(as | to | too | two)] tab:
    user.run_rpc_command("calva.showOutputTerminal")
    sleep(100ms)
    user.run_rpc_command("workbench.action.terminal.moveToEditor")
    # sleep(300ms)
    user.run_rpc_command("workbench.action.closePanel")

(open | show | move) [calva] (output | results | repl | ripple) [(term | terminal)] (as | to | too | two) [new] window:
    user.run_rpc_command("calva.showOutputTerminal")
    sleep(300ms)
    user.run_rpc_command("workbench.action.terminal.moveIntoNewWindow")

## +++++++++++ repl output window (not terminal)    

(show | open) [(repl | ripple)] (results | output) window: 
    user.run_rpc_command("calva.showReplWindow")

(focus | go) [(repl | ripple)] (results | output) window: 
    user.run_rpc_command("opened-editors.openedEditors")
    insert("repl.calva-repl")
    sleep(50ms)
    key(enter)
    
clear [(repl | ripple)] (results | output) window:
    user.run_rpc_command("opened-editors.openedEditors")
    insert("repl.calva-repl")
    sleep(50ms)
    key(enter)
    sleep(100ms)
    key(cmd-a)
    key(delete)
    sleep(200ms)
    user.run_rpc_command("workbench.action.openPreviousRecentlyUsedEditor")
    # user.run_rpc_command("workbench.action.navigateBack")
 
(close | hide) [(repl | ripple)] (results | output) window:
    user.run_rpc_command("opened-editors.openedEditors")
    insert("repl.calva-repl")
    sleep(50ms)
    key(enter)
    sleep(100ms)
    user.run_rpc_command("workbench.action.closeActiveEditor")
    
go [(repl | ripple)] (results | output) window top:
    # user.run_rpc_command("workbench.action.closeActiveEditor")
    user.run_rpc_command("opened-editors.openedEditors")
    insert("repl.calva-repl")
    sleep(50ms)
    key(enter)
    sleep(100ms)
    key(cmd-up)
    sleep(200ms)
    user.run_rpc_command("workbench.action.navigateBack")

## ++++++++++++++++++++ output channel .

(show | open | go) [calva] [says] (results | output | repl | ripple) channel:
    user.run_rpc_command("calva.showOutputChannel")
    
## ++++++++++++++++++++ inline results .

(hide | clear) inline [(repl | ripple)] [(results | eval | evaluations)]: user.run_rpc_command("calva.clearInlineResults")

## ++++++++++++++++++++++++ print docs in repl .

print [clojure] [docs] examples:
    user.run_rpc_command("calva.printClojureDocsToOutputWindow")