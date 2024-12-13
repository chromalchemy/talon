app.name: Roam Research 
mode: command
-

(insert | (add | ad) | paste) divider:
    insert("---")
    key(enter)  

new divider [block]:
    key(ctrl-e) 
    user.roam_break_block()
    insert("---")
    key(esc:2) 