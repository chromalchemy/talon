app: vscode
-

## +++++++++++++++++++++++++ font size .

(terminal | term) font [size] down: 
    user.vscode("terminalFontSize.decrease")

(terminal | term) font [size] up: 
    user.vscode("terminalFontSize.increase")

(terminal | term) font [size] reset: 
    user.vscode("workbench.action.terminal.fontZoomReset")

#only goes up to 26
(terminal | term) font [size] <number>:
    user.vscode("terminalFontSize.openQuickPick")
    sleep(200ms)
    insert(number)
    key(enter)

## +++++++++++++++++++++++++++++ stage

go warp (terminal | term):  
    user.vscode("workbench.action.terminal.openNativeConsole")

restore terminals: 
    user.vscode("restore-terminals.restoreTerminals")

## ++++++++++++++++++++++++++++++ show .

(go | show) (term | terminal) | term show: 
    user.vscode("workbench.action.terminal.focus")

## +++++++++++++++++++++++++++++ state .

clear (term | terminal) | clear (term | terminal) : 
    user.vscode("workbench.action.terminal.clear")   
    
kill process:               
    key(ctrl-c)

## ++++++++++++++++++++++++++++++ move .

[(move | send)] (term | terminal) (to | too | two) (tab | editor):
    user.vscode("workbench.action.terminal.moveToEditor")

[(move | send)] (term | terminal) (to | too | two) [new] (window | win):
    user.vscode("workbench.action.terminal.moveIntoNewWindow")

[(move | send)] (term | terminal) (to | too | two) panel:
    user.vscode("workbench.action.terminal.moveToTerminalPanel")