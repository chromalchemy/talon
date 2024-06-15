#------------------:editing

split here:
	user.vscode("paredit.splitSexp")

split point:
	mouse_click(0)
	user.vscode("paredit.splitSexp")

split <user.cursorless_target>:
	user.cursorless_ide_command("paredit.splitSexp", cursorless_target)

join expressions here:
	user.vscode("paredit.joinSexp")

join expressions point:
	mouse_click(0)
	user.vscode("paredit.joinSexp")

join expressions <user.cursorless_target>:
	user.cursorless_ide_command("paredit.joinSexp", cursorless_target)

#------------------:deleting

force delete back here:
	user.vscode("paredit.forceDeleteBackward")

force delete back point:
	mouse_click(0)
	user.vscode("paredit.forceDeleteBackward")

force delete back <user.cursorless_target>:
	user.cursorless_ide_command("paredit.forceDeleteBackward", cursorless_target)

force delete forward here:
	user.vscode("paredit.forceDeleteForward")

force delete forward point:
	mouse_click(0)
	user.vscode("paredit.forceDeleteForward")

force delete forward <user.cursorless_target>:
	user.cursorless_ide_command("paredit.forceDeleteForward", cursorless_target)

delete back here:
	user.vscode("paredit.deleteBackward")

delete back point:
	mouse_click(0)
	user.vscode("paredit.deleteBackward")

delete back <user.cursorless_target>:
	user.cursorless_ide_command("paredit.deleteBackward", cursorless_target)

delete forward here:
	user.vscode("paredit.deleteForward")

delete forward point:
	mouse_click(0)
	user.vscode("paredit.deleteForward")

delete forward <user.cursorless_target>:
	user.cursorless_ide_command("paredit.deleteForward", cursorless_target)

(kill | chuck) [form] right here:
	user.vscode("paredit.killRight")

(kill | chuck) [form] right point:
	mouse_click(0)
	user.vscode("paredit.killRight")

(kill | chuck) [form] right <user.cursorless_target>:
	user.cursorless_ide_command("paredit.killRight", cursorless_target)

(kill | chuck) [form] left here:
	user.vscode("paredit.killLeft")

(kill | chuck) [form] left point:
	mouse_click(0)
	user.vscode("paredit.killLeft")

(kill | chuck) [form] left <user.cursorless_target>:
	user.cursorless_ide_command("paredit.killLeft", cursorless_target)

(kill | chuck) [form] forward here:
	user.vscode("paredit.killSexpForward")

(kill | chuck) [form] forward point:
	mouse_click(0)
	user.vscode("paredit.killSexpForward")

(kill | chuck) [form] forward <user.cursorless_target>:
	user.cursorless_ide_command("paredit.killSexpForward", cursorless_target)

(kill | chuck) [form] back here:
	user.vscode("paredit.killSexpBackward")

(kill | chuck) [form] back point:
	mouse_click(0)
	user.vscode("paredit.killSexpBackward")

(kill | chuck) [form] back <user.cursorless_target>:
	user.cursorless_ide_command("paredit.killSexpBackward", cursorless_target)

(kill | chuck) (list | collection | seq | seek | sequence) (forward | end | next) here:
	user.vscode("paredit.killListForward")

(kill | chuck) (list | collection | seq | seek | sequence) (forward | end | next) point:
	mouse_click(0)
	user.vscode("paredit.killListForward")

(kill | chuck) (list | collection | seq | seek | sequence) (forward | end | next) <user.cursorless_target>:
	user.cursorless_ide_command("paredit.killListForward", cursorless_target)

(kill | chuck) (list | collection | seq | seek | sequence) (back | start | last) here:
	user.vscode("paredit.killListBackward")

(kill | chuck) (list | collection | seq | seek | sequence) (back | start | last) point:
	mouse_click(0)
	user.vscode("paredit.killListBackward")

(kill | chuck) (list | collection | seq | seek | sequence) (back | start | last) <user.cursorless_target>:
	user.cursorless_ide_command("paredit.killListBackward", cursorless_target)

splice | unwrap here:
	user.vscode("paredit.spliceSexp")

splice | unwrap point:
	mouse_click(0)
	user.vscode("paredit.spliceSexp")

splice | unwrap <user.cursorless_target>:
	user.cursorless_ide_command("paredit.spliceSexp", cursorless_target)

(splice | unwrap) [and] kill back here:
	user.vscode("paredit.spliceSexpKillBackward")

(splice | unwrap) [and] kill back point:
	mouse_click(0)
	user.vscode("paredit.spliceSexpKillBackward")

(splice | unwrap) [and] kill back <user.cursorless_target>:
	user.cursorless_ide_command("paredit.spliceSexpKillBackward", cursorless_target)

(splice | unwrap) [and] kill forward here:
	user.vscode("paredit.spliceSexpKillForward")

(splice | unwrap) [and] kill forward point:
	mouse_click(0)
	user.vscode("paredit.spliceSexpKillForward")

