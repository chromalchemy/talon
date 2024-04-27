
(take screen shot | screen grab): key(ctrl-shift-cmd-4)

screenshot text:
    user.system_command_nb("/Applications/OwlOCR.app/Contents/MacOS/OwlOCR --cli --screenshot | pbcopy")
    # t = user.system_command_nb_get_text("/Applications/OwlOCR.app/Contents/MacOS/OwlOCR --cli --screenshot")
    # user.paste(t)
    

show (clip | clipboard | image | screengrab) [in] preview:
    key(cmd-space)
    insert("preview")
    sleep(100ms)
    key(enter)
    sleep(100ms)
    key(cmd-w)
    sleep(100ms)
    key(shift-f12)
    sleep(700ms)
    key(d)
    sleep(100ms)
    key(a)
    sleep(600ms)
    key(cmd-n)