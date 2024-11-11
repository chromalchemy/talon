
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
    user.paste("embed-children: ")
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
