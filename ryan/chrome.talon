app: chrome
-
tag(): browser
# tag(): user.tabs

#### inspector

(toggle | hide | show | open | close) (devtools | dev tools | tools): 
    key(cmd-alt-i)

(toggle | hide | show | open | close) console: key(cmd-alt-j)

tools [dock] (sidebar | bar | panel | bottom | right | last | next): key(cmd-shift-d)

## ++++++++++++++++++++++++++ bookmarks .

[go] (bookmarks | bookmark | marks) (browser | view | page): 
    key(cmd-alt-b)

(toggle | hide | show) (bookmarks | bookmark | marks) bar: 
    key(cmd-shift-b)

(search | hunt)  (bookmarks | bookmark | marks) [<user.text>]:
    key(cmd-l)
    sleep(100ms)
    insert("@bookmarks {text or ''}")

(choose | pick) <number_small>: 
    key("down:{number_small}")
    sleep(200ms)
    key(enter)

## +++++++++++++ click to select, then...

copy  (link | address | url) (point | here)$:
    mouse_click(1)
    sleep(100ms)
    insert("copy link address")
    # sleep(100ms)
    key(enter)  

## ++++++++++++++++++++++++++++++ zoom .

zoom (default  | normal) | reset zoom: key(cmd-0)

## ++++++++++++++++++++++++++++ search .

# use rango
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

## ++++++++++++++++++ search open tabs .

(search | hunt) (tabs | open tabs | open) [<user.text>]:
    key(cmd-shift-a)
    sleep(300ms) 
    insert("{text}")

go [(tabs | open tabs | open)] <user.text>:
    key(cmd-shift-a)
    sleep(200ms) 
    insert("{text}")
    sleep(100ms)
    key(enter)

([go] other | swap) profile [(window | win)]: 
    key(cmd-shift-m)
    sleep(100ms)
    key(down enter)