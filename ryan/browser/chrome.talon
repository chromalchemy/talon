app: chrome
-
# see also community/chrome.talon 

settings():
    user.mouse_continuous_scroll_amount = 10

settings():
    user.mouse_continuous_scroll_frequency = 16

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
    # key(enter)

## +++++++++++++ pop context menu, then select command

copy  (link | address | url) (point | here)$:
    mouse_click(1)
    sleep(200ms)
    insert("copy link address")
    key(enter)  

copy image (point | here)$:
    mouse_click(1)
    sleep(100ms)
    insert("copy image")
    key(enter)  

copy image address [(point | here)]:
    mouse_click(1)
    sleep(100ms)
    insert("copy image address")
    key(enter)  
    

[(toggle | start | stop | turn on | turn off | turnoff)] page (dark | light) (mode | mod): 
    key(alt-shift-d)

## ++++++++++++++++++++++++++++++ zoom .

zoom (default  | normal) | reset zoom: key(cmd-0)

## ++++++++++++++++++++++++++++ search (google).

# use rango
search <user.text>: 
    browser.focus_search()
    insert(text)

search force <user.text>: 
    browser.focus_search()
    insert(text)
    sleep(100ms)
    key(enter)

### search web using text on page

(hunt | search) (this | that | text):
    mouse_click(1)
    insert("Search Google for")
    sleep(200ms)
    key(enter)

(hunt | search) point:
    key(shift:down)
    mouse_click(0)
    mouse_click(1)
    insert("Search Google for")
    sleep(200ms)
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

## +++++++++++++++++++++++++ move (rearrange) tabs . 

tab left: 
    key(shift-ctrl-pageup)
tab right: 
    key(fn-shift-ctrl-pagedown)

## ++++++++++++++++++ search open tabs .

(search | hunt) (tabs | open tabs | open) [<user.text>]:
    key(cmd-shift-a)
    sleep(300ms) 
    insert("{text}")

go (tabs | open tabs | open) <user.text>:
    key(cmd-shift-a)
    sleep(200ms) 
    insert("{text}")
    sleep(100ms)
    key(enter)

## ++++++++++++++++++++ change profile .

go (my | ryan | personal) (profile | browser | browse | brass) | browse (ryan | personal): 
    user.menu_select('Profiles|ryan')
    
go (get bit | gb | getbit | work ) (profile | browser | browse | brass) | browse (get bit | gb | getbit | work ):
    user.menu_select('Profiles|Ryan (ryan@getbitoutdoors.com)')

pick profile: 
    user.chrome_mod("shift-m")

# ([go] other | swap) profile [(window | win)]:
#     user.chrome_mod("shift-m") 
#     sleep(100ms)
#     key(down enter)

## +++++++++++++++++ find text on page .

(search | hunt | find) [on] page [<user.text>]: 
    key(cmd-f)
    sleep(200ms)
    insert(text or "")

hunt next: 
    key(enter)
    
hunt last: 
    key(shift-enter)

exit hunt | hunt (exit | close):
    key(esc)


tab split right: 
    user.snap_window("LEFT")
    # user.rango_move_tab_to_new_window()
    # sleep(500ms)
    # user.snap_window("RIGHT")

## +++ load and search browser history .

(go  | show | search  | hunt) history [<user.text>]: 
    browser.show_history()
    sleep(300ms)
    insert(text)

(go  | show | search  | hunt) history (grouped  | groups) [<user.text>]: 
    browser.go("chrome://history/grouped")
    sleep(300ms)
    insert(text)

## ++++++++++++++++++ open closed tabs .
(open | reopen) [last] (closed | close) tab | tab reopen:
    key(cmd-shift-t)

