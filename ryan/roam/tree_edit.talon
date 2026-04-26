app.name: Roam Research 
mode: command
-
# settings():
#     speech.timeout = 1.550  

timout test: 
    # user.setting()
    print("one")
    print("two")

## ++++++++++++++++++++++++ move current block on page 

# (block | move) up: 
#     user.roam_block_up(1)

# (block | move) down: 
#     user.roam_block_down(1)

# (block | move) (in | (right | write | rate) | forward | fore | four): 
#     user.roam_block_forward(1)

# (block | move) (out | left | back) | dedent | indent less: 
#     user.roam_block_back(1)


#make unlimited todo
(block | move) (all [(the way | way)] (out | left | back) | top level | base | wayback ): 
    user.roam_block_back(4)

## ++++++++++++++++++++++ select block .

select block: 
    user.roam_select_block()

## ++++++++++++++++++++++++ copy block 

copy block:
    user.roam_select_block()
    key(cmd-c)

## ++++++++++++++++++++++++ kill block .

# only for use when cursor is inside block
(delete | kill | remove | chuck) [whole] (block | line ) | block delete: 
    # doesnt keep focus
    # key(cmd-backspace) 
    user.roam_select_block()
    key(delete)
    key(down)

# kill highlighted block(s)
((delete | kill | remove | chuck) [(highlighted | selected | these)] [(multiple | multi)] blocks): 
    key(delete)


## ++++++++++++++++++++++++ cut blocks .
(cut | carve) block [here]: 
    user.roam_select_block()
    edit.cut()

## ++++++++++++++++++++++++ new (empty) blocks (PHASE E composable) .
## All 12 spoken forms route through user.roam_action_dest("insertNewBlock", dest).
## Each spoken form constructs the destination AST inline; bridge.clj's
## insertNewBlock dispatch handles parent-uid + order resolution uniformly.

# to top/bottom of current page (cursor → containing page → position start|end)
(insert | new) top block $:
    user.roam_insert_cursor_scope("page", "start")

(insert | new) bottom block $:
    user.roam_insert_cursor_scope("page", "end")

# to top/bottom of current parent block (sibling-style)
(insert | new) (block here [(top | first)] | first child) $:
    user.roam_insert_cursor_scope("parent", "start")

(insert | new) (block here (bottom | last) | last child) $:
    user.roam_insert_cursor_scope("parent", "end")

# before/after target block (sibling insertion)
(insert | new) block (above | before | pre) <user.letters>:
    user.roam_insert_before_label(letters)

(insert | new) block (below | after | post) <user.letters>:
    user.roam_insert_after_label(letters)

# to top/bottom child of labeled block
(insert | new) ([top] block [in] | [first] child [block] [first] [in]) <user.letters>:
    user.roam_insert_child_of_label(letters, "start")

(insert | new) (bottom block [in] | last child [block] [in] | child last) <user.letters>:
    user.roam_insert_child_of_label(letters, "end")

# to top/bottom of specified page
(insert | new) top block {user.roam_tag}:
    user.roam_insert_child_of_page(roam_tag, "start")

(insert | new) bottom block {user.roam_tag}:
    user.roam_insert_child_of_page(roam_tag, "end")

# to top/bottom child of ref UID
(insert | new) top (block | child) {user.roam_ref}:
    user.roam_insert_child_of_uid(roam_ref, "start")

(insert | new) bottom (block | child) {user.roam_ref}:
    user.roam_insert_child_of_uid(roam_ref, "end")

## +++++++++++++++++++ paste block below .

(paste | pace) [new] [(block | blocks)] below:
    user.roam_new_block_below()
    edit.paste()
    # sleep(100ms)
    # key(esc)

(paste | pace) [new] [(block | blocks)] below raw:
    user.roam_new_block_below()
    user.paste_without_formatting()
    # sleep(200ms)
    # key(esc)

## +++++++++++++ # new block above, .

