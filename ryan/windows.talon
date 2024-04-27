## ++++++++++++++++++++++ pick open window

pick (win | window) [spotlight]: key(ctrl-up)
pick (win | window) grid: key(cmd-alt-shift-ctrl-down)
pick (win | window) (ray | list): 
    key(cmd-space)
    insert("switch windows")
    sleep(100ms)
    key(enter)

[pick] app (win | windows) [finder] : key(ctrl-down)   

## ++++++++++++++++++++++ show desktop .

(show | hide | toggle) desk: key(f11)

