app.name: Roam Research 
mode: command
-

dedent: key(shift-tab)
indent less: key(shift-tab)

## ++++++++++++++++++++++++ copy block 

copy block:
    key(esc)
    sleep(100ms)
    key(cmd-c)

## ++++++++++++++++++++++++ kill block .

# only for use when cursor is inside block
(delete | kill | remove | chuck) [whole] block | block delete: 
    # key(cmd-backspace)
    key(esc)
    key(delete)
    sleep(100ms)
    key(down)

# kill highlighted block(s)
((delete | kill | remove | chuck) [(highlighted | selected | these)] [(multiple | multi)] blocks)| (delete | kill | remove | chuck) (highlighted | selected) block: 
    key(delete)


## ++++++++++++++++++++++++ cut blocks .
(cut | carve) block: 
    key(esc)
    sleep(100ms)
    key(cmd-x)


#make unlimited todo
(block | move) (all [(the way | way)] (out | left | back) | top level | base | wayback ): 
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)

## ++++++++++++++++++++++++ new blocks .

## ++++++++++ new block on top of page .

#not behaving consistently, assign keyboard shortcuts    
(insert | new) top block:
    key(cmd-p)
    sleep(200ms)
    user.paste("wb jump to top of page")
    sleep(200ms)
    key(enter)
    sleep(200ms)
    key(esc)
    sleep(200ms)
    key(right)
    sleep(300ms)
    key(cmd-p)
    sleep(200ms)
    user.paste("Insert block above")
    sleep(300ms)
    key(esc)
    sleep(200ms)
    key(right)
    

## +++++++++++++++++++ new block below .

(paste | pace) [new] (block | blocks) [below]:
    key(cmd-shift-k)
    sleep(700ms)
    key(cmd-v)
    sleep(100ms)
    key(esc)

(paste | pace) [new] block [below] raw:
    key(cmd-shift-k)
    sleep(700ms)
    key(shift-cmd-v)
    sleep(200ms)
    key(esc)

## +++++++++++++++++ new child block .

(insert | new | add | put) (child | kid | (right | write) | write) [block] | (child | kid | (right | write) | write) block | nuchal:
    key(cmd-a)
    sleep(100ms)
    key(right)
    sleep(100ms)
    key(enter)
    sleep(100ms)
    key(tab)

# pasting children

(insert | new | add | put) (child | kid | (right | write) ) [block] (paste | pace) | (paste | pace) (child | kid | (right | write) | nuchal) [block]:
    key(cmd-a)
    sleep(100ms)
    key(right)
    sleep(100ms)
    key(enter)
    key(tab)
    sleep(100ms)
    edit.paste()

paste [new] (child | kid) [block]:
    key(cmd-a)
    sleep(100ms)
    key(right)
    sleep(100ms)
    key(enter)
    sleep(100ms)
    key(tab)
    key(cmd-v)
    sleep(100ms)
    key(esc)

paste (child | kid) [block] raw:
    key(cmd-a)
    sleep(100ms)
    key(right)
    sleep(100ms)
    key(enter)
    sleep(100ms)
    key(tab)
    key(cmd-shift-v)


## +++++++ making a block a child of another block .

# make current block a child of block below
block [make] (child | kid) [of] below [block] | kiddo bela:
    key(cmd-shift-down)
    sleep(200ms)
    key(tab)

# make block below a child of current block
[make] below [block] (child | kid) | (slurp | slur) (block | below [block]):
    key(esc)
    sleep(100ms)
    key(down)
    sleep(100ms)
    key(tab)
    sleep(100ms)
    key(tab)
    sleep(100ms)
    key(tab)
    sleep(100ms)
    key(tab)

#only works on top level
# move block below (outside for current nesting level) below current (nested) block... (match indentation)
slurp [( block | below block )] [left] ([to] peer):
    key(esc)
    sleep(100ms)
    key(down)
    sleep(100ms)
    key(tab)
    sleep(100ms)
    key(cmd-up)


 ## ++++++++++++++++++++ new block .

## +++++++++++++ # Insert block above, .
[(new | insert)] block (up | above): key(cmd-shift-i)

## +++++++++++++ # Insert block below, .

# skips  take here   
[(new | insert)] block [(down | below)]: key(cmd-shift-k)

## ++++++++++++ block back .

new block back: 
    # key(cmd-shift-k)
    # sleep(300ms)
    # key(down)
    key(cmd-a)
    sleep(50ms)
    key(right)
    key(enter)
    sleep(50ms)
    key(shift-tab)

new block way back: 
    # key(cmd-shift-k)
    # sleep(300ms)
    # key(down)
    key(cmd-a)
    sleep(50ms)
    key(right)
    key(enter)
    sleep(50ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)

#todo: copy implementation from block all the way back
new base block:
    key(cmd-a)
    sleep(100ms)
    key(right)
    sleep(100ms)
    key(enter)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)

    
#todo use new block down instead of going to end and enter in all of these commends

## ++++++++++++++++++++++++++++ split/break block .
#todo is this the same as split..?
nest here:
    key(enter)
    sleep(100ms)
    key(tab escape:2)

(split | break) here [block] : 
    key(enter)

(split | break | brick | brack) [point] : 
    mouse_click(0)
    user.mouse_drag_end()
    sleep(200ms)
    key(enter)

# mouse_click(0)
# # close the mouse grid if open
# user.grid_close()
# # End any open drags
# # Touch automatically ends left drags so this is for right drags specifically
# user.mouse_drag_end()
# sleep(100ms)
      

(split | break) (child | (right | write) | rate | [and] nest) [block] [point]: 
    mouse_click(0)
    user.mouse_drag_end()
    sleep(500ms)
    key(enter)
    sleep(100ms)
    key(tab)
    key(escape:2)

(split | break) (child | (right | write) | rate | [and] nest) [block] here: 
    key(enter)
    sleep(300ms)
    key(tab)
    key(escape)

(split | break) [block] (back  | left) [point]: 
    mouse_click(0)
    user.mouse_drag_end()
    sleep(200ms)
    key(enter)
    sleep(100ms)
    key(shift-tab)
    key(escape:2)

(split | break) [block] (back  | left)  here: 
    key(enter)
    sleep(100ms)
    key(shift-tab)
    key(escape)

    
(split | break) [and] (stack | top) [block] [here]: 
    key(shift-end)
    sleep(300ms)
    key(cmd-x)
    sleep(300ms)
    key(enter)
    sleep(300ms)
    key(shift-cmd-v)
    sleep(300ms)
    key(escape)
    # key(enter)
    # sleep(100ms)
    # key(tab)
    # key(down)
    # key(shift-tab)