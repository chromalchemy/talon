os: mac
mode: command
-

#----------- picking targets

[(home row | home | hat)] (ax | acts | ex | point): key(shift-f12)
# search target: key(cmd-shift-f12)

# Homerow (with search + labels enabled)
[(home row | home | hat)] (ax | acts | ex | point) [<user.text>]: 
    user.homerow_search("{text or ''}")
