app: chrome
title: /app.constantcontact.com/pages/campaign/
-

(go | click) [mark] {user.cc_edit_mark}:
    # insert("{cc_edit_mark}")
    user.rango_run_action_on_reference("clickElement", "{cc_edit_mark}")


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