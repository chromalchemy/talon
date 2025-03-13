app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
-

format selection: 
    user.run_rpc_command("editor.action.formatSelection")

format document: 
    user.run_rpc_command("editor.action.formatDocument")

format modified lines: 
    user.run_rpc_command("editor.action.formatChanges")

## ++++++++++++++++++ calva formatting .

format (form | expression): 
    user.run_rpc_command("calva-fmt.formatCurrentForm")

format [and] align (form | expression): 
    user.run_rpc_command("calva-fmt.alignCurrentForm")
 
format [and] trim (form | expression): 
    user.run_rpc_command("calva-fmt.trimCurrentFormWhiteSpace")
 
infer parens: 
    user.run_rpc_command("calva-fmt.inferParens")

replace with pretty (print | printed): 
    user.run_rpc_command("calva.prettyPrintReplaceCurrentForm")
    