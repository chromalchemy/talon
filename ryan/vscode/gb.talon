app: vscode
-

#todo: put this command line scripts/snippets registry, maybe in ide config (warp?)
stencil [force] push command: insert("stencil push -d -a") 

go my mark:
    user.vscode("bookmarks.list")
    sleep(100ms)
    user.paste("test mark")
    sleep(100ms)
    key(enter)
    # user.run_rpc_command("bookmarks.list", "test mark")
    