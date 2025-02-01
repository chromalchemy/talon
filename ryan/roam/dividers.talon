app.name: Roam Research 
mode: command
-

make divider:
    user.roam_select_block_text()
    sleep(100ms)
    insert("---")
    key(esc)

(insert | (add | ad) | new) divider:
    user.roam_new_block_below()
    insert("---")
    key(esc)

(insert | (add | ad) | new) divider (fresh | new) [block]:
    user.roam_new_block_below()
    insert("---")
    sleep(100ms)
    user.roam_new_block_below() 

# use escape twice to fully exit new divider (but then cant The keyboard navigate from there)

divider [block] [below] | divide below:
    user.roam_new_block_below()
    insert("---")
    key(esc)

divide point:
    user.roam_click_block()
    user.roam_break_block()
    user.roam_new_block_above()
    insert("---")
    key(esc)

divide here:
    user.roam_break_block()
    user.roam_new_block_above()
    insert("---")
    key(esc)