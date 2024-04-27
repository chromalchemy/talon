app: vscode
-
#tag(): user.clojure_core

open portal [window]:
    user.run_rpc_command("calva.runCustomREPLCommand", "portal open")

## +++++++++++++++++++ portal clearing .

launch portal clearing: 
    user.run_rpc_command("calva.runCustomREPLCommand", "p")

go portal [(tab | window)]:
    user.vscode("opened-editors.openedEditors")
    # user.vscode("workbench.action.quickOpenPreviousRecentlyUsedEditor")
    insert("portal")
    # sleep(200ms)
    key(enter)

