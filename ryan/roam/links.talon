# app.name: Roam Research 
mode: command
-

## ++++++++++++++++++++++ Hash tagging .

#add named tag to block

^[(new | now)] tag {user.roam_tag}$: 
    insert(" #{roam_tag} ")

^[(new | now)] tag {user.abbreviation}$: 
    insert(" #{abbreviation} ")

#keep chooser    
^[(new | now)] tag ink {user.roam_tag}$: 
    insert(" #{roam_tag}")

^[(new | now)] tag ink {user.abbreviation}$: 
    insert(" #{abbreviation}")
    
    
(make [block] | tag block | add tag) {user.roam_tag}: 
    edit.select_all()
    s = edit.selected_text()
    insert("{s} #{roam_tag}")
    sleep(300ms)
    key(enter)

## +++++++++++++++++++++ multiple tags .

^[(new | now  |  multi )] (tags | tax) {user.roam_tag} [and] {user.roam_tag}$: 
    insert(" #{roam_tag_1} #{roam_tag_2} ")


^[(new | now  |  multi )] (tags | tax) {user.roam_tag} [and] {user.roam_tag} [and] {user.roam_tag}$: 
    insert(" #{roam_tag_1} #{roam_tag_2} #{roam_tag_3} ")

^[(new | now | multi )] (tags | tax) {user.roam_tag} [and] {user.roam_tag} [and] {user.roam_tag} [and] {user.roam_tag}$: 
    insert(" #{roam_tag_1} #{roam_tag_2} #{roam_tag_3} #{roam_tag_4} ")

^[(new | now | multi )] (tags | tax) {user.roam_tag} [and] {user.roam_tag}$: 
    insert(" #{roam_tag_1} #{roam_tag_2} ")

^[(new | now | multi )] (tags | tax) {user.roam_tag} [and] {user.roam_tag} [and] {user.roam_tag}$: 
    insert(" #{roam_tag_1} #{roam_tag_2} #{roam_tag_3} ")

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

^(kebab | dash | dashed) tag <user.text>:
    f= user.formatted_text(text, "DASH_SEPARATED")
    insert("#{f}")

^force (kebab | dash | dashed) tag <user.text>:
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

(square tag | dub square) kebab <user.text>:
    t = user.formatted_text(text, "DASH_SEPARATED")
    insert("[[{t}")

(square tag | dub square) kebab pop <user.text>:
    t = user.formatted_text(text, "DASH_SEPARATED")
    insert("[[{t}")
    sleep(300ms)
    key(enter)



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