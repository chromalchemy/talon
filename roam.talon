app.name: Roam Research 
-

tag(): user.line_commands
# tag(): user.roam

####################


    
# todo: setup defualt timeout
    
please: key(cmd-p)

#left sidebar

(toggle | hide |  show) ( shortcuts |  (left | l) sidebar | bookmarks): key(cmd-\)

#not working
add (shortcut | bookmark): 
    key(cmd-p)
    sleep(100ms)
    insert("wb add shortcut")
    sleep(100ms)
    key(enter)

# embed block

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

# block/page mentions

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


(cut | carve) block: 
    key(esc)
    sleep(100ms)
    key(cmd-x)

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
go (prev | previous | last) day:  key(ctrl-alt-p)

go back:  key(cmd-[)
go (forward | fore):  key(cmd-])

jump link: key(ctr-o)

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

(toggle | hide |  show | close | open) (sidebar | side bar) :  key(cmd-/)

(swap with sidebar | swap with main):
    key(cmd-p)
    sleep(100ms)
    insert("wb sidebars - swap with main window (swap)")
    sleep(100ms)
    key(enter)  

(expand | collapse | fold) (sidebar | side bar):
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

open link in sidebar: key(ctrl-shift-o)
open page in sidebar: 
    key(cmd-p)
    sleep(100ms)
    insert("wb open page in sidebar")
    sleep(100ms)
    key(enter)

clear sidebar: key(ctr-l)

###roam prefs

open hotkeys: 
    key(cmd-p)
    sleep(100ms)
    insert("hotkeys")
    sleep(100ms)
    key(enter)

#search

#top bar search
search: key(cmd-u)

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

#native roam query
# {{[[query]]: {and: [[ex-A]] {or: [[ex-B]] [[ex-C]]}}}}

#query builder
Open query (drawer | builder): key(cmd-shift-ctrl-alt-8)

# open query drawer

#roam portal search
(go | open | search | toggle | show | hide) portal: key(cmd-ctrl-alt-shift-p)

#search roam graph visualization

#block refs

copy [block] (ref | reference): key (cmd-shift-c)

# todo: turn this into proper ordinal
(choose | pick) (<number_small> | that): 
    key("down:{number_small or 1}")
    key(enter)
    key(space)



#block nav / editing

#set up ordinal versions, with defualt sleep timing
next block: key(ctrl-n)
(block | move) up: key(cmd-shift-up)
(block | move) down: key(cmd-shift-down)
(block | move) (in | right | forward | fore | four): key(tab)
(block | move) (out | left | back): key(shift-tab)
#make unlimited todo
(block | move) (all [(the way | way)] (out | left | back) | top level | base | wayback ): 
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)

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


go block end: 
    edit.select_all()
    sleep(100ms)
    key(right)

go block start: 
    edit.select_all()
    sleep(100ms)
    key(left)

(delete block | block delete): 
    # key(cmd-backspace)
    key(esc)
    key(delete)


#select blocks

(multi select | multiselect |  select multi | exit multi):  key(cmd-m)

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


#child block

(insert | new | add | put) (child | kid) [block] | (child | kid) block | nuchal:
    #todo change to enter command
    edit.select_all()
      sleep(100ms)
    key(right)
    key(enter)
    key(tab)

    
#todo: copy imlementation from block all the way back
new base block:
    edit.select_all()
    sleep(100ms)
    key(right)
    key(enter)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)
    sleep(100ms)
    key(shift-tab)

#todo is this the same as split..?
nest here:
    key(enter)
    sleep(100ms)
    key(tab)
    key(escape)
    key(escape)

# Insert block above or below, skips children   
(new | insert) block (up | above): key(cmd-shift-i)
[(new | insert)] block [(down | below)]: key(cmd-shift-k)
new block back: 
    key(cmd-shift-k)
    sleep(500ms)
    key(shift-tab)

#todo use new block down instead of going to end and enter in all of these commends

(split | break) [new] [block] : 
    # mouse_click(0)
    # close the mouse grid if open
    # user.grid_close()
    # End any open drags
    # Touch automatically ends left drags so this is for right drags specifically
    # user.mouse_drag_end()
    # sleep(100ms)
    key(enter)

(split | break) [here | point] : 
    mouse_click(0)
    user.mouse_drag_end()
    sleep(100ms)
    key(enter)

(split | break) (child | right) [block] [here | point]: 
    mouse_click(0)
    # close the mouse grid if open
    user.grid_close()
    # End any open drags
    # Touch automatically ends left drags so this is for right drags specifically
    user.mouse_drag_end()
    sleep(100ms)
    key(enter)
    sleep(100ms)
    key(tab)
    key(down)
    key(shift-tab)
    key(escape)

