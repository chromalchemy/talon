app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

## ++++++++++++++++++++ prompt helpers .

chat command:
     insert("/")

## +++++++++++++++++++++++ add context .

add [current] file [(as | to | too | two)] context:
    cuser.run_rpc_command("eca.chat.addContextToSystemPrompt")

## ++++++++++++++++++++++++ navigation .

focus eca view:
    user.run_rpc_command("eca.webview.focus")

(focus | go | open) ([eca] chat | eca): 
    user.run_rpc_command("eca.chat.focus")

[go] eca input [<user.text>]:
    user.eca_focus_prompt_input()
    insert(text)



## ++++++++++++++++++++++++++++ output .

bar eca output: 
    user.run_rpc_command("workbench.action.output.show.extension-output-editor-code-assistant.eca-#1-ECA stderr")

## +++++++++++++++++++++++++++ ECA mcp .

open [eca] MCP details: 
    user.run_rpc_command("eca.mcp-details.focus")

## +++++++++++++++++++++ manage server .

manage [eca] server:
    user.run_rpc_command("eca.manage")

start eca [server] process: 
    user.run_rpc_command("eca.start")

stop eca [server] process: 
    user.run_rpc_command("eca.stop")

## +++++++++++++++++++++++++++ rewrite .

agent rewrite:
    user.run_rpc_command("eca.rewrite")

agent rewrite accept:
    user.run_rpc_command("eca.rewrite.accept")

agent rewrite reject:
    user.run_rpc_command("eca.rewrite.reject")


