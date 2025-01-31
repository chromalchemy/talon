app.name: Windsurf
tag: user.cursorless
-

(send [to] | reference [in]  | add context [to] ) [chat | chatbot]  | cascade [that]:
    user.run_rpc_command("windsurf.prioritized.chat.open")   

(cascade | add context) <user.cursorless_target>:
    user.cursorless_ide_command("windsurf.prioritized.chat.open", cursorless_target)

(windsurf | surf) (write | wright | right) mode: 
    key(cmd-.)