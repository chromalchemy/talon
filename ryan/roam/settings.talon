app.name: Roam Research 
mode: command
-

###roam prefs

(open | go) settings:
    user.run_roam_command("Open Settings")

[(open | go)] (hotkeys | hotkey settings):
    user.run_roam_command("Hotkeys Settings")

[(open | go)] [roam] (depot | extension) settings:
    user.run_roam_command("Roam Depot Settings")

## +++++++++++++++++++++ open settings .

^workbench settings$:
    user.run_roam_command("settings workbench") 

^(tag (icons | icon) | magic (tag | tags)) settings$: 
    user.run_roam_command("magic tags")