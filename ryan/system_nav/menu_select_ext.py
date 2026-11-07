"""Additions to nriley's menu_select plugin (community/plugin/menu_select).

They live here so that the plugin folder stays an exact copy of nriley's
version (repos/nriley/plugin/menu_select) and can be updated by copying.
"""

import os

from talon import Context, Module, actions, ui

from ...community.plugin.menu_select.menu_select import (
    element_title,
    enabled_items_with_role,
    status_menu_items_fallback,
)

mod = Module()
ctx_mac = Context()
ctx_mac.matches = r"""
os: mac
"""


@mod.action_class
class Actions:
    def menu_item_by_title(title: str) -> ui.Element:
        """Return the enabled item in the open menu with this title (case-insensitive)"""

    def status_menu_by_title(title: str) -> ui.Element:
        """Return the status menu item matching the supplied title"""

    def status_menu_select_by_title(title: str):
        """Select the status menu item matching the supplied title"""

    def open_talon_menu():
        """Open the Talon menu"""

    def open_talon_submenu(submenu: str):
        """Open a submenu of the Talon menu"""
        actions.user.open_talon_menu()
        actions.sleep("200ms")
        actions.insert(submenu)
        actions.key("right")

    def select_talon_menu_item(submenu: str, menu_item: str = ""):
        """Select a menu item in a submenu of the Talon menu"""
        actions.user.open_talon_submenu(submenu)
        actions.insert(menu_item)
        actions.key("enter")


def talon_status_item() -> ui.Element:
    """Talon's own status menu item. nriley's status menu list skips it."""
    pid = os.getpid()
    for app in ui.apps():
        if app.pid == pid:
            menu_bar = app.element.AXExtrasMenuBar
            if items := enabled_items_with_role(menu_bar, "AXMenuBarItem"):
                return items[0]
    raise RuntimeError("Talon status menu not found")


@ctx_mac.action_class("user")
class MacActions:
    def menu_item_by_title(title: str) -> ui.Element:
        menu = actions.user.active_menu_safe()
        if menu is None:
            raise RuntimeError("No menu is open")
        wanted = title.casefold()
        for item in enabled_items_with_role(menu, "AXMenuItem"):
            if (item_title := element_title(item)) and item_title.casefold() == wanted:
                return item
        raise RuntimeError(f'No menu item "{title}" in the open menu')

    def status_menu_by_title(title: str) -> ui.Element:
        items, fallback = status_menu_items_fallback()
        for item in items:
            if element_title(item) == title:
                return item
            if (element := fallback(item)) and element_title(element) == title:
                return item
        raise RuntimeError(f'Status menu "{title}" not found')

    def status_menu_select_by_title(title: str):
        actions.user.menu_item_select(actions.user.status_menu_by_title(title))

    def open_talon_menu():
        # Pressing Talon's own menu through accessibility deadlocks Talon,
        # so move the mouse onto it and click, like "status touch <menu>".
        actions.user.status_menus_hide()
        actions.user.menu_item_hover(talon_status_item())
        actions.mouse_click()
