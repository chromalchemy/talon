app.name: IntelliJ IDEA
-

[new] text override:
    key(alt-up)
    sleep(100ms)
    key(cmd-c)
    key([)
    sleep(100ms)
    key(alt-right)
    sleep(100ms)
    key(space) 
    key(cmd-v)
    sleep(100ms)
    key(alt-left)
    key(right)
    
[new] prefix override [<user.text>]:
    key(alt-up)
    sleep(100ms)
    key(cmd-c)
    key([)
    sleep(100ms)
    key(alt-right)
    sleep(100ms)
    key(space) 
    key({) 
    insert(":post ")
    key(")
    insert(text)
    
[new] (opt | optional) postfix override :
    key(alt-up)
    sleep(100ms)
    key(cmd-c)
    key([)
    sleep(100ms)
    key(alt-right)
    sleep(100ms)
    key(space) 
    key({) 
    insert(":post ")
    key(")
    sleep(100ms)
    insert("[")
    insert(text or "")
    insert("]")
    key(left)
    

[new] (opt | optional) postfix override  [<user.text>]:
    key(alt-up)
    sleep(100ms)
    key(cmd-c)
    key([)
    sleep(100ms)
    key(alt-right)
    sleep(100ms)
    key(space) 
    key({) 
    insert(":post ")
    key(")
    sleep(100ms)
    insert("[")
    insert(text or "")
    insert("]")
    key(left)
    key(alt-up)
    

    
    
    
    


type tool: key(t)
move tool: key(v)
(standard move | artboard) tool: key(shift-v)


jump to source: key(cmd-down)
[repl] load file : key(ctrl-enter)
(show | hide) project: key(cmd-1)
(show | hide) commit: key(cmd-0)
(show | hide) structure: key(cmd-7)
(show | hide) bookmarks: key(cmd-2)
(show | hide) git: key(cmd-9)
#(show | hide) todos: key(cmd-9)
(show | hide) terminal: key(alt-f12)
(show | hide) repl: key(alt-f11)
(evaluate | eval): key(cmd-enter)
(rep | repl | eval | compute) top: key(cmd-enter)
(rep | repl | eval | compute) this: key(alt-enter)

take: key(alt-up)
copy that: key(cmd-c) 
paste that: key(cmd-v)

# Why doesn't kill line work? delete seems to 
(delete | kill) line: key(cmd-backspace)

comment that: key(cmd-/)
comment symbol: insert("#" + "_")


repl build (templates | theme): key(f1)

(open | search) file: key(cmd-shift-o)

