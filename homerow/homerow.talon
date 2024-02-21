os: mac
mode: command
-
 
#-------------- scrolling

^(rolly | rolling | ruling | rolle) (this | that | window | view | here): 
    key(cmd-ctrl-alt-shift-j)

#todo: How to only target and limit these to scroll mode

(roll | rolly | rolling | ruling) downer: 
    key(j:down k:up)

(roll | rolly | rolling | ruling) upper: 
    key(k:down j:up)

(roll | rolly | rolling | ruling) up: key(j)
# [<number_small>]
    # myNum = number_small - 1
    # repeat(myNum)
# key(j:up)10
    
(roll | rolly | rolling | ruling) stop: 
    key(j:up k:up)

stop [(roll | rolly | rolling | ruling)]: 
    key(j:up k:up)

(roll | rolly | rolling | ruling) next: 
    key(down)

(roll | rolly | rolling | ruling) last: 
    key(up)

(roll | rolly | rolling | ruling) (pick | choose) <user.number_key>: 
    key(number_key)

#----------- picking targets

[(home row | home | hat)] (ax | acts | ex | point): key(shift-f12)
# search target: key(cmd-shift-f12)

# ^(ax | acts | ex | point) [<user.text>]: 
#     user.homerow_search("{text or ''}")

# Homerow (with search + labels enabled)
[(home row | home | hat)] (ax | acts | ex | point) [<user.text>]: 
    user.homerow_search("{text or ''}")
