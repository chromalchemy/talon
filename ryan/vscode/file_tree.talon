app.name: Code
app.name: Cursor
app.name: Windsurf
-

## ++++++++++++++++++ talon-ready file explorer tree

bar [file] (tree | trees):            user.vscode("workbench.view.extension.filetree")

go [file] (tree | trees):             user.vscode("filetree.focus")

## ++++++++++++++++++ File tree commands
tree <user.letters>:
    user.run_rpc_command("talon-filetree.toggleDirectoryOrOpenFile", letters)

tree parent <user.letters>:
    user.run_rpc_command("talon-filetree.closeParent", letters)

tree <user.letters> <number>:
    user.run_rpc_command("talon-filetree.expandDirectory", letters, number)

tree (collapse | fold) <user.letters>:
    user.run_rpc_command("talon-filetree.expandDirectory", letters, 0)

tree move <user.letters> to <user.letters>:
    user.run_rpc_command("talon-filetree.moveFile", letters_1, letters_2)

tree move <user.letters> [to] root:
    user.run_rpc_command("talon-filetree.moveFile", letters_1)

# the recommended way to open a file is using the "toggleDirectoryOrOpenFile" command
# but this may be useful for people that want to separate the two actions
# e.g. to create very distinct commands that are easier for talon to differentiate

tree open <user.letters>:
    user.run_rpc_command("talon-filetree.openFile", letters)

tree rename <user.letters>:
    user.run_rpc_command("talon-filetree.renameFile", letters)

tree create <user.letters>:
    user.run_rpc_command("talon-filetree.createFile", letters)

tree delete <user.letters>:
    user.run_rpc_command("talon-filetree.deleteFile", letters)

tree (collapse | fold) (root | all):
    user.run_rpc_command("talon-filetree.collapseRoot")

tree (select | pick | choose) <user.letters>:
    user.run_rpc_command("talon-filetree.select", letters)

tree git:
    user.run_rpc_command("talon-filetree.toggleGitIgnoredFiles")
    
tree reveal file:
    user.run_rpc_command("talon-filetree.revealCurrentFile")
