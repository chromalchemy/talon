app.name: Code
app.name: Cursor
app.name: Windsurf
app.name: Windsurf - Next
mode: command
mode: user.cursorless_spoken_form_test
tag: user.cursorless
-

## Performance Commands
load decompiler:
    user.run_rpc_command("cpt.performance.loadDecompilerDependency")

decompile top level:
    user.run_rpc_command("cpt.performance.decompileTopLevelForm")

decompile unchecked math:
    user.run_rpc_command("cpt.performance.decompileTopLevelFormWithUncheckedMath")

decompile selection:
    user.run_rpc_command("cpt.performance.decompileSelection")

disassemble top level:
    user.run_rpc_command("cpt.performance.disassembleTopLevelForm")

load criterium:
    user.run_rpc_command("cpt.performance.loadCriteriumDependency")

bench top level:
    user.run_rpc_command("cpt.performance.quickBenchTopLevelForm")

bench current form:
    user.run_rpc_command("cpt.performance.quickBenchCurrentForm")

time top level:
    user.run_rpc_command("cpt.performance.timeTopLevelForm")

time current form:
    user.run_rpc_command("cpt.performance.timeCurrentForm")

load profiler:
    user.run_rpc_command("cpt.performance.loadProfilerDependency")

profile top level:
    user.run_rpc_command("cpt.performance.profileTopLevelForm")

profile current form:
    user.run_rpc_command("cpt.performance.profileCurrentForm")

start profiler UI:
    user.run_rpc_command("cpt.performance.startProfilerUI")
