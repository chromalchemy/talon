## ++++++++++++++++++++++ pick open window

## ++++++++++++++++++++++ apple native .

# pick app by modal icon bar
# bug: not working
(pick app | pickup) icons:
    key(cmd:down)
    key(tab:down)

# app window chooser
[pick] (app | up) (win | windows) [finder] : 
    key(ctrl-down)   

## spotlight .
pick (win | window | spotlight) [(all | spotlight)] | [pick] all (win | windows) | spotlight: 
    key(ctrl-up)

(show | hide | toggle) (desk | desktop):
     key(f11)


## +++++++++++++++++++ alt-tab utility .

[pick] (win | window) grid: 
    key(cmd-alt-shift-ctrl-down)

## +++++++++++++++++++++++++++ raycast .

[pick] (win | window) (ray | list): 
    key(cmd-space)
    insert("switch windows")
    sleep(100ms)
    key(enter)

## +++++++ move windows to/from displays .
    
# (other | big | main | (ext | external) | large)
move [(win | window)] to  {user.ryan.display_name.list}  [(screen | display)]:
    user.menu_select("Window|Move to {user.ryan.display_name.list}")

move [(win | window)] to (macbook  | laptop | small | mac) [(screen | display)]:
    user.menu_select('Window|Move to Built-in Retina Display')