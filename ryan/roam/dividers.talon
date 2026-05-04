app.name: Roam Research 
mode: command
-

divider (chars | characters | symbol): "---"

new [block] divider [block]:
    user.roam_insert_divider()
    user.roam_new_block_below()

make [block] divider [block]:
    user.roam_select_block_text()
    sleep(100ms)
    user.roam_insert_divider()
    key(esc)

(insert | (add | ad)) divider [block] [below] | (divide | split) list here:
    user.roam_new_block_below()
    user.roam_insert_divider()
    key(esc)

(insert | (add | ad)) divider  [block] [below] (fresh | new) | (divide | split list) here (fresh | new):
    user.roam_new_block_below()
    user.roam_insert_divider()
    user.roam_new_block_below() 


(insert | (add | ad)) divider  [block] [below] [and] (pace | paste) | (divide | split list) [and] (pace | paste) [here]:
    user.roam_new_block_below()
    user.roam_insert_divider()
    user.roam_new_block_below() 
    edit.paste()

# use escape twice to fully exit new divider (but then cant The keyboard navigate from there)


divide [blocks] point:
    user.roam_click_block()
    user.roam_break_block()
    user.roam_new_block_above()
    user.roam_insert_divider()
    key(esc)

divide [blocks] here:
    user.roam_break_block()
    user.roam_new_block_above()
    user.roam_insert_divider()
    key(esc)