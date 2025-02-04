app.name: Roam Research 
mode: command
-

(toggle | hide |  show) ( shortcuts |  (left | l) (sidebar | bar) | bookmarks) | bar left | left bar: key(cmd-\)

#------------------not working

[page] add (shortcut | bookmark) | add [page] to (shortcuts | bookmarks):
    user.run_roam_command("add shortcut to page")
