app.name: Code
app.name: Cursor
app.name: Windsurf
-

format selection: 
    user.vscode("editor.action.formatSelection")

format document: 
    user.vscode("editor.action.formatDocument")

format modified lines: 
    user.vscode("editor.action.formatChanges")

## ++++++++++++++++++ calva formatting .

format (form | expression): 
    user.vscode("calva-fmt.formatCurrentForm")

format [and] align (form | expression): 
    user.vscode("calva-fmt.alignCurrentForm")
 
format [and] trim (form | expression): 
    user.vscode("calva-fmt.trimCurrentFormWhiteSpace")
 
infer parens: 
    user.vscode("calva-fmt.inferParens")

replace with pretty (print | printed): 
    user.vscode("calva.prettyPrintReplaceCurrentForm")
    