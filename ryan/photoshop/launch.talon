# NOTE: no context header on purpose — these commands should fire anywhere.

launch photo master:
    # Long-running: use detached so Talon doesn't block on `bb up`.
    user.system_command_detached("cd '/Users/ryan/dev/ps script/plugins/ps-scittle-repl' && bb up")
    sleep(10000ms)
    user.switcher_focus("Adobe UXP Developer Tools")
    sleep(300ms)
    user.uxp_watch_ps_dev_plugin()
    sleep(300ms)
    user.switcher_focus("Adobe Photoshop (Beta)")

tear down photo master:
    # Short-running: blocking is fine, but path still needs quoting.
    user.system_command_nb("cd '/Users/ryan/dev/ps script/plugins/ps-scittle-repl' && bb down")
