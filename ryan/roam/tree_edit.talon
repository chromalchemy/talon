app.name: Roam Research 
mode: command
-
# settings():
#     speech.timeout = 1.550  

timout test: 
    # user.setting()
    print("one")
    print("two")

dedent: user.roam_block_back(1)
indent less: user.roam_block_back(1)

select block: 
    user.roam_select_block()

## ++++++++++++++++++++++++ copy block 

copy block:
    user.roam_select_block()
    key(cmd-c)

## ++++++++++++++++++++++++ kill block .

# only for use when cursor is inside block
(delete | kill | remove | chuck) [whole] block | block delete: 
    # doesnt keep focus
    # key(cmd-backspace) 
    user.roam_select_block()
    key(delete)
    key(down)

# kill highlighted block(s)
((delete | kill | remove | chuck) [(highlighted | selected | these)] [(multiple | multi)] blocks): 
    key(delete)


## ++++++++++++++++++++++++ cut blocks .
(cut | carve) block: 
    user.roam_select_block()
    key(cmd-x)


#make unlimited todo
(block | move) (all [(the way | way)] (out | left | back) | top level | base | wayback ): 
    user.roam_block_back()
    user.roam_block_back()
    user.roam_block_back()
    user.roam_block_back(1)

## ++++++++++++++++++++++++ new blocks .

## ++++++++++ new block on top of page .

#not behaving consistently, assign keyboard shortcuts    
(insert | new) top block:
    # user.run_roam_command("wb jump to top of page")
    key(cmd-shift-t)
    sleep(700ms)
    key(cmd-shift-i)
   

## +++++++++++++++++++ paste block below .

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
    user.roam_new_child_block()

(insert | new | add | put) (child | kid | (right | write) | write) [block] | (child | kid | (right | write) | write) block | nuchal <user.text>:
    use.roam_go_block_end()
    user.roam_break_block()
    insert(text) 
    user.roam_block_forward(1)

# pasting children

(insert | new | add | put) (child | kid | (right | write) ) [block] (paste | pace) | (paste | pace) (child | kid | (right | write) | nuchal) [block]:
    user.roam_new_child_block()
    edit.paste()

# paste [new] (child | kid) [block]:
#     user.roam_new_child_block()
#     key(cmd-v)
#     sleep(100ms)
#     key(esc)

paste (child | kid) [block] raw:
    user.roam_new_child_block()
    key(cmd-shift-v)


## +++++++ making a block a child of another block .

# make current block a child of block below
block [make] (child | kid) [of] below [block] | kiddo bela:
    key(cmd-shift-down)
    sleep(200ms)
    user.roam_block_forward(1)

# make block below a child of current block
[make] below [block] (child | kid) | (slurp | slur) (block | below [block]):
    user.roam_select_block_below()
    user.roam_block_forward(4)
#only works on top level
# move block below (outside for current nesting level) below current (nested) block... (match indentation)
slurp [( block | below block )] [left] ([to] peer):
    user.roam_select_block_below()
    user.roam_block_forward(1)
    key(cmd-up)


 ## ++++++++++++++++++++ new block .

## +++++++++++++ # new block above, .

[(new | insert)] block (up | above): 
    key(cmd-shift-i)

[(new | insert)] block (up | above) <user.text>: 
    key(cmd-shift-i)
    sleep(700ms)
    insert(text)

## +++++++++++++ # new block below, .

# skips  take here   
[(new | insert)] block [(down | below)]: 
    key(cmd-shift-k)

[(new | insert)] [block] [(down | below)] <user.text>: 
    key(cmd-shift-k)
    sleep(700ms)
    insert(text)

## ++++++++++++ new block back .

new block back: 
    # key(cmd-shift-k)
    # sleep(300ms)
    # key(down)
    key(cmd-a)
    sleep(50ms)
    key(right)
    key(enter)
    sleep(50ms)
    user.roam_block_back(1)

new block way back: 
    # key(cmd-shift-k)
    # sleep(300ms)
    # key(down)
    user.roam_new_child_block()
    user.roam_block_back(8)

#todo: copy implementation from block all the way back
new base block:
    use.roam_go_block_end()
    key(enter)
    user.roam_block_back(4)
    
#todo use new block down instead of going to end and enter in all of these commends

## ++++++++++++++++++++++++++++ split/break block .
#todo is this the same as split..?
nest here:
    user.roam_break_block()
    user.roam_block_forward(1)
    key(escape:2)

(split | break) here [block] : 
    key(enter)

(split | break | brick | brack) [point] : 
    user.roam_click_block()
    key(enter)

# mouse_click(0)
# # close the mouse grid if open
# user.grid_close()
# # End any open drags
# # Touch automatically ends left drags so this is for right drags specifically
# user.mouse_drag_end()
# sleep(100ms)
      
(split | break) (child | (right | write) | rate | [and] nest) [block] [point]: 
    roam_click_block()
    user.roam_break_block()
    user.roam_block_forward(1)
    key(escape:2)

(split | break) (child | (right | write) | rate | [and] nest) [block] here: 
    roam_break_block()
    user.roam_block_forward()
    key(escape)

(split | break) [block] (back  | left) [point]: 
    user.roam_click_block()
    user.roam_break_block()
    user.roam_block_back(1)
    key(escape:2)

(split | break) [block] (back  | left)  here: 
    user.roam_break_block()
    user.roam_block_back(1)
    key(escape)

(split | break) [and] (stack | top) [block] [here]: 
    user.roam_select_block_end()
    sleep(300ms)
    edit.cut()
    sleep(300ms)
    user.roam_break_block()
    key(shift-cmd-v)
    sleep(300ms)
    key(escape)
    # key(enter)
    # sleep(100ms)
    # key(tab)
    # key(down)
    # user.roam_block_back(1)