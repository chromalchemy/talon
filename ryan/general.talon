# not mode: sleep
# -

# tag: user.file_manager

exit | leave: key(esc)
nope: key(cmd-z)
yes: key(return)

(paste | pace) (unformatted | raw): key(shift-cmd-v)

#raycast 
(raycast | ray cast | ray) [<user.text>]: 
    key(cmd-space)
    insert(text)

# global app commands
save file: key(cmd-s)
quit app: key(cmd-q)

okay | ok: key(enter)

# talon sleep
key(cmd-ctrl-alt-shift-x): speech.disable()

# no-op prefix command. Prime dictation to recieve following text command, without Clipping first  syllable.
^now: skip()



# paste date template
date [string] <user.number_string> [plus] <user.number_string>: 
    insert("{number_string_1}/{number_string_2}")
    sleep(200ms)
    key(escape)

Open linear mouse [panel] | [go] linear mouse [(panel | settings)]:
    user.run_raycast_command("LinearMouse")

## ++++++++++ go to open tab In chrome .

browse (page | tab) <user.text>:
    user.switcher_focus("Google Chrome") 
    key(cmd-shift-a)
    sleep(200ms) 
    insert("{text}")
    sleep(100ms)
    key(enter)

 ## +++++++++++++++++++++ hotkey viewer .
    
(show | view) (hot keys | hotkeys): 
    key(cmd:down)
    sleep(1000ms)
