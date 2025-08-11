app: chrome
-

go {user.ryan.browser.devtools.list} [panel]:
    user.chrome_devtools_command("{user.ryan.browser.devtools.list}")
    #print("{user.ryan.browser.devtools.list}")
    

(toggle | hide | show | open | close | bar) (devtools | dev tools | tools) |  panel | (devtools | dev tools):
    key(cmd-alt-i)

# panel position
tools [(dock | snap)] (sidebar | bar | panel | bottom | right | last | next): 
    key(cmd-shift-d)

(toggle | hide | show | open | close) drawer: 
    key(esc)

## ++++++++++++++++++++++++++++ reload .

reload [page]: 
    key(cmd-r)

hard reload [page]: 
    key(cmd-shift-r)

## ++++++++++++++++++++++++++++ search .

(search | hunt) (tools | [tools] panel) [<user.text>]: 
    key(cmd-f)
    sleep(200ms)
    edit.paste("{text}")
    sleep(100ms)
    
(search | hunt) (tools | [tools] panel) paste: 
    key(cmd-f)
    sleep(200ms)
    edit.paste()
    
(search | hunt) drawer:
    key(cmd-alt-f)

## +++++++++++++++++++++++++++ sources .

(open | reveal) [file] (in sources | source):
    key(cmd-0)

tools [zoom] in: 
    key(cmd-shift-=)
tools [zoom] out: 
    key(cmd--)

(default | reset) zoom | zoom (default | reset):
    key(cmd-0)

## +++++++++++++++++++++ command popup .

please [<user.text>]:
    key(cmd-shift-p)
    sleep(200ms)
    insert("{text}")

## +++++++++++++++++++++++++ panel nav .


next panel: 
    key(cmd-])

(previous | last) panel: 
    key(cmd-[)

## ++++++++++++++++++++ device preview .

toggle device mode:
    key(cmd-shift-m)

## +++++++++++++++++++++++++ inspector .

(show | open | close | bar | stop | toggle) (inspector | inspect | inspecting | elements) | inspect (page | elements): 
    key(cmd-shift-c)
    #     user.menu_select('View|Developer|Inspect Elements')
    
inspect [(here | element)]: 
    mouse_click(1)
    sleep(100ms)
    insert("inspect")
    key(enter)
    
## +++++++++++++++++++++++++++ console .

clear console: 
    key(cmd-k)

go console [in] [drawer]:
    key(ctrl-`)

(toggle | hide | show | open | close  | bar) [(javascript | js)] console: 
    key(cmd-alt-j)

view source: 
    key(cmd-alt-u)
