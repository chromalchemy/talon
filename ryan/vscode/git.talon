app.name: Code
app.name: Cursor
app.name: Windsurf

-

tag(): user.address
tag(): user.file_manager
tag(): user.navigation


bar (repos | repositories): 
    user.vscode("gitlens.showRepositoriesView")

[pick] git (commands | command | [command] palette | menu): 
    user.vscode("gitlens.gitCommands")

 ## +++++++++++++++++++++++++++ sources .

[(show | view | bar)] (sources | git | source control): 
    user.vscode("workbench.view.scm")

go (sources | git | source control): 
    user.vscode("workbench.scm.focus")

 #not working
open repo: 
    user.vscode("gitlens.views.workspaces.repo.open")

fold [all] sources:
    user.vscode("workbench.scm.action.collapseAllRepositories")

#not working   
reveal repo:
    user.vscode("gitlens.views.revealRepositoryInExplorer")

## +++++++++++++++++++++++++++ remotes .

(show | view | bar | go) remotes: 
    user.vscode("gitlens.views.remotes.focus")

toggle remotes:
    user.vscode("gitlens.views.remotes.toggleVisibility")

## +++++++++++++++++++++++++++ commits .

(bar | hide | show) commits | (arc | bark) emits: 
    user.vscode("gitlens.showCommitsView")
    
reveal commit:
    user.vscode("gitlens.revealCommitInView")
        
fold [all] commits:
    user.vscode("workbench.actions.treeView.gitlens.views.commits.collapseAll")

(search | find) (commits | commit): 
    user.vscode("gitlens.showCommitSearch")

show [git lens] commit graph:
    user.vscode("gitlens.showGraph")

(bar commit | (arc | bark) emit) graph: 
    user.vscode("workbench.scm.history.focus")

show search [and] compare commits [view]:
    user.vscode("gitlens.showSearchAndCompareView")


## ++++++++++++++++++++++++++ branches .

(bar | hide | show) branches: 
    user.vscode("gitlens.showBranchesView")

## ++++++++++++++++++++++ commit graph .

#not working
open (in | and) commit graph:
    user.vscode("gitlens.showInCommitGraphView") 
    # user.vscode("gitlens.showInCommitGraph")

[(new | go)] commit graph tab: 
    user.vscode("gitlens.showGraphPage")

(bar | panel | go) commit graph: 
    user.vscode("gitlens.showGraph")

commit graph (max | min | normal | norm):
    user.vscode("gitlens.toggleMaximizedGraph")

## ++++++++++++++ commit graph details .

go commit [(graph | craft)] details:
    user.vscode("gitlens.views.graphDetails.focus")

[(toggle  | show | hide)] commit [(graph | craft)] details:
    user.vscode("gitlens.views.graphDetails.toggleVisibility")

## +++++++++++++++++++++ Navigate diff 

#in regular editor
[go] (file | tab | editor) next [diff] change: 
    user.vscode("workbench.action.editor.nextChange")

[go] (file | tab | editor) last [diff] change: 
    user.vscode("workbench.action.editor.previousChange")

#in compare view
[go] next [diff] change: 
    user.vscode("workbench.action.compareEditor.nextChange")

[go] last [diff] change: 
    user.vscode("workbench.action.compareEditor.previousChange")

## ___________________________________ .

(open  | go) working file : user.vscode("gitlens.openWorkingFile")

open file [at] revision: user.vscode("gitlens.openFileRevision")

## +++++++++++++++++++++++++++++ stage .

stage [this] file [changes]: user.vscode("git.stage")

## +++++++++++++++++++++++++++++ fetch .

(git fetch all | fetch all git) (remotes | repos | repositories): 
    user.vscode("gitlens.fetchRepositories")

## ++++++++++++++++++++++++++++ ignore .

add to git ignore [point]:
    mouse_click(1)
    sleep(200ms)
    insert("Add to .gitgnore")
    key(enter)

## ++++++++++++++++++++++ file changes .

(open | show) changes [with] [previous] [revision]:
    user.vscode("gitlens.diffWithPrevious")


## ++++++++++++++++++++++ file history .

# gitlens file history bar 

(bar | hide | show) file history | show file history view:
    user.vscode("gitlens.showFileHistoryView")

go file history: 
    user.vscode("gitlens.views.fileHistory.focus")

show file history:
    user.vscode("gitlens.showQuickFileHistory")

(open | get) file history:
    user.vscode("gitlens.openFileHistory")

(quick open | pick) file history: 
    user.vscode("gitlens.quickOpenFileHistory")

#git HD
view file history:    
    user.vscode("githd.viewFileHistory")

## ++++++++++++++++++++++ line history .

show line history:
    user.vscode("gitlens.showLineHistoryView")

go line history:
    user.vscode("gitlens.views.lineHistory.focus")

(toggle | hide) line history: 
    user.vscode("gitlens.views.lineHistory.toggleVisibility")

line history fold all | fold line history: 
    user.vscode("workbench.actions.treeView.gitlens.views.lineHistory.collapseAll")

view line history: 
    user.vscode("githd.viewLineHistory")

## ++++++++++++++++++++++++++++++ push .

push (to | too | two):
    user.vscode("git.pushTo")

[git] open [(talon | talent)] (repository | repo | repos):
    user.run_rpc_command("git.openRepository") 
    sleep(500ms)
    user.finder_modal_open_directory("/Users/ryan/.talon/user")

[git] open (pure | reference) [(talon | talent)] (repository | repo | repos):
    user.run_rpc_command("git.openRepository") 
    sleep(500ms)
    user.finder_modal_open_directory("/Users/ryan/.talon/repos")

