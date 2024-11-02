app: vscode
-
#tag(): user.clojure_core

## ++++++++++++ open new portal window .

## native open portal commands

open portal node:
    user.vscode("extension.portalOpen")

open portal dev:
    user.vscode("extension.portalOpenDev")

(open | new | launch) portal [window]:
    user.run_repl_snippet("portal open")

launch portal clearing: 
    user.run_repl_snippet("p")

## +++++++ nav to / show portal window .

go portal [(tab | window)]:
    user.vscode("opened-editors.openedEditors")
    insert("portal")
    sleep(50ms)
    key(enter)

show portal [(tab | window)]:
    user.vscode("opened-editors.openedEditors")
    insert("portal")
    sleep(50ms)
    key(enter)
    sleep(150ms)
    user.vscode("workbench.action.navigateBack")