(split | break) (child | right) [block]: 
    key(enter)
    sleep(100ms)
    key(tab)
    key(down)
    key(shift-tab)
    key(escape)

(split | break) [and] (stack | top) [block]: 
    # mouse_click(0)
    # close the mouse grid if open
    # user.grid_close()
    # End any open drags
    # Touch automatically ends left drags so this is for right drags specifically
    # user.mouse_drag_end()
    # edit.paragraph_end()
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
    
copy block:
    key(esc)
    sleep(100ms)
    key(cmd-c)

paste [new] block:
    edit.select_all()
    sleep(100ms)
    key(right)
    key(enter)
    key(cmd-v)
    sleep(100ms)
    key(esc)

paste [new] (child | kid) [block]:
    edit.select_all()
    sleep(100ms)
    key(right)
    key(enter)
    sleep(100ms)
    key(tab)
    key(cmd-v)
    sleep(100ms)
    key(esc)

paste (child | kid) [block] raw:
    edit.select_all()
    sleep(100ms)
    key(right)
    key(enter)
    sleep(100ms)
    key(tab)
    key(cmd-shift-v)

# new parent: 
#     edit.paragraph_end()


[toggle] (multi select | select blocks) | select (multi | multiple) [blocks]: key(cmd-m)


#move blocks 
# move to top of date

#make versions that leav reference

move [block] [to] tomorrow: 
    key(cmd-d)
    sleep(100ms)
    key(tab enter)
    sleep(100ms)
    key(tab:2 enter)

move [block] [to] today: 
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


#insert dates

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
    

#tagging 

# Hash tagging

^tag <user.one_roam_tag>: 
    insert("#{one_roam_tag}")



(h tag | hashtag) [that]: 
    s = edit.selected_text() 
    sf = "#" + s
    insert(sf)

(h tag | hashtag) (word | single | 1):
    user.cut_word()
    # edit.select_word()
    # edit.cut()
    sleep(100ms)
    insert("#")
    edit.paste()

(h tag | hashtag) <user.text>:
    insert("#")
    user.insert_formatted(text, "SLASH_SEPARATED")
    sleep(100ms)
    user.select_last_phrase()
    key(left)
    key(delete)
    edit.line_end()

#why is this short circuiting  before completion
(h tag | hashtag | hash tag ) (auto | one | use | force) <user.text>:
    insert("#")
    user.insert_formatted(text, "SLASH_SEPARATED")
    sleep(100ms)
    user.select_last_phrase()
    key(left delete)
    #todo use prase.right style fn
    key(cmd-right space)

kebab (h tag | hashtag) <user.text>:
    insert("#")
    user.insert_formatted(text, "DASH_SEPARATED")
    
# bracket tagging

(s tag | dub square) that: 
    key([:2 right)
    
(s tag | dub square) (word | single | 1):
    edit.select_word()
    # insert("[[")
    # edit.paste()
    # insert("]]")

(s tag | dub square) <user.text>:
    insert("[[")
    user.insert_formatted(text, "SLASH_SEPARATED")
    sleep(100ms)
    user.select_last_phrase()
    key(left delete)
    edit.word_right()

(s tag | dub square) (auto | one | use) <user.text>:
    insert("[[")
    user.insert_formatted(text, "SLASH_SEPARATED")
    sleep(100ms)
    user.select_last_phrase()
    key(left delete)
    key(down enter)
    edit.word_right()
    key(space)


    
((bee | back) link | dub paren): 
    key((:2)
    
((bee | back) link | dub paren) that: 
    key((:2 right)
        

((bee | back) link | dub paren) <user.text>:
    insert("((")
    insert(text)
    # sleep(100ms)
    # user.select_last_phrase()
    # key(left delete)
    # edit.word_right()
    

#formatting

(paste | pace) (unformatted | raw): key(shift-cmd-v)

([make] (todo | action) ): key(cmd-return)

bold that: key(cmd-b)

heading one: key(cmd-alt-1)
heading two: key(cmd-alt-2)
heading three: key(cmd-alt-3)
heading none: key(cmd-alt-0)
    
code (line | inline) that: key(` esc:2)
    # s = edit.selected_text() 
    # sf = "`" + s
    # insert(sf)


exit: key(esc)

new code block: 
    key(`:3)   
code block that: key(`:3 esc)
(make code block | block make code [block]): 
    key(cmd-a)
    sleep(100ms)
    key(`:3 esc)

#add components

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



# explicit tags

make project: 
    edit.select_all()
    sleep(100ms)
    key(right)
    insert(" #project")
    sleep(300ms)
    key(enter)

    
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
    
go (crown | top [of] [page]):
    key(cmd-p)
    sleep(100ms)
    insert("wb jump to top of page")
    sleep(100ms)
    key(enter)    


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
    
dedent: key(shift-tab)
indent less: key(shift-tab)