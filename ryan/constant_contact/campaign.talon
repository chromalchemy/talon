app: chrome
title: /app.constantcontact.com/pages/campaign/
-

# [(go | click)] [mark] {user.ryan.constant_contact.edit_mark.list}:
#     user.rango_run_action_on_reference("clickElement", "{user.ryan.constant_contact.edit_mark.list}")

# email (add block | adblock | insert | paste) link: 
#     mouse_click(0)
#     sleep(100ms)
#     key(down)
#     key(enter)
#     sleep(100ms)
#     edit.select_all()
#     edit.paste()
#     sleep(30ms)
#     key(enter)

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

background color:
    user.rango_run_action_on_reference("clickElement", "options")
    # sleep(100ms)
    user.rango_run_action_on_reference("clickElement", "background")

clone block:
    user.rango_run_action_on_reference("clickElement", "options")
    user.rango_run_action_on_reference("clickElement", "duplicate")
