app.name: Roam Research 
mode: command
-

## +++++++++++++++++++   inline code  formatting.

[(line | inline)] code [(line | inline)] that: 
    s = edit.selected_text() 
    user.paste("`{s}`")
    key(esc:2)

[(line | inline)] code [(line | inline)] point:
    key(shift:down)
    mouse_click(0)
    sleep(100ms)
    s = edit.selected_text() 
    user.paste("`{s}`")

# make selection to point inline code, then exit block to see it rendered    
code (line | inline) point force:
    key(shift:down)
    mouse_click(0)
    sleep(100ms)
    s = edit.selected_text() 
    user.paste("`{s}`")
    sleep(100ms)
    key(esc:2)

## convert inline code to block
code (line | inline) (all | block inside | inside block) | make block  inline code :
    edit.select_all()
    sleep(100ms)
    s = edit.selected_text() 
    user.paste("`{s}`")
    sleep(100ms)
    key(esc)

# paste inline code
(paste | pace) (code [(line | inline | in line)] | [(line | inline | in line)] code ) | code [(line | inline)] (paste | pace):
    t = clip.text()
    user.paste("`{t}` ")

# render pasted inline code
((paste | pace) (code [(line | inline)] | [(line | inline | in line)] code ) | code [(line | inline | in line)] (paste | pace)) force:
    t = clip.text()
    user.paste("`{t}`")
    sleep(100ms)
    key(esc)

## +++++++++++++++++++++++ code blocks .

new code block: 
    insert("```")   

code block that: 
    x = edit.selected_text() 
    clip.set_text("```{x}```")
    user.paste_without_formatting()
   sleep(100ms)
    key(esc) 

(paste | pace) code block | code block (paste | pace):
    t = clip.text()
    clip.set_text("```{t}```")
    user.paste_without_formatting()
    sleep(200ms)
    key(esc)

code block block | make code block | block make:
    edit.select_all()
    sleep(400ms)
    x = edit.selected_text() 
    clip.set_text("```{x}```")
    user.paste_without_formatting()
   sleep(100ms)
    key(esc)