app.name: Roam Research 
mode: command
-
settings():
    user.snippet_raw_text_paste = true

## +++++++++++++++++++   inline code  formatting.

[(line | inline)] code [(line | inline)] that: 
    s = edit.selected_text() 
    user.roam_insert_snippet("codeInline", s)
    user.roam_select_none()

[(line | inline)] code [(line | inline)] point:
    s = user.copy_to_click()
    user.roam_insert_snippet("codeInline", s)

# make selection to point inline code, then exit block to see it rendered    
code (line | inline) point force:
    s = user.copy_to_click()
    user.roam_insert_snippet("codeInline", s)
    user.roam_select_none()

## convert inline code to block
code (line | inline) (all | block inside | inside block) | make block  inline code :
    edit.select_all()
    s = edit.selected_text() 
    user.roam_insert_snippet("codeInline", s)
    key(esc)

# paste inline code
(paste | pace) (code [(line | inline | in line)] | [(line | inline | in line)] code ) | code [(line | inline)] (paste | pace):
    t = clip.text()
    user.roam_insert_snippet("codeInline", t)

# render pasted inline code
((paste | pace) (code [(line | inline)] | [(line | inline | in line)] code ) | code [(line | inline | in line)] (paste | pace)) force:
    t = clip.text()
    user.roam_insert_snippet("codeInline", t)
    key(esc)

## +++++++++++++++++++++++ code blocks .

new code block:
    user.insert_snippet_by_name_with_stop_at_end("codeBlock")  

code block that: 
    t = edit.selected_text()
    user.roam_insert_snippet("codeBlock", t) 
    key(esc) 

(paste | pace) code block | code block (paste | pace):
    t = clip.text()
    user.roam_insert_snippet("codeBlock", t)
    key(esc)

code block block | make code block | block make:
    edit.select_all()
    sleep(400ms)
    t = edit.selected_text() 
    user.roam_insert_snippet("codeBlock", t)
    key(esc)