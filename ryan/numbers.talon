app.name: Numbers 
-

<user.arrow_keys>: user.move_cursor(arrow_keys)

gmail: insert("gmail.com")
at gmail: insert("@gmail.com")
at yahoo: insert("@yahoo.com")
dot com: insert(".com")
edit [cell]: key(alt-enter)


(chuck | delete) (row |rows) [point]:
    mouse_click(1)
    sleep(200ms)
    insert("delete row")
    sleep(200ms)
    key(enter)
    
(chuck | delete) (column |columns) [point]:
    mouse_click(1)
    sleep(200ms)
    insert("delete column")
    sleep(200ms)
    key(enter)

export new [(comma | csv)] sheet:
    user.menu_select('File|Export To|CSV…')
    sleep(200ms)
    key(enter)

export [(comma | csv)] sheet:
    user.menu_select('File|Export To|CSV…')
    sleep(200ms)
    key(enter)
    sleep(1800ms)
    key(enter)
    sleep(200ms)
    key(tab)
    sleep(200ms)
    key(space)