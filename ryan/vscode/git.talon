app.name: Code
-

(bar | hide | show) commits | (arc | bark) emits: user.vscode("gitlens.showCommitsView")
(bar | hide | show) file history: user.vscode("gitlens.showFileHistoryView")
go file history: user.vscode("gitlens.views.fileHistory.focus")

# git sources
[(show | view | bar)] (sources | git | source control): user.vscode("workbench.view.scm")

go (sources | git | source control): 
    user.vscode("workbench.scm.focus")

(show | view | bar | go) remotes: 
    user.vscode("gitlens.views.remotes.focus")

[pick] git (commands | command | [command] palette | menu): 
    user.vscode("gitlens.gitCommands")

fold [all] sources:
    user.vscode("workbench.scm.action.collapseAllRepositories")

fold [all] commits:
    user.vscode("workbench.actions.treeView.gitlens.views.commits.collapseAll")

    
#not working
open (in | and) commit graph:
    user.vscode("gitlens.showInCommitGraphView") 
    # user.vscode("gitlens.showInCommitGraph")

#not working
open repo: 
    user.vscode("gitlens.views.workspaces.repo.open")

#not working   
reveal repo:
    user.vscode("gitlens.views.revealRepositoryInExplorer")

## ++++++++++++++++++++++ commit graph .

[(new | go)] commit graph tab: 
    user.vscode("gitlens.showGraphPage")

(bar | panel | go) commit graph: 
    user.vscode("gitlens.showGraph")

go commit graph details:
    user.vscode("gitlens.views.graphDetails.focus")

(toggle  | show | hide) commit [graph] details:
    user.vscode("gitlens.views.graphDetails.toggleVisibility")

commit graph (max | min | normal | norm):
    user.vscode("gitlens.toggleMaximizedGraph")



## +++++++++++++++++++++ Navigate diff 
#in regular editor
[go] (file | tab | editor) next [diff] change: user.vscode("workbench.action.editor.nextChange")
[go] (file | tab | editor) last [diff] change: user.vscode("workbench.action.editor.previousChange")

#in compare view
[go] next [diff] change: user.vscode("workbench.action.compareEditor.nextChange")
[go] last [diff] change: user.vscode("workbench.action.compareEditor.previousChange")


## +++++++++++++++++++++++++++ gitlens .

(open  | go) working file : user.vscode("gitlens.openWorkingFile")
open file [at] revision: user.vscode("gitlens.openFileRevision")

## +++++++++++++++++++++++++++++++ git .
stage [this] file [changes]: user.vscode("git.stage")


(git fetch all | fetch all git) (remotes | repos | repositories): 
    user.vscode("gitlens.fetchRepositories")

add to git ignore [point]:
    mouse_click(1)
    sleep(200ms)
    insert("Add to .gitgnore")
    key(enter)


(open | show) changes [with] [previous] [revision]:
    user.vscode("gitlens.diffWithPrevious")