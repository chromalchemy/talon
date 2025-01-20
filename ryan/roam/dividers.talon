app.name: Roam Research 
mode: command
-

(insert | (add | ad) | make) divider:
    insert("---")
    key(enter)  

new divider [block] [below] | divide below:
    key(ctrl-e) 
    user.roam_break_block()
    insert("---")
    key(esc:2) 