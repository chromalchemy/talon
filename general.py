from talon import app, actions

def on_ready():
    actions.mode.enable("dictation")
    # actions.user.mouse_guide_toggle() #not working
    # actions.mode.enable("command") #already enabled by default

app.register("ready", on_ready)