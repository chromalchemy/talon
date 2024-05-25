app.name: Roam Research 
mode: command
-

## +++++++++++++++++++   inline code  formatting.

code (line | inline) that: 
    s = edit.selected_text() 
    user.paste("`{s}`")
    key(esc:2)

code (line | inline) point:
    key(shift:down)
    mouse_click(0)
    sleep(100ms)
    s = edit.selected_text() 
    user.paste("`{s}`")

code (line | inline) block | make inline code block:
    edit.select_all()
    sleep(100ms)
    s = edit.selected_text() 
    user.paste("`{s}`")
    sleep(100ms)
    key(esc)

code (line | inline) point force:
    key(shift:down)
    mouse_click(0)
    sleep(100ms)
    s = edit.selected_text() 
    user.paste("`{s}`")
    sleep(100ms)
    key(esc:2)

(paste | pace) code inline | code inline (paste | pace):
    t = clip.text()
    user.paste("`{t}`")
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