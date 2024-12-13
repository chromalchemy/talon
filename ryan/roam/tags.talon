app.name: Roam Research 
mode: command
-
#add named tag to block

^[(new | now)] tag {user.ryan.roam.tags.list}$: 
    insert(" #{user.ryan.roam.tags.list} ")

^[(new | now)] tag {user.abbreviation}$: 
    insert(" #{abbreviation} ")

#keep chooser    
^[(new | now)] tag ink {user.ryan.roam.tags.list}$: 
    insert(" #{user.ryan.roam.tags.list}")

^[(new | now)] tag ink {user.abbreviation}$: 
    insert(" #{abbreviation}")
    
    
(make [block] | tag block | add tag) {user.ryan.roam.tags.list}: 
    edit.select_all()
    s = edit.selected_text()
    insert("{s} #{user.ryan.roam.tags.list}")
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

#format declared text to tag

[slash] tag <user.text>:
    f= user.formatted_text(text, "NS_SLASH_SEPARATED")
    insert("#{f}")

^force [slash] tag <user.text>:
    f= user.formatted_text(text, "NS_SLASH_SEPARATED")
    insert("#{f} ")

^(kebab | dash | dashed | dashy) tag <user.text>:
    f= user.formatted_text(text, "DASH_SEPARATED")
    insert("#{f}")

^force (kebab | dash | dashed | dashy) tag <user.text>:
    f= user.formatted_text(text, "DASH_SEPARATED")
    insert("#{f} ")
    
## +++++++++++++++++ # bracket tagging .
    
(square tag | dub square) that: 
    s = edit.selected_text() 
    insert("[[{s}")
    
#but select word has bug
(square tag | dub square) (word | single | one):
    edit.select_word()
    s = edit.selected_text() 
    insert("[[{s}")

(square tag | dub square):
    insert("[[")

(square tag | dub square) <user.text>:
    t = user.formatted_text(text, "SLASH_SEPARATED")
    insert("[[{t}")

(square tag | dub square) (auto | one | use | pop) <user.text>:
    t = user.formatted_text(text, "SLASH_SEPARATED")
    insert("[[{t}")
    sleep(300ms)
    key(enter)

(square tag | dub square) (kebab | dashy) <user.text>:
    t = user.formatted_text(text, "DASH_SEPARATED")
    insert("[[{t}")

(square tag | dub square) (kebab | dashy) pop <user.text>:
    t = user.formatted_text(text, "DASH_SEPARATED")
    insert("[[{t}")
    sleep(300ms)
    key(enter)