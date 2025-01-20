app.name: Code
app.name: Cursor
app.name: Windsurf
-

pick refactor [(function | action)] [here]: 
    key (cmd-.)

## +++++++++++ threading refactor cmds .

thread last: 
    user.run_rpc_command("clojureLsp.refactor.threadLast")
    
thread last all: 
    user.run_rpc_command("clojureLsp.refactor.threadLastAll")

thread first: 
    user.run_rpc_command("clojureLsp.refactor.threadFirst")

thread first all: 
    user.run_rpc_command("clojureLsp.refactor.threadFirstAll")

unwind thread | thread unwind: 
    user.run_rpc_command("clojureLsp.refactor.unwindThread")

unwind all: 
    user.run_rpc_command("clojureLsp.refactor.unwindAll")

## +++++++++++ other lsp refactor commands .

introduce let: 
    user.run_rpc_command("clojureLsp.refactor.introduceLet")

expand let: 
    user.run_rpc_command("clojureLsp.refactor.expandLet")

inline symbol: 
    user.run_rpc_command("clojureLsp.refactor.inlineSymbol")
    
expand to new function: 
    user.run_rpc_command("clojureLsp.refactor.extractFunction")

add [missing] require: 
    user.run_rpc_command("clojureLsp.refactor.addMissingLibspec")

## ++++++++ other refactoring commands .

# wrap [in] (brackets | vector | square): key(ctrl-shift-alt-s)

# in vscode/eval
# evaluate and replace [with result]: 