((new | insert) block [(up | above)] | block above) $: 
    user.roam_new_block_above()

((new | insert) block [(up | above)] | block above) with <user.text>: 
    user.roam_new_block_above()
    insert(text)

(paste | paste) block [(up | above)]: 
    user.roam_new_block_above()
    edit.paste()

(paste | paste) block [(up | above)] raw: 
    user.roam_new_block_above()
    user.paste_without_formatting()


## +++++++++++++ # new block below, .

# skips  take here   
(new | insert) block [(down | below)] | block below: 
    user.roam_new_block_below()

((new | insert) block [(down | below)] | block below) <user.text>: 
    user.roam_new_block_below()
    insert(text)

## ++++++++++++ new block back .

new block back: 
    user.roam_new_block_direct_below()
    user.roam_block_back(1)

new block way back: 
    user.roam_new_block_direct_below()
    user.roam_block_back(8)

new base block:
    user.roam_new_block_direct_below()
    user.roam_block_back(4)
    
#todo use new block down instead of going to end and enter in all of these commends

## +++++++++++++++++ new child block .

(insert | (new | you) | add | put) (child | kid | (right | write) | write) [block] | (child | kid | (right | write) | write) block | nuchal:
    user.roam_new_child_block()

(insert | (new | you) | add | put) (child | kid | (right | write) | write) [block] | (child | kid | (right | write) | write) block | nuchal <user.text>:
    user.roam_go_block_end()
    user.roam_break_block()
    insert(text) 
    user.roam_block_forward(1)

# pasting children

(insert | (new | you) | add | put) ((child | chow) | kid | (right | write)) [block] (paste | pace) | (paste | pace) (child | ((child | chow) | kid | (right | write)) kid | (right | write) | nuchal) [block]:
    user.roam_new_child_block()
    edit.paste()

# paste [new] (child | kid) [block]:
#     user.roam_new_child_block()
#     key(cmd-v)
#     sleep(100ms)
#     key(esc)

paste (child | ((child | chow) | kid | (right | write)) kid | (right | write) | nuchal) [block] raw:
    user.roam_new_child_block()
    user.paste_without_formatting()

## +++++++ making a block a child of another block .

# make current block a child of block below
block [make] (child | kid) [of] below [block] | kiddo bela:
    user.roam_block_down(1)
    sleep(200ms)
    user.roam_block_forward(1)

# make block below a child of current block
[make] below [block] (child | kid) | (slurp | slur) (block | below [block]):
    user.roam_select_block_below()
    user.roam_block_forward(5)

#only works on top level
# move block below (outside for current nesting level) below current (nested) block... (match indentation)
slurp [( block | below block )] [left] ([to] peer):
    user.roam_select_block_below()
    user.roam_block_forward(1)
    # user.roam_block_up(1)


## ++++++++++++++++++++++++++++ split/break block .
#todo is this the same as split..?
nest here:
    user.roam_break_block()
    user.roam_block_forward(1)
    key(escape:2)

(split | break) here [block] : 
    #user.roam_break_block()
    key(enter)

(split | break | brick | brack) [point] : 
    user.roam_click_block()
    #user.roam_break_block()
    key(enter)

# mouse_click(0)
# # close the mouse grid if open
# user.grid_close()
# # End any open drags
# # Touch automatically ends left drags so this is for right drags specifically
# user.mouse_drag_end()
# sleep(100ms)
      
(split | break) (child | (right | write) | rate | [and] nest) [block] [point]: 
    user.roam_click_block()
    user.roam_break_block()
    user.roam_block_forward(1)
    key(escape:2)

(split | break) (child | (right | write) | rate | [and] nest) [block] here: 
    user.roam_break_block()
    user.roam_block_forward(1)
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
    user.roam_cut_block_end()
    user.roam_break_block()
    user.paste_without_formatting()
    sleep(300ms)
    key(escape)