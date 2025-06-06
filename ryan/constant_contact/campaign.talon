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
    user.cc_paste_link()

remove link:
    user.rango_click_ref("link")
    sleep(100ms)
    key(down:2 enter)

edit [block] background color:
    user.cc_edit_block_background_color()

edit [block] background color advanced:
    user.cc_select_block_background_val()

copy background color: 
    user.cc_select_block_background_val()
    sleep(200ms)
    edit.copy()
    user.rango_click_ref("options")

(clear | remove | chuck) background color:
    user.cc_select_block_background_val()
    user.rango_flick_ref("clear background color")

paste background color:
    user.cc_select_block_background_val()
    edit.paste()
    sleep(300ms)
    user.rango_flick_ref("apply background color")

clone block:
    user.rango_click_ref("options")
    user.rango_click_ref("duplicate")
