app.name: Roam Research 
mode: command
-
## +++++++++++++++++++ edit checkboxes .

(make | mark) (todo | to do | task | action): 
    key(cmd-return)
    
[new] (todo | to do | task | action) <user.text> : 
    insert("{{{{[[TODO]]}}}} {text}")
    # key(cmd-return)
    # insert(text)
    
mark [(task | action)] done: 
    key(cmd-return)
    
make [(task | action)] done: 
    key(cmd-return:2)
    
[new] done [(task | action)] <user.text>: 
    insert("{{{{[[DONE]]}}}} {text}")
    # key(cmd-return:2)
    # insert(text)

make undone | reactivate task: 
    key(cmd-return:2)
    sleep(100ms)
    key(escape)

remove (todo | action | task) | make text block: 
    key(cmd-return:2)
    sleep(100ms)
    key(escape)