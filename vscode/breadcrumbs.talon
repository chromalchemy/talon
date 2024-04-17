app.name: Code
-


# , already in community
# select breadcrumb: user.vscode("breadcrumbs.focusAndSelect")

(toggle | show | hide) (file context | path | crumb | crumbs | breadcrumb | breadcrumbs): user.vscode("breadcrumbs.toggle")

file context | path | crumb | crumbs | breadcrumb | breadcrumbs: user.vscode("breadcrumbs.focusAndSelect")

(go | focus) (file context | path | crumb | crumbs | breadcrumb | breadcrumbs): user.vscode("breadcrumbs.focus")

(crumb | crumbs | level) (left | [level] up | parent): key(alt-left)
(crumb | crumbs | level) (right | [level] down | child): key(alt-right)

# todo: (crumb | crumbs) parent ... doesnt work
parent ([(file | level)] context | path | crumb | crumbs | breadcrumb | breadcrumbs): 
    user.vscode("breadcrumbs.focusAndSelect")
    key(alt-(left)  
