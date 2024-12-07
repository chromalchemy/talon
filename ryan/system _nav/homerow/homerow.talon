os: mac
mode: command
-

#----------- picking targets

[(home row | home | hat)] (point [at]) [screen]: key(shift-f12)
# search target: key(cmd-shift-f12)

# Homerow (with search + labels enabled)
[(home row | home | hat)] (point [at]) [screen] [<user.text>]: 
    user.homerow_search("{text or ''}")
