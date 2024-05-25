app.name: Roam Research 
mode: command
-

(insert | (add | ad) | paste) divider:
    insert("---")
    key(enter)  

new divider [block]:
    key(ctrl-e) 
    key(enter)
    sleep(100ms)
    insert("---")
    key(esc:2) 