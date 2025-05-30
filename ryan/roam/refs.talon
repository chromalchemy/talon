app.name: Roam Research 
mode: command
-       
#copy ref
copy [block] (ref | reference): key(cmd-shift-c)

## +++++++++++++ write out a reference .

dub paren | [new] ([block] (reference | ref)  [link]  | backlink) [that]: 
    insert("((")

([block] (reference | ref)  [link]  | backlink) word: 
    edit.select_word()
    insert("((")

[new] ([block] (reference | ref)  [link]  | backlink) <user.text>:
    insert("((")
    insert(text)
    # sleep(100ms)
    # user.select_last_phrase()
    # key(left delete)
    # edit.word_right()

## ++++++++++++++++++ named references .

(paste | pace) {user.ryan.roam.refs.list} (ref | reference) [text] :
    user.paste("(({user.ryan.roam.refs.list}))")

(paste | pace) (ref | reference) (id | token) {user.ryan.roam.refs.list}:
    user.paste("{user.ryan.roam.refs.list}")

## +++++++++++++++++ jump to named ref (on page)

#buggy todo: find better implementation
(jump | go ) [to] {user.ryan.roam.refs.list} [(ref | reference)]:
    user.run_roam_command("wb jump to block in page")
    sleep(500ms)
    user.paste()
    sleep(100ms)
    user.roam_break_block()
    key(tab)
    sleep(100ms)
    key(enter)


## +++++++++++++++++++++++ replace reference (swap)

^(replace | swap) (ref | reference) [with original]: 
    user.run_roam_command("wb replace last reference before cursor with original")    

^(replace | swap) (ref | reference) [with] alias: 
    user.run_roam_command("wb replace last reference before cursor with text and alias")
