app.name: Roam Research 
-

tag(): user.line_commands
# tag(): user.roam

####################


# todo: setup defualt timeout
    
please [<user.text>]: 
    key(cmd-p)
    sleep(200ms)
    insert(text)

## +++++++++++++++++++++ open settings .

^workbench settings$: 
    key(cmd-p)
    sleep(200ms)
    insert("settings workbench")
    key(enter)

^(tag (icons | icon) | magic (tag | tags)) settings$: 
    key(cmd-p)
    sleep(200ms)
    insert("magic tags")
    key(enter)

#------------------left sidebar

(toggle | hide |  show) ( shortcuts |  (left | l) sidebar | bookmarks): key(cmd-\)

#------------------not working
add (shortcut | bookmark): 
    key(cmd-p)
    sleep(100ms)
    insert("wb add shortcut")
    sleep(100ms)
    key(enter)

#----------------- embed block

embed (block | ref | reference):
    insert("/embed")
    sleep(100ms)
    key(enter)
    sleep(100ms)
    key(right:2 backspace:4)
    edit.paste()
    sleep(100ms)
    key(esc)

#embed block/page children only

#todo: Make versions that queue up we search for the block or or page, rather than pasting it
embed (block | black | ref | reference) (children | kids):
    key({:2)
    insert("embed-children: ")
    sleep(300ms)
    edit.paste()
    sleep(100ms)
    key(esc)

# ----------- block/page mentions

(paste | embed | insert) (block | black | ref | reference) (mentions | links):
    key({:2)
    insert("children-mentions: ")
    sleep(300ms)
    edit.paste()
    sleep(100ms)
    key(esc)

(embed | insert) (block | black | ref | reference) (mentions | links) [from] page [<user.text>]:
    key({:2)
    insert("children-mentions: ")
    sleep(300ms)
    key([:2)
    sleep(100ms)
    insert(text)

(embed | insert) (block | black | ref | reference) (mentions | links) [from] block [<user.text>]:
    key({:2)
    insert("children-mentions: ")
    sleep(300ms)
    key((:2)
    sleep(100ms)
    insert(text)

    ###-------- alternative implementation
    # edit.paste()
    # sleep(300ms)
    # key(cmd-a)
    # sleep(300ms)
    # refstr = edit.selected_text()
    # firsthalf = "{{[[embed]]: " + refstr
    # fullembed = firsthalf + "}}"
    # insert(fullembed)
    # sleep(300ms)
    # key(cmd-a)
    # sleep(300ms)
    # key({)
    # sleep(300ms)
    # key(esc)

## +++++++++++++++++++++++ Swap blocks .

^(replace | swap) (ref | reference) [with original]: 
    key(cmd-p)
    sleep(100ms)
    insert("wb replace last reference before cursor with original")
    sleep(100ms)
    key(enter)

^(replace | swap) (ref | reference) [with] alias: 
    key(cmd-p)
    sleep(100ms)
    insert("wb replace last reference before cursor with text and alias")
    sleep(100ms)
    key(enter)


#navigation

go all pages: 
    key(cmd-p)
    sleep(100ms)
    insert("wb all pages")
    sleep(100ms)
    key(enter)

go [page] top: 
    key(cmd-p)
    sleep(100ms)
    insert("jump top")
    sleep(100ms)
    key(enter)

go [page] bottom: 
    key(cmd-p)
    sleep(100ms)
    insert("jump bottom")
    sleep(100ms)
    key(enter)

go today:  key(ctrl-shift-d)
go tomorrow: key(ctrl-alt-n)
go next day:  key(ctrl-alt-n)
go (prev | previous | last | yesterday) day:  key(ctrl-alt-p)

go back:  key(cmd-[)
go (forward | fore):  key(cmd-])

jump link: key(ctrl-o)

page blocks [panel]: key(cmd-shift-p)
page (refs | references) [panel]: 
    key(cmd-shift-p)
    sleep(500ms)
    insert("@")

zoom (block  | down): key(cmd-.)
zoom (parent |  up): key(cmd-shift-ctrl-alt-u)

go parent [block]: key(ctrl-alt-u)
    # key(cmd-p)
    # sleep(200ms)
    # insert("go to parent block")
    # sleep(200ms)
    # key(enter)
    
deep nav:key(alt-g)

###sidebar

(toggle | hide | show | close | open) (sidebar | side bar) :
    key(cmd-/)

swap (sidebar | main) [with (sidebar | main)]:
    key(cmd-p)
    sleep(100ms)
    insert("wb sidebars - swap with main window (swap)")
    sleep(100ms)
    key(enter)  

(expand | collapse [all] | fold) (sidebar | side bar):
    key(cmd-p)
    sleep(100ms)
    insert("toggle expand sidebar")
    sleep(100ms)
    key(enter)  

#switch+ sidebar
(sidebar |  side bar) panel: 
    key(cmd-shift-p)
    sleep(500ms)
    insert("r:")

open (ref | reference | link) in sidebar: 
    key(ctrl-shift-o)

open [this] page in sidebar: 
    key(cmd-p)
    sleep(100ms)
    insert("wb open page in sidebar")
    sleep(100ms)
    key(enter)

(clear | kill) sidebar: key(ctrl-l)

open <user.one_roam_tag> in sidebar | bar <user.one_roam_tag>:
    key(cmd-u)
    # sleep(100ms)
    insert("{one_roam_tag}")
    sleep(500ms)
    key(shift-enter)

###roam prefs

open hotkeys: 
    key(cmd-p)
    sleep(100ms)
    insert("hotkeys")
    sleep(100ms)
    key(enter)

 ## +++++++++++++++++++++++++++ roam queries .

#native roam query
# {{[[query]]: {and: [[ex-A]] {or: [[ex-B]] [[ex-C]]}}}}

#query builder
Open query (drawer | builder): key(cmd-shift-ctrl-alt-8)

# open query drawer

## +++++++++++++++++++ Searching 

#search

#top bar search

#top quick search 
search [<user.text>]:
    key(cmd-u)
    sleep(200ms)
    insert(text)
    
#traditional page search
search page: key(cmd-f)
exit search: key(cmd-enter)

#search+
search advanced: key(ctrl-shift-p)

#native block ref search
search block refs: key(ctrl-shift-9)

#find and replace extension search page or workspace
search workspace: key(ctrl-s)
search (whole | entire) graph: 
    key(cmd-p)
    sleep(100ms)
    insert("wgs")
    sleep(300ms)
    key(enter)

    #search pages block
# new search block:
#     edit.select_all()
#     sleep(100ms)
#     key(right)
#     key(enter)
#     sleep(100ms)
#     insert("{{{[[search]]}}}")
    # sleep(100ms)
    # key(escape)



#roam portal search
(go | open | search | toggle | show | hide) portal: key(cmd-ctrl-alt-shift-p)

#search roam graph visualization

#block refs

copy [block] (ref | reference): key(cmd-shift-c)

# community dropdown cmd: drop up <number_small>: key("up:{number_small} enter")
# todo: turn this into proper ordinal
^(choose | pick) (<number_small> | that): 
    key("down:{number_small or 1}")
    key(enter)
    key(space)

^(choose | pick) <user.ordinals>: 
    key("down:{ordinals}")
    key(enter)
    key(space)
    

#block nav / editing

#set up ordinal versions, with defualt sleep timing

## ++++++++++++++++++++++++  block navigation

next block: key(ctrl-n)

#make unlimited todo
(block | move) (all [(the way | way)] (out | left | back) | top level | base | wayback ): 
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)

 ## +++++++++++++++++++++ block folding .

(fold | close | hide (children | kids)) block: key(cmd-up)
(unfold | open | show (children | kids)) block: key(cmd-down)

(collapse | fold) tree: 
    key(cmd-p)
    sleep(100ms)
    insert("collapse current block tree")
    sleep(100ms)
    key(enter)

#only exands one leve deep (not recursive)
expand block:
    key(cmd-p)
    sleep(100ms)
    insert("Expand current block tree")
    sleep(100ms)
    key(enter)
    
(collapse | fold) all [blocks]: 
    key(cmd-p)
    sleep(100ms)
    insert("collapse all blocks on page")
    sleep(100ms)
    key(enter)
    
(expand | unfold) all [blocks]: 
    key(cmd-p)
    sleep(100ms)
    insert("expand all blocks on page")
    sleep(100ms)
    key(enter)

#working kind of inconsistanly
#how to take a digit, do math on in, then use as key
(expand | fold) all [blocks] <number_small>: 
    mynumber = number_small + 1
    key(cmd-p)
    sleep(100ms)
    insert("wb expand/collapse block tree")
    sleep(100ms)
    key(enter)
    sleep(500ms)
    key("{mynumber}")

## +++++++++++++ navigate within block .

[go] (block end | post block): 
    key(cmd-a)
    sleep(100ms)
    key(right)   

(select | take) (block end | rest of block ):
    key(shift-end)

(clear | chuck) (block end | rest of block ):
    key(shift-end delete)

go block start: 
    key(shift-home left)
    # edit.select_all()
    # sleep(100ms)
    # key(left)

(select | take) block start:
    key(shift-home)

(clear | chuck) block start:
    key(shift-home delete)


## ++++++++++++++++++++++++ kill block .

# only for use when cursor is inside block
(delete | kill | remove) [whole] block | block delete: 
    key(cmd-backspace)
    # key(esc)
    # key(delete)

# kill highlighted block(s)
((delete | kill | remove) [(highlighted | selected | these)] [(multiple | multi)] blocks)| (delete | kill | remove) (highlighted | selected) block: 
    key(delete)


## ++++++++++++++++++++++++ cut blocks .
(cut | carve) block: 
    key(esc)
    sleep(100ms)
    key(cmd-x)

## +++++++++++++++++++++ select blocks .

multi select | multiselect |  select multi | exit multi:  key(cmd-m)

select all blocks: key(cmd-shift-a)


# Select the block above where the cursor is placed

# Shift
# Up
# Select the block below where the cursor is placed

# Shift
# Down
# Select all blocks

# Cmd
# Shift
# A

## ++++++++++++++++++++++++ new blocks .

## ++++++++++ new block on top of page .

#not behaving consistently, assign keyboard shortcuts    
(insert | new) top block:
    key(cmd-p)
    sleep(200ms)
    insert("wb jump to top of page")
    sleep(200ms)
    key(enter)
    sleep(200ms)
    key(esc)
    sleep(200ms)
    key(right)
    sleep(300ms)
    key(cmd-p)
    sleep(200ms)
    insert("Insert block above")
    sleep(300ms)
    key(esc)
    sleep(200ms)
    key(right)
    

## +++++++++++++++++++ new block below .

paste [new] (block | blocks):
    key(cmd-shift-k)
    sleep(700ms)
    key(cmd-v)
    sleep(100ms)
    key(esc)

paste [new] block raw:
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

 ## ++++++++++++++++++++ new block back .
    
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

## +++++++++++++ # Insert block above, .
[(new | insert)] block (up | above): key(cmd-shift-i)

## +++++++++++++ # Insert block below, .
# skips children   
[(new | insert)] block [(down | below)]: key(cmd-shift-k)
new block back: 
    key(cmd-shift-k)
    sleep(500ms)
    key(shift-tab)

#todo use new block down instead of going to end and enter in all of these commends

## ++++++++++++++++++++++++++++ split/break block .
#todo is this the same as split..?
nest here:
    key(enter)
    sleep(100ms)
    key(tab)
    key(escape)
    key(escape)

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
    sleep(200ms)
    key(enter)
    sleep(100ms)
    key(tab)
    key(escape:2)

(split | break) (child | (right | write) | rate | [and] nest) [block] here: 
    key(enter)
    sleep(100ms)
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

## ++++++++++++++++++++++++ copy block 

copy block:
    key(esc)
    sleep(100ms)
    key(cmd-c)

## ++++++++++++++++++++++ multi select .

[toggle] (multi select | select blocks) | select (multi | multiple) [blocks]: key(cmd-m)

## +++++++++++++++++++++ #move blocks .


## ++++++++++++++++++++++++ move block on page 

(block | move) up: key(cmd-shift-up)
(block | move) down: key(cmd-shift-down)
(block | move) (in | (right | write) | forward | fore | four): key(tab)
(block | move) (out | left | back): key(shift-tab)

## ++++++++++++++++ move block to DNP date (str)

#make versions that leave reference

move [(block | blocks)] to tomorrow: 
    key(cmd-d)
    sleep(100ms)
    key(tab enter)
    sleep(100ms)
    key(tab:2 enter)

#todo: why inserting at bottom
move [(block | blocks)] to today: 
    key(cmd-d)
    sleep(100ms)
    edit.select_all()
    sleep(100ms)
    key(delete)
    insert("Today")
    sleep(100ms)
    key(tab enter)
    sleep(100ms)
    key(tab:2 enter)

## ++++++++++++++++++++++ Move block to page .

# make version that leaves reference

move [(block | blocks)] to [top] [of] [page] (paste | pace | clip): 
    key(cmd-alt-m)
    sleep(1500ms)
    key(right)
    sleep(100ms)        
    edit.paste()
    sleep(200ms)        
    key(enter tab:2 enter)

move [(block | blocks)] to [top] [of] <user.one_roam_tag>: 
    key(cmd-alt-m)
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{one_roam_tag}")        
    sleep(200ms)        
    key(enter tab:2 enter)

[move] <user.letters> [move] (to | two) [top] [of] <user.one_roam_tag>:
    insert(letters)
    sleep(300ms) 
    key(cmd-alt-m)
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{one_roam_tag}")        
    sleep(200ms)        
    key(enter tab:2 enter)


move [(block | blocks)] to [top] [of] <user.one_roam_tag> sidebar:
    key(cmd-p)
    sleep(100ms)
    insert("mbts")
    sleep(100ms)
    key(enter) 
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{one_roam_tag}")        
    sleep(200ms)        
    key(enter tab:2 enter)

move [(block | blocks)] to [top] [of] <user.one_roam_tag> [leave] (ref | reference | rough):
    key(cmd-p)
    sleep(100ms)
    insert("mbtr")
    sleep(100ms)
    key(enter) 
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{one_roam_tag}")        
    sleep(200ms)        
    key(enter tab:2 enter)

move [(block | blocks)] to [top] [of] <user.one_roam_tag> [and] (zoom | go [there] | focus):
    key(cmd-p)
    sleep(100ms)
    insert("mbtz")
    sleep(100ms)
    key(enter) 
    sleep(1500ms)
    key(right)
    sleep(100ms)
    insert("{one_roam_tag}")        
    sleep(200ms)        
    key(enter tab:2 enter)

## +++++++++++ move block to reference .

move [(block | blocks)] to (ref | reference | rough) (paste | pace | clip): 
    key(cmd-alt-m)
    sleep(1500ms)
    key(tab right)
    edit.paste()
    sleep(300ms)        
    key(enter)
    sleep(100ms)
    key(tab enter)

#move to #tag #inbox combo reference
move [(block | blocks)] to <user.one_roam_tag> inbox: 
    key(cmd-alt-m)
    sleep(1500ms)
    key(tab right)
    insert("#{one_roam_tag} #inbox")
    sleep(200ms)        
    key(enter)
    sleep(100ms)
    key(tab enter)

# ------------- hardcoded reference versions

move [(block | blocks)] to agenda: 
    key(cmd-alt-m)
    sleep(1500ms)
    key(tab right)
    insert("CGDDdKiFq")
    sleep(200ms)        
    key(enter)
    sleep(100ms)        
    key(tab enter)

(send | move) [(block | blocks)] (ref | reference | link) to agenda: 
    key(cmd-alt-ctrl-m)
    sleep(1500ms)
    key(tab right)
    insert("CGDDdKiFq")       
    sleep(200ms)
    key(enter)
    sleep(100ms)       
    key(tab enter)

## +++++++++++++++++++ move to sidebar .

move [(block | blocks)] to (paste | pace) sidebar: 
    key(cmd-p)
    sleep(200ms)
    insert("mbts")
    sleep(100ms)
    key(enter)
    sleep(1500ms)
    key(right)
    edit.paste()
    sleep(200ms)
    key(enter)
    sleep(100ms)       
    key(tab enter)
    

## ++++++++++++++++++++++ insert dates .

insert today: 
    insert("/today")
    sleep(300ms)
    key(enter)
    sleep(100ms)
    key(space)

insert tomorrow: 
    insert("/tomorrow")
    sleep(300ms)
    key(enter)
    sleep(100ms)
    key(space)

(add | pick) date:
    insert("/date picker")
    sleep(300ms)
    key(enter)

    
#tagging 

## ++++++++++++++++++++++ Hash tagging .

#add named tag to block

^[(new | now)] tag <user.one_roam_tag>$: 
    insert(" #{one_roam_tag} ")

^[(new | now)] tag {user.abbreviation}$: 
    insert(" #{abbreviation} ")

(make [block] | tag block | add tag) <user.one_roam_tag>: 
    edit.select_all()
    s = edit.selected_text()
    insert("{s} #{one_roam_tag}")
    sleep(300ms)
    key(enter)

## +++++++++++++++++++++ multiple tags .

^[(new | now  |  multi )] (tags | tax) <user.one_roam_tag> [and] <user.one_roam_tag>$: 
    insert(" #{one_roam_tag_1} #{one_roam_tag_2} ")



^[(new | now  |  multi )] (tags | tax) <user.one_roam_tag> [and] <user.one_roam_tag> [and] <user.one_roam_tag>$: 
    insert(" #{one_roam_tag_1} #{one_roam_tag_2} #{one_roam_tag_3} ")

^[(new | now | multi )] (tags | tax) <user.one_roam_tag> [and] <user.one_roam_tag> [and] <user.one_roam_tag> [and] <user.one_roam_tag>$: 
    insert(" #{one_roam_tag_1} #{one_roam_tag_2} #{one_roam_tag_3} #{one_roam_tag_4} ")

^[(new | now | multi )] (tags | tax) <user.one_roam_tag> [and] <user.one_roam_tag>$: 
    insert(" #{one_roam_tag_1} #{one_roam_tag_2} ")

^[(new | now | multi )] (tags | tax) <user.one_roam_tag> [and] <user.one_roam_tag> [and] <user.one_roam_tag>$: 
    insert(" #{one_roam_tag_1} #{one_roam_tag_2} #{one_roam_tag_3} ")

#turn local text into tag

^tag [that] | make [into] tag$: 
    s = edit.selected_text() 
    insert("#{s} ")

^force tag [that]: 
    s = edit.selected_text() 
    insert("#{s} ")

^tag word$:
    edit.select_word()
    sleep(200ms)
    s = edit.selected_text()
    insert("#{s}")

^force tag word$:
    edit.select_word()
    sleep(200ms)
    s = edit.selected_text()
    insert("#{s} ")

#format declared text to tag

[slash] tag <user.text>:
    f= user.formatted_text(text, "NS_SLASH_SEPARATED")
    insert("#{f}")

^force [slash] tag <user.text>:
    f= user.formatted_text(text, "NS_SLASH_SEPARATED")
    insert("#{f} ")

^kebab tag <user.text>:
    f= user.formatted_text(text, "DASH_SEPARATED")
    insert("#{f}")

^force kebab tag <user.text>:
    f= user.formatted_text(text, "DASH_SEPARATED")
    insert("#{f} ")
    
## +++++++++++++++++ # bracket tagging .

(make | new) tag: 
    key([:2)
    
(square tag | dub square) [that]: 
    key([:2 right)
    
(square tag | dub square) (word | single | one):
    edit.select_word()
    # insert("[[")
    # edit.paste()
    # insert("]]")

(square tag | dub square) <user.text>:
    insert("[[")
    user.insert_formatted(text, "SLASH_SEPARATED")
    sleep(100ms)
    user.select_last_phrase()
    key(left delete)
    edit.word_right()

(square tag | dub square) (auto | one | use) <user.text>:
    insert("[[")
    user.insert_formatted(text, "SLASH_SEPARATED")
    sleep(100ms)
    user.select_last_phrase()
    key(left delete)
    key(down enter)
    edit.word_right()
    key(space)

## +++++++++++++ block reference links .

dub paren: insert("((")

[new] ((([block] (reference | ref) | back) [link]) | backlink): 
    insert("((")
    
((([block] (reference | ref) | back) [link]) | backlink) that: 
    insert("((")

((([block] (reference | ref) | back) [link]) | backlink) word: 
    edit.select_word()
    insert("((")


[new] ((([block] (reference | ref) | back) [link]) | backlink) <user.text>:
    insert("((")
    insert(text)
    # sleep(100ms)
    # user.select_last_phrase()
    # key(left delete)
    # edit.word_right()
    
## +++++++++++++++++++++++   pasting

(paste | pace) (unformatted | raw): key(shift-cmd-v)

## +++++++++++++++++++ edit checkboxes .

make (todo | action): 
    key(cmd-return)
    sleep(100ms)
    # key(escape)

mark done: 
    key(cmd-return)
    sleep(100ms)
    # key(escape)

make done: 
    key(cmd-return:2)
    sleep(100ms)
    # key(escape)

make undone: 
    key(cmd-return:2)
    sleep(100ms)
    key(escape)

remove (todo | action): 
    key(cmd-return:2)
    sleep(100ms)
    key(escape)

## +++++++++++++++ markdown formatting .

bold that: key(cmd-b)

## ++++++++++++++++++++++++++ headings .
heading one: key(cmd-alt-1)
heading two: key(cmd-alt-2)
heading three: key(cmd-alt-3)
heading none: key(cmd-alt-0)

## +++++++++++++++++++   inline code  formatting.
code (line | inline) that: 
    key(` esc:2)
    # s = edit.selected_text() 
    # sf = "`" + s
    # insert(sf)

code (line | inline) point:
    key(shift:down)
    mouse_click(0)
    key(`)
    sleep(200ms)
    key(esc:2)
 

## +++++++++++++++++++++++ code blocks .

new code block: key(`:3)   

code block that: key(`:3 esc)

make code block | block make code [block]: 
    key(cmd-a)
    sleep(100ms)
    key(`:3)
    key(esc)

   
 ## +++++++++++++ enter general utility .

exit: key(esc)

## +++++++++++++++++++ add components .

 ## ++++++++++++++++++++++++++ dividers .

(insert | (add | ad) | paste) divider:
    insert("---")
    key(enter)  

new divider [block]:
    key(ctrl-e) 
    key(enter)
    sleep(100ms)
    insert("---")
    key(esc:2) 


# edit.paragraph_start()
# edit.jump_line
# edit.sentence_start


    
#tabs extension

pick page: key(cmd-ctrl-alt-shift-t)

go page <number_small>:
    spacesDown=number_small - 1  
    key(cmd-ctrl-alt-shift-t)
    sleep(300ms)
    key(cmd-a delete)
    sleep(100ms)
    key("down:{spacesDown} enter")

(choose | pick) page <number_small>:
    spacesDown=number_small - 1  
    key("down:{spacesDown} enter")

go page <user.text>:
    key(cmd-ctrl-alt-shift-t)
    sleep(300ms)
    key(cmd-a delete)
    sleep(100ms)
    insert(text)
    sleep(200ms)
    key(enter)

# not canonical bc search is fuzz and filters char in middle of word    
pick page <user.letter>:
    key(cmd-ctrl-alt-shift-t)
    sleep(300ms)
    key(cmd-a delete)
    sleep(100ms)
    insert(letter)
    
open page in tab: 
    key(ctrl:down)
    mouse_click(0)

## ++++++++++++++++++++++++++ navigate .
# go top and bottom doesnt work, overriden by gener edit cmds?
# tail doesnt work either

go [to] crown [of] [page]: key(cmd-alt-shift-t)
# key(cmd-p)
# sleep(100ms)
# insert("wb jump to top of page")
# sleep(100ms)
# key(enter)    

go [to] base [of] [page]: key(cmd-shift-enter)   

dedent: key(shift-tab)
indent less: key(shift-tab)

nope: key(cmd-z)

(go | page | scroll) [to] top: key(home) 

[toggle] (multi select | select (multi | multiple [blocks])) [(off | on)]: key(cmd-m)

## ++++++++++++++++ workbench extension .

#deep nav (cursorless style) hats 

^(hat | hats | nav | deep nav [hats] | block point | block hats | show hats)$: key(cmd-alt-0)

(deep | do you) grab deep grab | go <user.number_string>: 
    insert(number_string)
    sleep(200ms)
    key(enter)

(deep | do you ) grab | go  <user.number_key>:
    key(number_key)
    sleep(100ms)
    key(enter)
    
(deep | do you ) grab | go <user.number_key> <user.number_key>:
    key(number_key_1 number_key_2)
    sleep(100ms)
    key(enter)

(deep | do you ) grab | go  <user.letter>:
    key("{letter}")
    sleep(100ms)
    key(enter)
    
(deep | do you ) grab | go  <user.letter> <user.letter>:
    key("{letter_1} {letter_2}")
    sleep(100ms)
    key(enter)

