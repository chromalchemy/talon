os: mac
mode: command
-

^(rolly | rolling | ruling | rolle) [down] [a] <number>: 
    n = 0 - number
    na = n * 20
    mouse_scroll(na)
 
^(rolly | rolling | ruling | rolle) up [a] <number>: 
    n= number * 20
    mouse_scroll(n)  

^(rolly | rolling | ruling | rolle) | ^roll (this | that | window | view | here): key(cmd-ctrl-alt-shift-j)

#todo: How to only target and limit these to scroll mode

(roll | rolly | rolling | ruling) downer: key(j:down k:up)
(roll | rolly | rolling | ruling) upper: key(k:down j:up)

(roll | rolly | rolling | ruling) up: key(j)
# [<number_small>]
    # myNum = number_small - 1
    # repeat(myNum)
# key(j:up)10
    
(roll | rolly | rolling | ruling) stop: key(j:up k:up)
stop [(roll | rolly | rolling | ruling)]: key(j:up k:up)

(roll | rolly | rolling | ruling) next: key(down)
(roll | rolly | rolling | ruling) last: key(up)
(roll | rolly | rolling | ruling) (pick | choose) <user.number_key>: key(number_key)


# <user.number_key>
# <user.number_string>

# #homerow
target: key(shift-f12)
# search target: key(cmd-shift-f12)

# Homerow (with search + labels enabled)
^ax [<user.text>]: user.homerow_search("{text or ''}")
