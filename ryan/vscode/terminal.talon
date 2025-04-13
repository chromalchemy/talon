app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

## +++++++++++++++++++++++++ font size .

(terminal | term) font [size] down: 
    user.run_rpc_command("terminalFontSize.decrease")

(terminal | term) font [size] up: 
    user.run_rpc_command("terminalFontSize.increase")

(terminal | term) font [size] reset: 
    user.run_rpc_command("workbench.action.terminal.fontZoomReset")

#only goes up to 26
(terminal | term) font [size] <number>:
    user.run_rpc_command("terminalFontSize.openQuickPick")
    sleep(200ms)
    insert(number)
    key(enter)

## +++++++++++++++++++++++++++++ stage

go warp (terminal | term):  
    user.run_rpc_command("workbench.action.terminal.openNativeConsole")

restore terminals: 
    user.run_rpc_command("restore-terminals.restoreTerminals")

## ++++++++++++++++++++++++++++++ show .

(go | show) ((term | turn) | terminal) | ((term | turn) | terminal) show: 
    user.run_rpc_command("workbench.action.terminal.focus")

## +++++++++++++++++++++++++++++ state .

clear ((term | turn) | terminal) | clear ((term | turn) | terminal) : 
    user.run_rpc_command("workbench.action.terminal.clear")   
    
kill process:               
    key(ctrl-c)

## ++++++++++++++++++++++++++++++ move .

[(move | send)] (term | terminal) (to | too | two) (tab | editor):
    user.run_rpc_command("workbench.action.terminal.moveToEditor")

[(move | send)] (term | terminal) (to | too | two) [new] (window | win):
    user.run_rpc_command("workbench.action.terminal.moveIntoNewWindow")

[(move | send)] (term | terminal) (to | too | two) panel:
    user.run_rpc_command("workbench.action.terminal.moveToTerminalPanel")