(splice | unwrap) [and] kill forward <user.cursorless_target>:
	user.cursorless_ide_command("paredit.spliceSexpKillForward", cursorless_target)

raise form here:
	user.vscode("paredit.raiseSexp")

raise form point:
	mouse_click(0)
	user.vscode("paredit.raiseSexp")

raise form <user.cursorless_target>:
	user.cursorless_ide_command("paredit.raiseSexp", cursorless_target)

#------------------:moving

(indent | push) [(form | line)] here:
	user.vscode("calva-fmt.tabIndent")

(indent | push) [(form | line)] point:
	mouse_click(0)
	user.vscode("calva-fmt.tabIndent")

(indent | push) [(form | line)] <user.cursorless_target>:
	user.cursorless_ide_command("calva-fmt.tabIndent", cursorless_target)

(dedent | pull) [(form | line)] here:
	user.vscode("calva-fmt.tabDedent")

(dedent | pull) [(form | line)] point:
	mouse_click(0)
	user.vscode("calva-fmt.tabDedent")

(dedent | pull) [(form | line)] <user.cursorless_target>:
	user.cursorless_ide_command("calva-fmt.tabDedent", cursorless_target)

move [form] (up | back | left) here:
	user.vscode("paredit.dragSexprBackward")

move [form] (up | back | left) point:
	mouse_click(0)
	user.vscode("paredit.dragSexprBackward")

move [form] (up | back | left) <user.cursorless_target>:
	user.cursorless_ide_command("paredit.dragSexprBackward", cursorless_target)

move back down here:
	user.vscode("paredit.dragSexprBackwardDown")

move back down point:
	mouse_click(0)
	user.vscode("paredit.dragSexprBackwardDown")

move back down <user.cursorless_target>:
	user.cursorless_ide_command("paredit.dragSexprBackwardDown", cursorless_target)

move back up here:
	user.vscode("paredit.dragSexprBackwardUp")

move back up point:
	mouse_click(0)
	user.vscode("paredit.dragSexprBackwardUp")

move back up <user.cursorless_target>:
	user.cursorless_ide_command("paredit.dragSexprBackwardUp", cursorless_target)

move [form] (down | forward | right) here:
	user.vscode("paredit.dragSexprForward")

move [form] (down | forward | right) point:
	mouse_click(0)
	user.vscode("paredit.dragSexprForward")

move [form] (down | forward | right) <user.cursorless_target>:
	user.cursorless_ide_command("paredit.dragSexprForward", cursorless_target)

move forward up here:
	user.vscode("paredit.dragSexprForwardUp")

move forward up point:
	mouse_click(0)
	user.vscode("paredit.dragSexprForwardUp")

move forward up <user.cursorless_target>:
	user.cursorless_ide_command("paredit.dragSexprForwardUp", cursorless_target)

move forward down here:
	user.vscode("paredit.dragSexprForwardDown")

move forward down point:
	mouse_click(0)
	user.vscode("paredit.dragSexprForwardDown")

move forward down <user.cursorless_target>:
	user.cursorless_ide_command("paredit.dragSexprForwardDown", cursorless_target)

(slurp | slip) [(forward | for it)] here:
	user.vscode("paredit.slurpSexpForward")

(slurp | slip) [(forward | for it)] point:
	mouse_click(0)
	user.vscode("paredit.slurpSexpForward")

(slurp | slip) [(forward | for it)] <user.cursorless_target>:
	user.cursorless_ide_command("paredit.slurpSexpForward", cursorless_target)

(slurp | slip) (backward | back) here:
	user.vscode("paredit.slurpSexpBackward")

(slurp | slip) (backward | back) point:
	mouse_click(0)
	user.vscode("paredit.slurpSexpBackward")

(slurp | slip) (backward | back) <user.cursorless_target>:
	user.cursorless_ide_command("paredit.slurpSexpBackward", cursorless_target)

barf (backward | back) here:
	user.vscode("paredit.barfSexpBackward")

barf (backward | back) point:
	mouse_click(0)
	user.vscode("paredit.barfSexpBackward")

barf (backward | back) <user.cursorless_target>:
	user.cursorless_ide_command("paredit.barfSexpBackward", cursorless_target)

barf [forward] here:
	user.vscode("paredit.barfSexpForward")

barf [forward] point:
	mouse_click(0)
	user.vscode("paredit.barfSexpForward")

barf [forward] <user.cursorless_target>:
	user.cursorless_ide_command("paredit.barfSexpForward", cursorless_target)

(transpose | swap) (forms | expressions) here:
	user.vscode("paredit.transpose")

(transpose | swap) (forms | expressions) point:
	mouse_click(0)
	user.vscode("paredit.transpose")

(transpose | swap) (forms | expressions) <user.cursorless_target>:
	user.cursorless_ide_command("paredit.transpose", cursorless_target)

convolute here:
	user.vscode("paredit.convolute")

convolute point:
	mouse_click(0)
	user.vscode("paredit.convolute")

convolute <user.cursorless_target>:
	user.cursorless_ide_command("paredit.convolute", cursorless_target)

