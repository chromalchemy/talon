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

## +++++++ move window to other screen .

move [(win | window)] to (macbook  | laptop | small | mac) [(screen | display)]:
    user.menu_select('Window|Move to Built-in Retina Display')

move [(win | window)] to (other | big | main  | large | luna) [(screen | display)]:
    user.menu_select('Window|Move to HP ALL-in-One')