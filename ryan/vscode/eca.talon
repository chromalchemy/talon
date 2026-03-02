app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

## ++++++++++++++++++++ prompt helpers .

chat command:
     insert("")

eca [command] {user.ryan.vscode.eca_commands.list}:
    insert("/{user.ryan.vscode.eca_commands.list}")
    sleep(300ms)
    key(enter)

## ++++++++++ prompt text edit helpers .

clear prompt:
    user.eca_clear_prompt()

paste (new | over) prompt:
    user.eca_clear_prompt()
    edit.paste()

[add] paste [add] to prompt:
    user.run_rpc_command("eca.chat.focus")
    edit.file_end()
    key(shift-enter:2)
    edit.paste()
    
## +++++++++++++++++++++++ add context .

add [current] file [(as | to | too | two)] context:
    user.run_rpc_command("eca.chat.addContextToSystemPrompt")

## ++++++++++++++++++++++++ navigation .

focus eca (web view | webview | view):
    user.run_rpc_command("eca.webview.focus")

(focus | go | open) ([eca] chat | eca | prompt): 
    user.run_rpc_command("eca.chat.focus")

[go] eca input [<user.text>]:
    user.eca_focus_prompt_input()
    insert(text)

## +++++++++++++++++++++++ send prompt .

send prompt [to] [current] [chat]:
    user.run_rpc_command("eca.chat.send-prompt")

send prompt [to] new [chat]:
    user.run_rpc_command("eca.chat.send-prompt-new-chat")

## ++++++++++++++++++++++++++++ output .

bar eca (output | log) | panel eca: 
    user.run_rpc_command("workbench.action.output.show.extension-output-editor-code-assistant.eca-#1-ECA stderr")

## +++++++++++++++++++++++++++ ECA mcp .

[open] eca MCP [(details | settings)]: 
    user.run_rpc_command("eca.mcp-details.focus")

## +++++++++++++++++++++ manage server .

[manage] eca server:
    user.run_rpc_command("eca.manage")

(start | launch) eca [server] process | eca (start | launch): 
    user.run_rpc_command("eca.start")

(stop | kill) eca [server] process | eca (stop | kill): 
    user.run_rpc_command("eca.stop")

restart eca | eca restart:
    user.run_rpc_command("eca.restart")


## +++++++++++++++++++++++++++ rewrite .

agent rewrite:
    user.run_rpc_command("eca.rewrite")

agent rewrite accept:
    user.run_rpc_command("eca.rewrite.accept")

agent rewrite reject:
    user.run_rpc_command("eca.rewrite.reject")




