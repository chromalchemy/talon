os: mac
app: finder
-

search (photo shop | photo | photoshop) [file] <user.text>: 
    key(cmd-f)
    sleep(600ms)
    insert(text + " .ps")

search (feta shot | photo shop | photo | photoshop) [file] (paste | pace): 
    key(cmd-f)
    sleep(600ms)
    edit.paste()
    insert(" .ps")


search (photo shop | photo | photoshop) (name | names | file names) <user.text>: 
    key(cmd-f)
    sleep(500ms)
    insert(text)
    sleep(500ms)
    key(down enter)
    insert(".ps")
