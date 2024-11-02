# code.language: clojure
# -

cat <user.system_path>:
    user.run_basilisp(system_path)
    # insert(system_path)

##tag(): user.clj_symbol

# tag(): user.code_imperative
# tag(): user.code_object_oriented

# tag(): user.code_comment_line
# tag(): user.code_comment_block_c_like
# tag(): user.code_data_bool
# tag(): user.code_data_null
# tag(): user.code_functions
# tag(): user.code_functions_common
# tag(): user.code_keywords
# tag(): user.code_libraries
# tag(): user.code_operators_array
# tag(): user.code_operators_assignment
# tag(): user.code_operators_bitwise
# tag(): user.code_operators_lambda
# tag(): user.code_operators_math

# settings():
#     user.code_private_function_formatter = "DASH_SEPARATED"
#     user.code_protected_function_formatter = "DASH_SEPARATED"
#     user.code_public_function_formatter = "DASH_SEPARATED"
#     user.code_private_variable_formatter = "DASH_SEPARATED"
#     user.code_protected_variable_formatter = "DASH_SEPARATED"
#     user. testcode_public_variable_formatter = "DASH_SEPARATED"


test (closure | clojure) [scope]: 
    # app.notify('hello from clojure code')
    insert("printing clojure!")


## +++++++++++ clear calva repl output .

# todo: not working... 
# key(cmd-ctrl-alt-shift-k): user.vscode("workbench.action.terminal.clear")

## ___________________________________ .


[(closure | clojure)] (token | symbol | simple | sym | sim) {user.clj_symbol}: 
    insert("{clj_symbol}")

## ++++++++++++++++++++ insert keyword .

keyword [<user.text>]: 
    kw = user.formatted_text("{text or ''}", "DASH_SEPARATED")
    fullkw = ":" + kw
    insert(fullkw)
    
(slashed | conga) keyword [<user.text>]:
    kw = user.formatted_text("{text or ''}", "SLASH_SEPARATED")
    fullkw = ":" + kw
    insert(fullkw) 
    
(namespace | namespaced | name space) keyword [<user.text>]:
    kw = user.formatted_text("{text or ''}", "DASH_SEPARATED")
    fullkw = "::" + kw
    insert(fullkw)  

open keyword <user.format_code>+: 
    insert(":")
    user.insert_many(format_code_list)

open  (namespace | name space) keyword <user.format_code>+: 
    insert("::")
    user.insert_many(format_code_list)


# <user.format_code>+ over: user.insert_many(format_code_list)
# <user.formatters> that: user.formatters_reformat_selection(user.formatters)


# function <user.clojure_fn>: 
#     key(delete)
#     user.insert_between("({clojure_fn} ", ")")

# function <user.word>: 
#     key(delete)
#     user.insert_between("({word} ", ")")


# function it: 
#     selectedText = edit.selected_text()
#     key(delete)
#     user.insert_between("({selectedText} ", ")")
