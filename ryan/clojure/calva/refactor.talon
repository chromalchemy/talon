app: vscode
-

pick refactor [(function | action)] [here]: 
    key (cmd-.)

## +++++++++++ threading refactor cmds .

thread last: 
    user.vscode("clojureLsp.refactor.threadLast")
    
thread last all: 
    user.vscode("clojureLsp.refactor.threadLastAll")

thread first: 
    user.vscode("clojureLsp.refactor.threadFirst")

thread first all: 
    user.vscode("clojureLsp.refactor.threadFirstAll")

unwind thread | thread unwind: 
    user.vscode("clojureLsp.refactor.unwindThread")

unwind all: 
    user.vscode("clojureLsp.refactor.unwindAll")

## +++++++++++ other lsp refactor commands .

introduce let: 
    user.vscode("clojureLsp.refactor.introduceLet")

expand let: 
    user.vscode("clojureLsp.refactor.expandLet")

inline symbol: 
    user.vscode("clojureLsp.refactor.inlineSymbol")
    
expand to new function: 
    user.vscode("clojureLsp.refactor.extractFunction")

add [missing] require: 
    user.vscode("clojureLsp.refactor.addMissingLibspec")

## ++++++++ other refactoring commands .

# wrap [in] (brackets | vector | square): key(ctrl-shift-alt-s)

# in vscode/eval
# evaluate and replace [with result]: 