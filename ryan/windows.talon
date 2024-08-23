## ++++++++++++++++++++++ pick open window

pick (win | window | spotlight) [spotlight] | [pick] all (win | windows): key(ctrl-up)

[pick] (win | window) grid: key(cmd-alt-shift-ctrl-down)

[pick] (win | window) (ray | list): 
    key(cmd-space)
    insert("switch windows")
    sleep(100ms)
    key(enter)

[pick] app (win | windows) [finder] : key(ctrl-down)   

## ++++++++++++++++++++++ show desktop .

(show | hide | toggle) (desk | desktop): key(f11)

