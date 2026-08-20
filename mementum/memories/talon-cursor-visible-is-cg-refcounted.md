💡 macOS `ctrl.cursor_visible(bool)` is CoreGraphics **reference-counted**
(passes through CGDisplayHideCursor/ShowCursor). Verified in Talon REPL:
2 hides + 1 show → still hidden. So any code that hides more than it
shows leaves the cursor stuck — one `curse on` (community
`mouse_cursor_show`) can't undo a stacked counter.

Ground truth = CoreGraphics `CGCursorIsVisible()`:
```
cg = ctypes.CDLL(ctypes.util.find_library("ApplicationServices"))
cg.CGCursorIsVisible.restype = ctypes.c_bool
```
Recipe to keep cursor hidden through synthetic clicks without drift
(`ryan/mouse/keep_cursor_hidden.py`):
- hide-after-click: hide **once**, only if `CGCursorIsVisible()` is true
  (never stack the counter). Hook core `main.mouse_click`.
- show (`curse on`): loop `cursor_visible(True)` until `CGCursorIsVisible()`
  is true (drain counter), then nudge mouse 1px+back — a shown cursor
  doesn't repaint until a mouse event.

Also: a hidden cursor is revealed by the WindowServer whenever Talon
posts a click into another app — that's why stock community
`curse off` → click → reappears (expected mac behavior, not a bug).
