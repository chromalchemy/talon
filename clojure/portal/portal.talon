app: vscode
-
#tag(): user.clojure_core

launch portal: user.vscode("extension.portalOpen")

clear portal | portal clear:
    user.run_rpc_command("calva.runCustomREPLCommand", "pc")

## +++++++++++++++++++ portal clearing .

launch portal clearing: 
    user.run_rpc_command("calva.runCustomREPLCommand", "p")

go portal (tab | window):
    user.vscode("workbench.action.quickOpenPreviousRecentlyUsedEditor")
    sleep(300ms)
    insert("portal")
    sleep(300ms)
    key(enter)