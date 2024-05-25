app.name: Roam Research 
mode: command
-
## +++++++++++++++++++ edit checkboxes .

make (todo | action): 
    key(cmd-return)
    # sleep(100ms)
    # key(escape)

[new] (todo | to do | action) <user.text> : 
    insert("{{{{[[TODO]]}}}} {text}")
    # key(cmd-return)
    # insert(text)
    
make done: 
    key(cmd-return)
    # sleep(100ms)
    # key(escape)

mark done: 
    key(cmd-return:2)
    # sleep(100ms)
    # key(escape)

[new] done <user.text>: 
    insert("{{{{[[DONE]]}}}} {text}")
    # key(cmd-return:2)
    # insert(text)

make undone: 
    key(cmd-return:2)
    sleep(100ms)
    key(escape)

remove (todo | action): 
    key(cmd-return:2)
    sleep(100ms)
    key(escape)
