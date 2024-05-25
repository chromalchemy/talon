app.name: Roam Research 
mode: command
-

(toggle | hide |  show) ( shortcuts |  (left | l) (sidebar | bar) | bookmarks): key(cmd-\)

#------------------not working
add (shortcut | bookmark): 
    key(cmd-p)
    sleep(100ms)
    user.paste("wb add shortcut")
    sleep(100ms)
    key(enter)
