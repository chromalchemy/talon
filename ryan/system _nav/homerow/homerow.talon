os: mac
mode: command
-

#----------- picking targets

[(home row | home | hat)] (point | click)  [(at screen | screen)]: 
    key(shift-f12)

# search target: key(cmd-shift-f12) 

# Homerow search text 
# Use arrow keys to choose from results

[(home row | home)] point [screen] [<user.text>]: 
    user.homerow_search("{text or ''}")

[(home row | home)] click (on | [on] screen) [<user.text>]: 
    user.homerow_search("{text or ''}")
    sleep(100ms)
    user.homerow_pick("", false)


