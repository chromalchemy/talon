## ++++++++++++++++ open vscode project by name .

[open | go] [{user.ryan.vscode.vscode_apps.list}] {user.code_workspace} (project | workspace | work space) [in] [new]  [window] | [{user.ryan.vscode.vscode_apps.list}] project {user.code_workspace}:
    ide_app = "{user.ryan.vscode.vscode_apps.list or 'Windsurf - Next'}" 
    cmd = """open -a '{ide_app}' '/Users/ryan{code_workspace}'"""
    user.system_command_nb(cmd)
    print("open project with {ide_app} completed")

# this works with vscode but not windsurf (cand find cli binary)
# cmd =  """{ide_app} '/Users/ryan{code_workspace}'"""
    

# (paste | pace) [open] {user.code_workspace} (project | projects | workspace | work space) [surf] [command] | [(paste | pace)] open surf project {user.code_workspace} command:
#     # Use the open command to launch Windsurf with the project path
#     cmd = """open -a Windsurf '/Users/ryan{code_workspace}'"""
#     user.paste(cmd)



# open in raycast command runner implementation
# key(cmd-ctrl-alt-shift-c)
# sleep(500ms)
# user.paste(cmd)
# sleep(200ms)
# key(enter)
# sleep(4000ms)
# key(esc:3)

