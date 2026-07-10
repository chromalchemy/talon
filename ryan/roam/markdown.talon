app.name: Roam Research 
mode: command
-

## +++++++++++++++ markdown formatting .

bold that: key(cmd-b)

bold point: 
    key(shift:down)
    mouse_click(0)
    key(cmd-b)
    sleep(100ms)
    key(esc:2)

## ++++++++++++++++++++++++++ headings .

[make] (heading | header) one: 
    key(cmd-alt-1)

[make] (heading | header) two: 
    key(cmd-alt-2)

[make] (heading | header) three: 
    key(cmd-alt-3)

[make] (heading | header) none | remove (heading | header (format | formatting)): 
    key(cmd-alt-0)