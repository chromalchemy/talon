app.name: Windsurf
app.name: Windsurf - Next
tag: user.cursorless
-

# surf test: print("testing from windsurf next")

(send [to] | reference [in]  | (add | had) context [to] ) [chat | chatbot]  | cascade [that]:
    user.run_rpc_command("windsurf.prioritized.chat.open")   

(cascade | add context) <user.cursorless_target>:
    user.cursorless_ide_command("windsurf.prioritized.chat.open", cursorless_target)

## +++++++++++++++++++++++ edit inline .

(surf | windsurf) [edit] [that] [(inline | in place)]:
    key(cmd-i)   

(surf | windsurf) edit [(inline | in place)] <user.cursorless_target>:
    user.cursorless_ide_command("setSelection", cursorless_target)
    # sleep(500ms)
    # key(cmd-i)
    # sleep(300ms)
    # insert(text or "")


(windsurf | surf) (write | wright | right) mode: 
    key(cmd-.)

