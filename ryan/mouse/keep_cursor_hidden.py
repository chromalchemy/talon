"""Keep the mouse cursor hidden across synthetic clicks (macOS).

Background: on macOS `ctrl.cursor_visible(bool)` maps to CoreGraphics
CGDisplayHideCursor / CGDisplayShowCursor, which are REFERENCE-COUNTED
(verified: 2 hides then 1 show leaves the cursor hidden). Also, a hidden
cursor is revealed by the WindowServer whenever Talon posts a synthetic
mouse event into another app -- which is why community's `curse off`
followed by a click makes the cursor reappear (expected mac behaviour).

To keep it hidden through clicks WITHOUT stacking the hide counter (which
would make `curse on` unable to bring it back), we use CGCursorIsVisible
as ground truth:

  * hide-after-click: hide once, and only if it's actually visible.
  * show (`curse on`): drain the counter until it's really visible, then
    nudge the mouse so the WindowServer repaints it (a shown cursor does
    not redraw until a mouse event occurs).

Hooks the core `mouse_click` action, so it covers every click path (touch,
righty, mid, double/triple, and app-specific mouse_click calls).
"""

import ctypes
import ctypes.util

from talon import Context, Module, actions, app, cron, ctrl

mod = Module()
ctx = Context()

_IS_MAC = app.platform == "mac"

# Desired cursor-hidden intent. Flipped by the show/hide actions below.
_want_hidden = False

_cg = None


def _cursor_is_visible() -> bool:
    """Ground-truth cursor visibility via CoreGraphics (mac only)."""
    if not _IS_MAC:
        return True
    global _cg
    if _cg is None:
        _cg = ctypes.CDLL(ctypes.util.find_library("ApplicationServices"))
        _cg.CGCursorIsVisible.restype = ctypes.c_bool
    return bool(_cg.CGCursorIsVisible())


def _nudge():
    """Move the cursor 1px and back to force a WindowServer repaint."""
    x, y = ctrl.mouse_pos()
    ctrl.mouse_move(round(x) + 1, round(y))
    ctrl.mouse_move(round(x), round(y))


def _force_show():
    """Drain the CG hide-counter until the cursor is truly visible, repaint."""
    for _ in range(12):
        if _cursor_is_visible():
            break
        ctrl.cursor_visible(True)
    _nudge()


@ctx.action_class("user")
class UserActions:
    def mouse_cursor_hide():
        global _want_hidden
        _want_hidden = True
        actions.next()  # community's real hide (one hide)

    def mouse_cursor_show():
        global _want_hidden
        _want_hidden = False
        actions.next()  # community's real show
        if _IS_MAC:
            _force_show()  # drain counter + repaint so it reliably returns


@ctx.action_class("main")
class MainActions:
    def mouse_click(button: int = 0):
        actions.next(button)  # perform the real click first
        if _IS_MAC and _want_hidden:
            # After the OS has revealed the cursor from the click event,
            # re-hide exactly once -- but only if it's currently visible,
            # so we never stack the hide counter.
            def _rehide():
                if _want_hidden and _cursor_is_visible():
                    ctrl.cursor_visible(False)

            cron.after("30ms", _rehide)
