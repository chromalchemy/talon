app.name: Roam Research 
mode: command
-

divider (chars | characters): "---"

new [block] divider [block]:
    insert("---")
    user.roam_new_block_below()

make [block] divider [block]:
    user.roam_select_block_text()
    sleep(100ms)
    insert("---")
    key(esc)

(insert | (add | ad)) divider [block]:
    user.roam_new_block_below()
    insert("---")
    key(esc)

(insert | (add | ad)) divider (fresh | new) [block]:
    user.roam_new_block_below()
    insert("---")
    sleep(100ms)
    user.roam_new_block_below() 

# use escape twice to fully exit new divider (but then cant The keyboard navigate from there)

[insert] divider [block] [below] | divide [blocks] below:
    user.roam_new_block_below()
    insert("---")
    key(esc)

divide [blocks] point:
    user.roam_click_block()
    user.roam_break_block()
    user.roam_new_block_above()
    insert("---")
    key(esc)

divide [blocks] here:
    user.roam_break_block()
    user.roam_new_block_above()
    insert("---")
    key(esc)