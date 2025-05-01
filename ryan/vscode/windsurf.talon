app.name: Windsurf
app.name: Windsurf - Next
tag: user.cursorless
-

# surf test: print("testing from windsurf next")

bar (cascade | chat | surf | serf) (memories | rules):
    user.run_rpc_command("windsurf.openMemoriesTab")

## ++++++++++++++++ show cascade panel .

#  doesn't go to form
bar (cascade | chat | surf | serf):
    user.run_rpc_command("windsurf.cascadePanel.focus")

# same as above?
# cascade:
#     user.run_rpc_command("windsurf.cascadeViewContainerId")

## ++++++++++++++++++++++++++++++ auto .

#prompt?
auto cascade:
    user.run_rpc_command("windsurf.triggerAutoCascade")

## ++++++++++++++++++++++++++ not sure .

#  she doesn't seem to do anything
# toggle cascade visibility:
#     user.run_rpc_command("windsurf.cascadePanel.toggleVisibility")

# toggles whole sidebar,  but not necessarily windsurf panel.  doesn't focus
# open cascade:
#     user.run_rpc_command("windsurf.openCascade")


## +++++++++++++++++ send selection reference to chat form, focus  if showing. doesn't go to panel

(reference [in]  | (add | had) (reference | context) [to]) [(chat [box] | chatbot | cascade)]  | (cascade | chat) that | (go | focus | curse) (cascade | surf | serf | chat) box:
    user.run_rpc_command("windsurf.prioritized.chat.open")   

(cascade | add context) <user.cursorless_target>:
    user.cursorless_ide_command("windsurf.prioritized.chat.open", cursorless_target)

## +++++++++++++++++++++++ edit inline .

(windsurf | surf | serf) [edit] [that] [(inline | in place)]:
    key(cmd-i)   

(windsurf | surf | serf) edit [(inline | in place)] <user.cursorless_target>:
    user.cursorless_ide_command("setSelection", cursorless_target)
    # sleep(500ms)
    # key(cmd-i)
    # sleep(300ms)
    # insert(text or "")


# (windsurf | surf | serf) [toggle] (write | wright | right | chat) mode: 
    key(cmd-.)

