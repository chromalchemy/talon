app.name: Roam Research 
mode: command
-

# edit.paragraph_start()
# edit.jump_line
# edit.sentence_start

## +++++++++++++ navigate within block .

[go] (block end | post block): 
    key(cmd-a)
    sleep(100ms)
    key(right)   

go block start: 
    key(shift-home left)
    # edit.select_all()
    # sleep(100ms)
    # key(left)

## ++++++++++++ select block start/end .

(select | take) block start:
    key(shift-home)

(select | take) (block end | rest of block ):
        key(shift-end)

## ++++++++++++ clear block start/end .

(clear | chuck) block start:
    key(shift-home delete)

(clear | chuck) (block end | rest of block ):
    key(shift-end delete)

