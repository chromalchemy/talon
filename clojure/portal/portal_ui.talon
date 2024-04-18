title: /portal/
-

[(open | show)] portal (commands | [command] pallete | [portal] (please | police) [portal]) [<user.text>]:
    key(ctrl-j)
    sleep(200ms)
    insert(text or "")

[(open | show)] portal (you eye | ui) (commands | [command] pallete) | portal (please | police) (you eye | ui):
    key(ctrl-j)
    sleep(300ms)
    insert("ui")

[portal] clear | clear portal:
    key(ctrl-l)

focus: 
    key(ctrl-enter)

[portal] (expand | expanding | unfold) (ink | incremental | inc | next | again): 
    key(shift-e)

[Portal] next viewer: 
    key(shift-j)

[Portal] last viewer: 
    key(shift-k)

[portal] pick [portal] viewer: 
    key(v)

[portal] [pick] [portal] (viewer | view) [as] {user.portal_viewer}: 
    key(v)
    sleep(200ms)
    insert(portal_viewer)
    sleep(100ms)
    key(enter)

[portal] back: 
    key(cmd-left)
[portal] forward: 
    key(cmd-right)

[portal] [history] (first | initial | init | start) [(val | fell | vow | value | thou)]: 
    key(cmd-shift-left)

[portal] [history] (last | end | final): 
    key(cmd-shift-right)

[portal] (redo | again): 
    key(ctrl-r)

portal [(go | scroll)] top: 
    key(g g)

portal [(go | scroll)] bottom: 
    key(shift-g)
    
[portal] [toggle] (expand | expanding | collapse | unfold | fold ): 
    key(a z)

[portal] ([select] none | deselect): 
    key(shift-esc)

[portal] [go] (child | kid | kids | right) (val | fell | vow | value | thou): 
    key(right)
    
[portal] [go] (parent | left) (val | fell | vow | value | thou): 
    key(left)

[portal] [go] (next | down) (val | fell | vow | value | thou): 
    key(down)

[portal] [go] (last | up) (val | fell | vow | value | thou): 
    key(up)

[portal] (pop | exit): key(esc)

[portal] ((focus | go) filter | filter [this | that]) [<user.text>]: 
    key(/)
    sleep(100ms)
    insert(text or "")

[portal] ((focus | go) filter | filter [this | that]) (paste | pace): 
    key(/)
    sleep(100ms)
    edit.paste()
    

(toggle | show | hide) (shell | frame): 
    key(ctrl-j)
    sleep(100ms)
    insert("shell")
    sleep(100ms)
    key(enter)



