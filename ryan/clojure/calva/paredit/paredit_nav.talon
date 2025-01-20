app.name: Code
app.name: Cursor
app.name: Windsurf
-
# todo: limit to clj files
# code.language: clojure

#tag(): user.clojure_core

## ++++++++++++++++++++++++++++++ back .

go (back | previous | prev) form:
    user.run_rpc_command("paredit.backwardSexp")

go (back | previous | prev) down [form]: 
    user.run_rpc_command("paredit.backwardDownSexp")

go (back | previous | prev) up [form]: 
    user.run_rpc_command("paredit.backwardUpSexp")

# go back to start: 
go back or up: 
    user.run_rpc_command("paredit.backwardSexpOrUp")

 ## +++++++++++++++++++++++++++ forward .

go (forward | fore | next) down [form]: 
    user.run_rpc_command("paredit.forwardDownSexp")

go ((next | end) [form] | (forward | fore) form): 
    user.run_rpc_command("paredit.forwardSexp")

go forward up | go up [form]: 
    user.run_rpc_command("paredit.forwardUpSexp")

go forward or up: 
    user.run_rpc_command("paredit.forwardSexpOrUp")

go (to | collection | seek) end: 
    user.run_rpc_command("paredit.closeList")

