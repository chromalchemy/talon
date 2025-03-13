app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
code.language: clojure
-

(add | ad) post:
    s = edit.selected_text()
    insert("[{s}")
    key(delete space)
    sleep(100ms)
    insert("{:post \"")

(add | ad) pre:
    s = edit.selected_text()
    insert("[{s}")
    key(delete space)
    sleep(100ms)
    insert("{:pre \"")