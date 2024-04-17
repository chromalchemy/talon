app.name: Adobe UXP Developer Tools
-

load plugin: 
    key(cmd-l)

reload plugin: 
    key(cmd-alt-r)
watch plugin: 
    key(cmd-alt-w)

[(run | open)] devtools | debug plugin: 
    key(cmd-d)

(dev | develop) plugin | plugin dev [mode]: 
    key(cmd-l)
    sleep(300ms)
    key(cmd-alt-w)
    sleep(300ms)
    key(cmd-d)
    sleep(300ms)
    user.snap_window_to_position("bottom right")

(dev | develop) plugin zen | plugin dev [mode] zen: 
    key(cmd-l)
    sleep(300ms)
    key(cmd-alt-w)
    sleep(300ms)
    key(cmd-d)
    sleep(300ms)
    user.snap_window_to_position("bottom right")
    key(cmd-ctrl-alt-shift-s)
    sleep(200ms)
    insert("adobe uxp developer tools")
    key(enter)
    sleep(200ms)
    user.action_windows("minimize", 1, 0)
