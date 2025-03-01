## ++++++++++++++++ open vscode project by name .

[open | go] {user.code_workspace} (project | workspace | work space) [in] [new]  [window] | project {user.code_workspace}:
    ide_app = "code" 
    # ide_app = "windsurf" 
    cmd =  """{ide_app} '/Users/ryan{code_workspace}'"""
    user.system_command_nb(cmd)
    # insert(cmd)
    print("open project completed")
    
# bug todo: not working
# [open | go] {user.code_workspace} (project | projects | workspace | work space) [in] surf | surf project {user.code_workspace}:
#     ide_app = "windsurf" 
#     cmd =  """{ide_app} '/Users/ryan{code_workspace}'"""
#     user.system_command_nb(cmd)
#     print("open surf project completed")

[open | go] {user.code_workspace} (project | projects | workspace | work space) [in] surf | surf {user.code_workspace} project:
    ide_app = "windsurf" 
    cmd =  """{ide_app} '/Users/ryan{code_workspace}'"""
    key(cmd-ctrl-alt-shift-c)
    sleep(500ms)
    user.paste(cmd)
    sleep(200ms)
    key(enter)
    sleep(4000ms)
    key(esc:3)

(paste | pace) [open] {user.code_workspace} (project | projects | workspace | work space) [surf] [command] | [(paste | pace)] open surf project {user.code_workspace} command:
    ide_app = "windsurf" 
    cmd =  """{ide_app} '/Users/ryan{code_workspace}'"""
    user.paste(cmd)
