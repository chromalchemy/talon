from talon import Module, actions

mod = Module()

# class UserActions:
@mod.action_class   
class Actions:
    def shortcat_popup():
        """Show Shortcat popup"""
        actions.key("alt-shift-cmd-ctrl-f12")

    def shortcat_search(text: str):
        """Search in Shortcat"""
        actions.user.shortcat_popup()
        actions.sleep("300ms")

    def shortcat_pick_letters(letters: str):
        """Select item in Shortcat by letters"""
        actions.insert(f" {letters}")
        actions.sleep("200ms")
        actions.key("enter")

    def shortcat_pick_number(number: int):
        """Select item in Shortcat by number"""
        actions.key(f"cmd-{number}")

    def shortcat_search_menu(text: str):
        """shortcat_search_menu"""
        actions.user.shortcat_search(text)
        actions.sleep("300ms")
        actions.insert(text)

    def shortcat_search_menu_auto(text: str):
        """shortcat_search_menu"""
        actions.user.shortcat_search_menu(text)
        actions.sleep("300ms")
        actions.key("enter")

    def shortcat_refresh():
        """Refresh Shortcat"""
        actions.key("cmd-r")

    