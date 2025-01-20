app.name: Code
app.name: Cursor
app.name: Windsurf
-
#tag(): user.clojure_core

## ++++++++++++ open new portal window .

## native open portal commands

open portal node:
    user.run_rpc_command("extension.portalOpen")

open portal dev:
    user.run_rpc_command("extension.portalOpenDev")

(open | new | launch) portal [window]:
    user.run_repl_snippet("portal open")

launch portal clearing: 
    user.run_repl_snippet("p")

## +++++++ nav to / show portal window .

go portal [(tab | window)]:
    user.run_rpc_command("opened-editors.openedEditors")
    insert("portal")
    sleep(50ms)
    key(enter)

show portal [(tab | window)]:
    user.run_rpc_command("opened-editors.openedEditors")
    insert("portal")
    sleep(50ms)
    key(enter)
    sleep(150ms)
    user.run_rpc_command("workbench.action.navigateBack")

