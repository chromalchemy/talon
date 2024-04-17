app.name: Code
-
(terminal | term) font [size] down: 
    user.vscode("terminalFontSize.decrease")
(terminal | term) font [size] up: 
    user.vscode("terminalFontSize.increase")

(go | show) (term | terminal) | term show: 
    user.vscode("workbench.action.terminal.focus")

clear (term | terminal) | clear (term | terminal) : 
    user.vscode("workbench.action.terminal.clear")   

restore terminals: user.vscode("restore-terminals.restoreTerminals")

kill process:               
    key(ctrl-c)

(move | send) (term | terminal) (to | too | two) (tab | editor):
    user.vscode("workbench.action.terminal.moveToEditor")

(move | send) (term | terminal) (to | too | two) [new] (window | win):
    user.vscode("workbench.action.terminal.moveIntoNewWindow")

(move | send) (term | terminal) (to | too | two) panel:
    user.vscode("workbench.action.terminal.moveToTerminalPanel")