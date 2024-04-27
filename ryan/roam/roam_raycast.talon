## ++++++++++++++++++++++ roam raycast extension

(notes | note | no to | not to | don't | roam | rome) capture: 
    key(cmd-ctrl-alt-shift-;)

#input focus fails randomly

#send copied text to roam
(notes | note | no to | not to | don't | roam | rome) capture (paste | pace | clip) | (send) (clip | paste) [to] notes:
    key(cmd-ctrl-alt-shift-;)
    sleep(200ms)
    edit.paste()

# Send selected text to roam
(notes | note | no to | not to | don't | roam | rome) capture that | send that [to] notes:
    # edit.copy()
    key(cmd-c)
    sleep(200ms)
    key(cmd-ctrl-alt-shift-;)
    sleep(200ms)
    edit.paste()
    sleep(100ms)
    key(cmd-enter)
    sleep(100ms)
    key(escape)

# Send selected text with point touch to roam
(notes | note | no to | not to | don't | roam | rome) capture point | send point [to] notes:
    key(shift:down)
    mouse_click(1)
    edit.copy()
    key(cmd-ctrl-alt-shift-;)
    sleep(200ms)
    edit.paste()
    sleep(100ms)
    key(cmd-enter)
    sleep(100ms)
    key(escape)

(ok | confirm | send) note:
    key(cmd-enter)
    sleep(100ms)
    key(escape)
