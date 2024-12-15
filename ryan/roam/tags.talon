app.name: Roam Research 
mode: command
-

## ++++++++++++++++++++++++++ has tags .

^[(new | now)] tag ({user.abbreviation} | {user.ryan.roam.tags.list} | [<user.formatters>] <user.text>) $:
    tag_text = user.roam_tag("{formatters or 'SLASH_SEPARATED'}", "{text or ''}", "{abbreviation or ''}", "{user.ryan.roam.tags.list or ''}")
    insert(" #{tag_text} ")

#keep chooser open    
^[(new | now)] tag ink ({user.abbreviation} | {user.ryan.roam.tags.list} | [<user.formatters>] <user.text>) $:
    tag_text = user.roam_tag("{formatters or 'SLASH_SEPARATED'}", "{text or ''}", "{abbreviation or ''}", "{user.ryan.roam.tags.list or ''}")
    insert(" #{tag_text}")
    
(make [block] | tag block | add tag) ({user.abbreviation} | {user.ryan.roam.tags.list} | [<user.formatters>] <user.text>):
    tag_text = user.roam_tag("{formatters or 'SLASH_SEPARATED'}", "{text or ''}", "{abbreviation or ''}", "{user.ryan.roam.tags.list or ''}")
    edit.select_all()
    s = edit.selected_text()
    insert("{s} #{tag_text}")
    sleep(300ms)
    key(enter)

## +++++++++++++++++++++ multiple tags .

^[(new | now  |  multi )] (tags | tax) {user.ryan.roam.tags.list} [and] {user.ryan.roam.tags.list}$: 
    insert(" #{user.ryan.roam.tags.list_1} #{user.ryan.roam.tags.list_2} ")


^[(new | now  |  multi )] (tags | tax) {user.ryan.roam.tags.list} [and] {user.ryan.roam.tags.list} [and] {user.ryan.roam.tags.list}$: 
    insert(" #{user.ryan.roam.tags.list_1} #{user.ryan.roam.tags.list_2} #{user.ryan.roam.tags.list_3} ")

^[(new | now | multi )] (tags | tax) {user.ryan.roam.tags.list} [and] {user.ryan.roam.tags.list} [and] {user.ryan.roam.tags.list} [and] {user.ryan.roam.tags.list}$: 
    insert(" #{user.ryan.roam.tags.list_1} #{user.ryan.roam.tags.list_2} #{user.ryan.roam.tags.list_3} #{user.ryan.roam.tags.list_4} ")

^[(new | now | multi )] (tags | tax) {user.ryan.roam.tags.list} [and] {user.ryan.roam.tags.list}$: 
    insert(" #{user.ryan.roam.tags.list_1} #{user.ryan.roam.tags.list_2} ")

^[(new | now | multi )] (tags | tax) {user.ryan.roam.tags.list} [and] {user.ryan.roam.tags.list} [and] {user.ryan.roam.tags.list}$: 
    insert(" #{user.ryan.roam.tags.list_1} #{user.ryan.roam.tags.list_2} #{user.ryan.roam.tags.list_3} ")

#turn local text into tag

^tag [that] | make [into] tag$: 
    s = edit.selected_text() 
    insert("#{s} ")

^tag [point] here:
    key(shift:down)
    mouse_click(0) 
    s = edit.selected_text()
    y = user.roam_lower(s)
    insert("#{y}")

^pad tag [point] here:
    key(shift:down)
    mouse_click(0) 
    s = edit.selected_text()
    y = user.roam_lower(s)
    insert(" #{y} ")

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
    
## +++++++++++++++++ # square bracket tagging .
    
(square tag | dub square) that: 
    s = edit.selected_text() 
    insert("[[{s}]]")
    
#but select word has bug
(square tag | dub square) (word | single | one):
    edit.select_word()
    s = edit.selected_text() 
    insert("[[{s}]]")

(square tag | dub square):
    insert("[[")

# test brief {user.abbreviation}:
#     print(abbreviation)

(square tag | dub square) ({user.abbreviation} | {user.ryan.roam.tags.list} | [<user.formatters>] <user.text>):
    tag_text = user.roam_tag("{formatters or ''}", "{text or ''}", "{abbreviation or ''}", "{user.ryan.roam.tags.list or ''}")
    insert("[[{tag_text}]] ")

(square tag | dub square) ({user.abbreviation} | {user.ryan.roam.tags.list} | [<user.formatters>] <user.text>) ink :
    tag_text = user.roam_tag("{formatters or ''}", "{text or ''}", "{abbreviation or ''}", "{user.ryan.roam.tags.list or ''}")
    insert("[[{tag_text}]]")

(square tag | dub square) (auto | one | use | pop) ({user.abbreviation} | {user.ryan.roam.tags.list} | [<user.formatters>] <user.text>) :
    tag_text = user.roam_tag("{formatters or ''}", "{text or ''}", "{abbreviation or ''}", "{user.ryan.roam.tags.list or ''}")
    insert("[[{tag_text}]]")
    sleep(300ms)
    key(enter)
