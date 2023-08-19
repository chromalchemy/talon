os: mac
mode: command
-

(roll | rolly) (this | that | window | view | here): key(cmd-ctrl-alt-shift-j)

(roll | rolly) downer: key(j:down k:up)
(roll | rolly) upper: key(k:down j:up)

(roll | rolly) up: key(j)
# [<number_small>]
    # myNum = number_small - 1
    # repeat(myNum)
# key(j:up)10
    

(roll | rolly) stop: key(j:up k:up)
stop [(roll | rolly)]: key(j:up k:up)

(roll | rolly) next: key(down)
(roll | rolly) last: key(up)
(roll | rolly) <user.number_key>: key(number_key)


# <user.number_key>
# <user.number_string>

# #homerow
target: key(shift-f12)
# search target: key(cmd-shift-f12)

# Homerow (with search + labels enabled)
^ax [<user.text>]: user.homerow_search("{text or ''}")
