from talon import Module, actions

mod = Module()

@mod.action_class
class Actions:
    def cc_edit_link():
        """Select the link option from the context menu."""
        actions.user.rango_click_ref("link")
        actions.sleep("100ms")
        actions.key("down enter")
        actions.sleep("300ms")  # Wait for link dialog to appear

    def cc_paste_link():
        """Paste a link into the current field after selecting the link option."""
        actions.user.cc_edit_link()
        actions.key("cmd-a")
        actions.sleep("100ms")
        actions.key("cmd-v")
        actions.sleep("100ms")
        actions.key("enter")

    def cc_edit_block_background_color():
        """Edit the background color of a block."""
        actions.user.rango_click_ref("options")
        actions.user.rango_flick_ref("background color")

    def cc_edit_block_background_color_advanced():
        """Edit the background color of a block."""
        actions.user.cc_edit_block_background_color()
        actions.user.rango_flick_ref("advanced")

    def cc_select_block_background_val():
        """Edit the background color of a block."""
        actions.user.cc_edit_block_background_color_advanced()
        actions.user.rango_flick_ref("background input")
        actions.sleep("200ms")
        actions.edit.select_all()
        actions.sleep("200ms")
        