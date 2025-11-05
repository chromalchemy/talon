app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

chat command:
     insert("/")

add (context at cursor | cursor [(to | too | two)] context):
    user.run_rpc_command("eca.chat.addContextCursor")

add [current] file [(as | to | too | two)] context:
    user.run_rpc_command("eca.chat.addContextFile")

manage server:
    user.run_rpc_command("eca.manage")

(focus | go | open) (chat | eca): 
    user.run_rpc_command("eca.chat.focus")

show chat: 
    user.run_rpc_command("workbench.action.output.show.extension-output-editor-code-assistant.eca-#1-ECA stderr")

open [eca] MCP details: 
    user.run_rpc_command("eca.mcp-details.focus")

start eca [server] process: 
    user.run_rpc_command("eca.start")

stop eca [server] process: 
    user.run_rpc_command("eca.stop")


