
^[((who | will) she | wooshy | wish he)] (hunt ( [screen] text | screen) | point (at | out)) [<user.text>] : 
    key(cmd-shift-space)
    sleep(300ms) 
    user.paste("{text or ''}")

^[((who | will) she | wooshy | wish he)] click at [<user.text>] : 
    key(cmd-shift-space)
    sleep(300ms) 
    user.paste("{text or ''}")
    sleep(200ms)
    key(enter)


