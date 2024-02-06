app: chrome
-
tag(): browser

#### inspector

(toggle | hide | show | open | close) (devtools | dev tools | tools): key(cmd-alt-i)

(toggle | hide | show | open | close) console: key(cmd-alt-j)

tools [dock] (sidebar | bar | panel | bottom | right | last | next): key(cmd-shift-d)

##

go (bookmarks | marks): browser.bookmarks()

(toggle | hide | show) bookmarks: browser.bookmarks_bar()

#Doesn't work in search bar
(choose | pick | hello) <user.number>: 
    # key(down:{number})
    insert("hello")

search (bookmarks | bookmark | marks) [<user.text>]:
    key(cmd-l)
    sleep(100ms)
    insert("@bookmarks")
    key(space)
    sleep(100ms)
    insert(text)


copy  (link | address | url) (point | here)$:
    mouse_click(1)
    sleep(100ms)
    insert("copy link address")
    # sleep(100ms)
    key(enter)  


zoom (default  | normal) | reset zoom: key(cmd-0)

search <user.text>: 
    browser.focus_search()
    insert(text)

search force <user.text>: 
    browser.focus_search()
    insert(text)
    sleep(100ms)
    key(enter)

    


## ++++++++++ copy web page address to roam .

(notes | note | no to | not to | don't | roam | rome) capture address | (copy | send) address [to] notes:
    browser.focus_address()
    sleep(50ms)
    edit.copy()
    key(cmd-ctrl-alt-shift-;)
    sleep(200ms)
    edit.paste()
    sleep(100ms)
    key(cmd-enter)
    sleep(100ms)
    key(escape)