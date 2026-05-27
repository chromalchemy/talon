from talon import Context

# Tell Talon's `code.language` scope that Roam Research uses a Roam-flavored
# markdown dialect. This activates:
#   - any snippet declaring `language: roam-markdown` (e.g. roam.snippet)
#   - any snippet declaring `language: markdown | roam-markdown`
#
# The `not tag: user.code_language_forced` guard preserves the ability to
# manually override via the "force <lang>" command from language_modes.talon.

ctx = Context()
ctx.matches = r"""
app.name: Roam Research
not tag: user.code_language_forced
"""


@ctx.action_class("code")
class CodeActions:
    def language():
        return "roam-markdown"
