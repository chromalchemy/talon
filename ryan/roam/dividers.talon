app.name: Roam Research 
mode: command
-

(insert | (add | ad) | make) divider:
    user.roam_select_block_text()
    sleep(100ms)
    insert("---")
    sleep(100ms)
    user.roam_new_block_below()

new divider [block] [below] | divide below (new | open):
    user.roam_new_block_below()
    insert("---")
    sleep(100ms)
    user.roam_new_block_below() 

divider [block] [below] | divide below:
    user.roam_new_block_below()
    insert("---")
    key(esc:2)

divide point:
    user.roam_click_block()
    user.roam_break_block()
    user.roam_new_block_above()
    insert("---")
    key(esc:2)

divide here:
    user.roam_break_block()
    user.roam_new_block_above()
    insert("---")
    key(esc:2)