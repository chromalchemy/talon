os: mac
mode: command
-

#----------- picking targets

[(home row | home | hat)] point  [(at screen | screen)]: 
    key(shift-f12)

# search target: key(cmd-shift-f12)

# Homerow (with search + labels enabled)

[(home row | home)] point [screen] [<user.text>]: 
    user.homerow_search("{text or ''}")

[(home row | home)] click (on | [on] screen) [<user.text>]: 
    user.homerow_search("{text or ''}")
    sleep(100ms)
    user.homerow_pick("", false)


