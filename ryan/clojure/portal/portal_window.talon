app: vscode
-
#tag(): user.clojure_core

open portal [window]:
    user.run_repl_snippet("portal open")

## +++++++++++++++++++ portal clearing .

launch portal clearing: 
    user.run_repl_snippet("p")
    
go portal [(tab | window)]:
    user.vscode("opened-editors.openedEditors")
    # user.vscode("workbench.action.quickOpenPreviousRecentlyUsedEditor")
    insert("portal")
    # sleep(200ms)
    key(enter)

