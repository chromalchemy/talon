app.bundle: com.apple.mail
-
# from nriley codebase

tag(): user.find_and_replace

archive: key(ctrl-cmd-a)
delete: key(backspace)
# This toggles; OK for now
flag | unflag: key(cmd-shift-l)
junk: key(cmd-shift-j)
download: user.mail_download_images()
reply: key(cmd-r)
reply all: key(cmd-shift-r)
forward: key(cmd-shift-f)

mark [as] read: user.mail_mark_as_read()
mark [as] unread: user.mail_mark_as_unread()

send [this] message: key(cmd-shift-d)

# uses my favorite mailboxes
go [to] inbox: key(cmd-1)
go [to] drafts: key(cmd-4)
go [to] sent [mail]: key(cmd-2)

next: user.mail_select_message(1)
previous: user.mail_select_message(-1)

message (last | lost | lust):
    key(end)
    user.mail_select_last_message()

normal: user.menu_select("Format|Style|Remove Style")

# MsgFiler
move: user.launch_or_focus_bundle("com.atow.MsgFiler4")

(save to | move to | folder) [<user.text>]:
    user.launch_or_focus_bundle("com.atow.MsgFiler4")
    key(cmd-a)
    user.paste(user.text or "")

# Add to OmniFocus
to do: key(ctrl-o)

(get | check) [for] new mail:
    user.menu_select('Mailbox|Get New Mail')

(download | save) attachment [here]:
    mouse_click(1)
    sleep(100ms)
    insert("save attachment")

(download | save) [and] copy (attachment | file) [here]:
    mouse_click(1)
    sleep(400ms)
    insert("save attachment")
    key(enter)
    sleep(1000ms)
    key(cmd-c)
    sleep(500ms)
    # edit.copy()
    key(enter)