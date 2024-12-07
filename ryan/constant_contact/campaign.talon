app: chrome
title: /app.constantcontact.com/pages/campaign/
-
(go | click) [mark] {user.ryan.constant_contact.edit_mark.list}:
    user.rango_run_action_on_reference("clickElement", "{user.ryan.constant_contact.edit_mark.list}")


paste link:
    user.rango_run_action_on_reference("clickElement", "link")
    sleep(100ms)
    key(down enter)
    sleep(300ms)
    key(cmd-a)
    sleep(100ms)
    key(cmd-v)
    sleep(100ms)
    key(enter)

remove link:
    user.rango_run_action_on_reference("clickElement", "link")
    sleep(100ms)
    key(down:2 enter)