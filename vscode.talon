app.name: Code
-

#talon edit fns
sleep action <user.number_string>:
    a = "sleep(" + number_string
    b = a + "ms)"
    insert(b)


[(add | new)] key action:
    insert("key()")
    key(left)

new insert action:
    insert("insert(\"\")")
    # sleep(300ms)
    key(left:2)


#general editor stuff

choose [color] theme:       user.menu_select('Code|Settings…|Theme|Color Theme [⌘K ⌘T]')


#use axkit command
# (show | reveal) file [in] finder:
#     #todo: not working
#     # key(cmd-alt-r)
#     key(cmd-shift-p)
#     sleep(100ms)
#     insert("reveal in finder")
#     sleep(100ms)
#     key(enter)

#bars

(show | reveal) file [in] (explore | explorer):
    key(cmd-shift-p)
    sleep(100ms)
    insert("reveal active file")
    sleep(100ms)
    key(enter)

collapse (explore | Explorer) [(bar | view)]:
    key(cmd-shift-p)
    insert("collapse folders in explorer")
    key(enter)


((activity bar | icons bar) (toggle | show | hide | view) | (toggle | show | hide | view) (activity bar | icons bar)):
    key(cmd-shift-p)
    insert("toggle activity bar visibility")
    key(enter)

(focus | go) (activity bar | icons bar):
    key(cmd-shift-p)
    insert("focus activity bar")
    key(enter)


(toggle | show | hide | view) [left] (sidebar | bar): key(cmd-b)
bar (toggle | show | hide): key(cmd-b)
(toggle | show | hide | view) right (sidebar | bar): key(cmd-alt-b)
((toggle | show | hide | view) [bottom] panel | [bottom] panel (toggle | show | hide | view)): key(cmd-j)
panel (toggle | show | hide | view): key(cmd-j)
(toggle | show | hide) zen mode: key(cmd-k z)
(toggle | show | hide) line numbers: key(ctrl-shift-l)


wrap words:                 key(alt-z)

#general edit commands

(kill line | killing | k line | cline): key(cmd-shift-k)


# find text  (deprecate for knausj?)
(find [text] [in file] | search file): key(cmd-f)
(search | find in) files:   key(shift-cmd-h)
(search | find in) folder:  key(shift-alt-f)
# key(shift-cmd-e) # not reliable toggles back and forth
(search | find) that in folder:
    key(shift-alt-f)
    sleep(200ms)
    key(cmd-v)
(search | find in) in folder <user.text>:
    key(shift-alt-f)
    sleep(200ms)
    insert(text)

[(search | find) and] replace [text]: key(cmd-alt-f)
[(search | find) and] that:
    key(cmd-alt-f)
    sleep(200ms)
    key(cmd-v)
[(search | find) and] replace <user.text>:
    key(cmd-alt-f)
    sleep(200ms)
    insert(text)

[toggle] hunt [in] (selection | [whole] page10): key(alt-cmd-l)


#calva

(show | focus) [repl] (results | output) (view | window | tab): key(ctrl-alt-o o)

kill process:               key(ctrl-c)
(jack in repl | repl  jack in): key(alt-ctrl-c alt-ctrl-j)

#evaluate

(rep | repl | ripple | evaluate | eval | compute | run it  | running ) [top] fresh:
    key(ctrl-alt-o o)
    sleep(500ms)
    key(cmd-a)
    sleep(500ms)
    key(delete)
    sleep(500ms)
    key(ctrl-keypad_minus)
    sleep(500ms)
    key(alt-enter)
    sleep(1000ms)
    key(ctrl-alt-o o)
    sleep(2000ms)
    key(ctrl-g)
    # sleep(500ms)
    # key(1)
    # sleep(500ms)
    # key(enter)

    # key(cmd-up)
    # sleep(500ms)
    # key(ctrl-keypad_minus)
    # sleep(500ms)
    # key(ctrl-keypad_minus)
    # sleep(500ms)
    key(ctrl-keypad_minus:3)


clear inline (results | eval | evaluations): key(esc)

[(rep | repl | ripple)] load file [in (rep | repl | ripple)]: key(shift-cmd-alt-ctrl-r)


#eval top form
(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) [it] [(top | top form)]:
    key(alt-enter)

