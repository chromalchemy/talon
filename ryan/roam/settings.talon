app.name: Roam Research 
mode: command
-

###roam prefs

open hotkeys: 
    key(cmd-p)
    sleep(100ms)
    user.paste("hotkeys")
    sleep(100ms)
    key(enter)

## +++++++++++++++++++++ open settings .

^workbench settings$: 
    key(cmd-p)
    sleep(200ms)
    user.paste("settings workbench")
    key(enter)

^(tag (icons | icon) | magic (tag | tags)) settings$: 
    key(cmd-p)
    sleep(200ms)
    user.paste("magic tags")
    key(enter)