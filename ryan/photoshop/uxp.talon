app.name: Adobe UXP Developer Tools
-

load [selected] plugin: 
    key(cmd-l)

reload [selected] plugin: 
    key(cmd-alt-r)

# bug , not working  (overidden by another hotkey?)
watch [selected] plugin: 
    key(cmd-alt-w)

[(run | open)] devtools | debug [selected] plugin: 
    key(cmd-d)

(dev | develop) plugin | plugin dev [mode]: 
    key(cmd-l)
    sleep(300ms)
    key(cmd-alt-w)
    sleep(300ms)
    key(cmd-d)
    sleep(300ms)
    user.snap_window_to_position("bottom right")

watch photo plugin:  
    user.uxp_watch_ps_dev_plugin()

load photo plugin:  
    user.uxp_select_ps_dev_plugin()
    key(space)
    sleep(100ms)
    key(cmd-l)

# (dev | develop) plugin zen | plugin dev [mode] zen: 
#     key(cmd-l)
#     sleep(300ms)
#     key(cmd-alt-w)
#     sleep(300ms)
#     key(cmd-d)
#     sleep(300ms)
#     user.snap_window_to_position("bottom right")
#     key(cmd-ctrl-alt-shift-s)
#     sleep(200ms)
#     insert("adobe uxp developer tools")
#     key(enter)
#     sleep(200ms)
#     user.action_windows("minimize", 1, 0)
