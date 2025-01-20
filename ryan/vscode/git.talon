app.name: Code
app.name: Cursor
app.name: Windsurf

-

tag(): user.address
tag(): user.file_manager
tag(): user.navigation


bar (repos | repositories): 
    user.run_rpc_command("gitlens.showRepositoriesView")

[pick] git (commands | command | [command] palette | menu): 
    user.run_rpc_command("gitlens.gitCommands")

 ## +++++++++++++++++++++++++++ sources .

[(show | view | bar)] (sources | git | source control): 
    user.run_rpc_command("workbench.view.scm")

go (sources | git | source control): 
    user.run_rpc_command("workbench.scm.focus")

 #not working
open repo: 
    user.run_rpc_command("gitlens.views.workspaces.repo.open")

fold [all] sources:
    user.run_rpc_command("workbench.scm.action.collapseAllRepositories")

#not working   
reveal repo:
    user.run_rpc_command("gitlens.views.revealRepositoryInExplorer")

## +++++++++++++++++++++++++++ remotes .

(show | view | bar | go) remotes: 
    user.run_rpc_command("gitlens.views.remotes.focus")

toggle remotes:
    user.run_rpc_command("gitlens.views.remotes.toggleVisibility")

## +++++++++++++++++++++++++++ commits .

(bar | hide | show) commits | (arc | bark) emits: 
    user.run_rpc_command("gitlens.showCommitsView")
    
reveal commit:
    user.run_rpc_command("gitlens.revealCommitInView")
        
fold [all] commits:
    user.run_rpc_command("workbench.actions.treeView.gitlens.views.commits.collapseAll")

(search | find) (commits | commit): 
    user.run_rpc_command("gitlens.showCommitSearch")

show [git lens] commit graph:
    user.run_rpc_command("gitlens.showGraph")

(bar commit | (arc | bark) emit) graph: 
    user.run_rpc_command("workbench.scm.history.focus")

show search [and] compare commits [view]:
    user.run_rpc_command("gitlens.showSearchAndCompareView")


## ++++++++++++++++++++++++++ branches .

(bar | hide | show) branches: 
    user.run_rpc_command("gitlens.showBranchesView")

## ++++++++++++++++++++++ commit graph .

#not working
open (in | and) commit graph:
    user.run_rpc_command("gitlens.showInCommitGraphView") 
    # user.run_rpc_command("gitlens.showInCommitGraph")

[(new | go)] commit graph tab: 
    user.run_rpc_command("gitlens.showGraphPage")

(bar | panel | go) commit graph: 
    user.run_rpc_command("gitlens.showGraph")

commit graph (max | min | normal | norm):
    user.run_rpc_command("gitlens.toggleMaximizedGraph")

## ++++++++++++++ commit graph details .

go commit [(graph | craft)] details:
    user.run_rpc_command("gitlens.views.graphDetails.focus")

[(toggle  | show | hide)] commit [(graph | craft)] details:
    user.run_rpc_command("gitlens.views.graphDetails.toggleVisibility")

## +++++++++++++++++++++ Navigate diff 

#in regular editor
[go] (file | tab | editor) next [diff] change: 
    user.run_rpc_command("workbench.action.editor.nextChange")

[go] (file | tab | editor) last [diff] change: 
    user.run_rpc_command("workbench.action.editor.previousChange")

#in compare view
[go] next [diff] change: 
    user.run_rpc_command("workbench.action.compareEditor.nextChange")

[go] last [diff] change: 
    user.run_rpc_command("workbench.action.compareEditor.previousChange")

## ___________________________________ .

(open  | go) working file : user.run_rpc_command("gitlens.openWorkingFile")

open file [at] revision: user.run_rpc_command("gitlens.openFileRevision")

## +++++++++++++++++++++++++++++ stage .

stage [this] file [changes]: user.run_rpc_command("git.stage")

## +++++++++++++++++++++++++++++ fetch .

(git fetch all | fetch all git) (remotes | repos | repositories): 
    user.run_rpc_command("gitlens.fetchRepositories")

## ++++++++++++++++++++++++++++ ignore .

add to git ignore [point]:
    mouse_click(1)
    sleep(200ms)
    insert("Add to .gitgnore")
    key(enter)

## ++++++++++++++++++++++ file changes .

(open | show) changes [with] [previous] [revision]:
    user.run_rpc_command("gitlens.diffWithPrevious")


## ++++++++++++++++++++++ file history .

# gitlens file history bar 

(bar | hide | show) file history | show file history view:
    user.run_rpc_command("gitlens.showFileHistoryView")

go file history: 
    user.run_rpc_command("gitlens.views.fileHistory.focus")

show file history:
    user.run_rpc_command("gitlens.showQuickFileHistory")

(open | get) file history:
    user.run_rpc_command("gitlens.openFileHistory")

(quick open | pick) file history: 
    user.run_rpc_command("gitlens.quickOpenFileHistory")

#git HD
view file history:    
    user.run_rpc_command("githd.viewFileHistory")

## ++++++++++++++++++++++ line history .

show line history:
    user.run_rpc_command("gitlens.showLineHistoryView")

go line history:
    user.run_rpc_command("gitlens.views.lineHistory.focus")

(toggle | hide) line history: 
    user.run_rpc_command("gitlens.views.lineHistory.toggleVisibility")

line history fold all | fold line history: 
    user.run_rpc_command("workbench.actions.treeView.gitlens.views.lineHistory.collapseAll")

view line history: 
    user.run_rpc_command("githd.viewLineHistory")

## ++++++++++++++++++++++++++++++ push .

push (to | too | two):
    user.run_rpc_command("git.pushTo")

[git] open [(talon | talent)] (repository | repo | repos):
    user.run_rpc_command("git.openRepository") 
    sleep(500ms)
    user.finder_modal_open_directory("/Users/ryan/.talon/user")

[git] open (pure | reference) [(talon | talent)] (repository | repo | repos):
    user.run_rpc_command("git.openRepository") 
    sleep(500ms)
    user.finder_modal_open_directory("/Users/ryan/.talon/repos")

