import subprocess
from talon import Context, Module, actions, settings

mod = Module()
ctx = Context()
ctx.matches = r"""
code.language: clojure
"""

# mod.list("clj_symbol", "Clojure Symbols")

# @mod.capture(rule="{self.clojure_core}")
# def clojure_fn(m) -> str:
#     "One Clojure Function"
#     return str(m)


# mod.tag("code_clojure", desc="Tag for enabling clojure-things")

# ctx.lists["user.clojure_string"] = {
#     	"blank": "blank?",
#     	"capitalize": "capitalize",
#     	"ends with": "ends-with?",
#     	"escape": "escape",
#     	"includes": "includes?",
#     	"index of": "index-of",
#     	"join": "join",
#     	"last index of": "last-index-of",
#     	"lower case": "lower-case",
#     	"re quote replacement": "re-quote-replacement",
#     	"replace": "replace",
#     	"replace first": "replace-first",
#     	"reverse": "reverse",
#     	"split": "split",
#     	"split lines": "split-lines",
#     	"starts with": "starts-with?",
#     	"trim": "trim",
#     	"trim newline": "trim-newline",
#     	"trim left": "triml",
#     	"trim right": "trimr",
#     	"upper case": "upper-case"
# }

@mod.action_class
class Actions:
    def run_basilisp(text: str):
        "demo basilisp fn"
        print("hello basilisp")
        # result = subprocess.run(["basilisp", file_path], capture_output=True, text=True)
        # print(result.stdout)

    #uses Andreas snippets fn
    # Function declaration
    # def code_function(name: str, modifiers: list[str]):
    #     actions.user.code_insert_snippet(
    #         "functionDeclaration",
    #         {"name": name, "modifiers": get_modifiers(modifiers)},
    #     )

    


#     # def code_state_return():
#     #     actions.insert("")
    
#     def code_insert_is_not_null():
#         actions.insert("some?")

#     def code_state_if():
#         actions.user.insert_between("(if", " )")
    
#     def code_insert_function(text: str, selection: str):
#         text += f"({selection or ''})"
#         actions.user.insert_between("(", " )")
#         actions.user.paste(text)
#         actions.edit.left()

#     # def code_default_function(text: str):
#     #     """Inserts function declaration without modifiers"""
#     #     result = "function {}".format(
#     #         actions.user.formatted_text(
#     #             text, settings.get("user.code_private_function_formatter")
#     #         )
#     #     )

#     #     actions.user.code_insert_function(result, None)

