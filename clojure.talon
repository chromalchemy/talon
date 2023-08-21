tag: user.clojure
mode: command
and code.language: clojure
-

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
#     user.code_public_variable_formatter = "DASH_SEPARATED"

hello test: insert("test worked!!!")

<user.clojure_fn>: insert("{clojure_fn}")

function <user.clojure_fn>: 
    key(delete)
    user.insert_between("({clojure_fn} ", ")")

function it: 
    selectedText = edit.selected_text()
    key(delete)
    user.insert_between("({selectedText} ", ")")
