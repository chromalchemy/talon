app: vscode
-
# todo: limit to clj files
# code.language: clojure

#tag(): user.clojure_core

## ++++++++++++++++++++++++++++++ back .

go (back | previous | prev) (form | expression):  
    user.vscode("paredit.backwardSexp")

go (back | previous | prev) down [form]: 
    user.vscode("paredit.backwardDownSexp")

go (back | previous | prev) up [form]: 
    user.vscode("paredit.backwardUpSexp")

# go back to start: 
go back or up: 
    user.vscode("paredit.backwardSexpOrUp")

 ## +++++++++++++++++++++++++++ forward .

go (forward | fore | next) [down] [form]: 
    user.vscode("paredit.forwardDownSexp")

go (forward | fore | next) [form]: 
    user.vscode("paredit.forwardSexp")

go forward up | go up [form]: 
    user.vscode("paredit.forwardUpSexp")

go forward or up: 
    user.vscode("paredit.forwardSexpOrUp")

go to end: 
    user.vscode("paredit.closeList")