#eval enclosing form
(rep | repl | ripple | evaluate | eval | compute | comp | run | runt) (parent | enclosing | wrapping | form | outside) [form]:
    key(shift-ctrl-enter)

#eval selected text or form @ caret
(rep | repl | ripple |  evaluate | eval | compute | comp | run | runt) (here | that | selection):
    key(ctrl-enter)

calva (evaluate | eval) [commands]:
    key(cmd-shift-p)
    insert("evaluate ")



#format
calva format [commands]:
    key(cmd-shift-p)
    insert("calva format ")

#navigate
[go] (last |  previous | prev) form: key(alt-up)
[go] next form:             key(alt-down)

let's go back:              key(ctrl--)
[let's] go (forward | fore | four): key(shift-ctrl--)

go to last edit:            key(cmd-k cmd-q)

#paredit
(paredit | pare edit | pear edit) commands:
    key(cmd-shift-p)
    insert("calva paredit ")

wrap [in] (brackets | vector | square): key(ctrl-shift-alt-s)

slurp forward:              key(ctrl-alt-right)
slurp backward:             key(shift-ctrl-alt-left)
barf forward:               key(ctrl-alt-left)
barf backward:              key(shift-ctrl-alt-right)

swap forms:                 key(ctrl-alt-t)

[move] form (up | left | back): key(alt-up)
[move] form (down | right |  forward | for): key(alt-down)

#_________________________

(comment |  uncomment) that: key(cmd-/)

collapse search results:
    key(cmd-shift-p)
    sleep(100ms)
    insert("search collapse all")
    sleep(100ms)
    key(enter)

clear search results:
    key(cmd-shift-p)
    sleep(100ms)
    insert("search clear results")
    sleep(100ms)
    key(enter)


hyperkey-token:             insert("cmd-ctrl-alt-shift-")

bar extension:              key(shift-cmd-x)

#bookmarkschoose


(toggle | show | hide | go view) (bookmarks | links) [(bar | panel | view)]: key(cmd-ctrl-alt-shift-b)

((toggle | create | add) [line] bookmark) | bookmark (that | line) | (remove | delete) bookmark: key(cmd-alt-k)

bookmark (that | line) (name | named): key(cmd-alt-ctrl-k)

bookmark (that | line) <user.text>:
    key(cmd-alt-ctrl-k)
    insert(text)
    sleep(300ms)
    key(enter)

rename bookmark:
    mouse_click(1)
    sleep(300ms)
    key(down)
    key(enter)

rename bookmark [<user.text>]:
    mouse_click(1)
    sleep(300ms)
    key(down)
    key(enter)
    insert(text)
    sleep(300ms)
    key(enter)

copy bookmark name:
    mouse_click(1)
    sleep(300ms)
    key(down)
    key(enter)
    key(cmd-c)
    key(esc)

(search bookmarks | bookmarks list) [<user.text>]:
    key(cmd-shift-p)
    insert("bookmarks list")
    key(enter)
    sleep(300ms)
    insert(text)

(search all bookmarks | all bookmarks list) [<user.text>]:
    key(cmd-shift-p)
    insert("bookmarks list from all files  ")
    key(enter)
    sleep(300ms)
    insert(text)

#open copied bookmark
open bookmark [(text | name)]:
    key(cmd-shift-p)
    insert("bookmarks list from all files  ")
    key(enter)
    sleep(300ms)
    key(cmd-v)
    sleep(300ms)
    key(enter)

focus (bookmarks | links) [(bar | panel | view)]:
    key(cmd-shift-p)
    insert("bookmarks focus on explorer view")
    key(enter)

[go] next bookmark:         key(cmd-alt-l)
[go] (previous | prev | last) bookmark: key(cmd-alt-j)

copy line link:
    key(cmd-shift-p)
    insert("copy link to line")
    key(enter)

[(show | view | bar)] projects:
    key(cmd-shift-p)
    insert(" project manager: focus on favorites view")
    key(enter)

[(show | view | bar)] favorites:
    key(cmd-shift-p)
    insert("view: show favorites")
    key(enter)

(focus | go) favorites [(panel | bar)]:
    key(cmd-shift-p)
    insert("favorites: focus on favorites view")
    key(enter)
    
[bar] (explore |explorer) (focus | go) favorites:
    key(cmd-shift-p)
    insert("explorer: focus on favorites view")
    key(enter)
    


#cursorless 






