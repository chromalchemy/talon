import subprocess

from talon import Module

mod = Module()

macbook_display_uuid = "37D8832A-2D66-02CA-B9F7-8F30A301B230"
macbook_disply_name = "Color LCD" 

def display_cmd(command_type: str, display_fn: str, display_name: str = "default"):
    if display_name == "default":
        id_cmd = " --UUID=" + macbook_display_uuid
    else:
        id_cmd = ' --name="' + display_name + '"'
    cmd = 'betterdisplaycli ' + command_type + id_cmd + ' --' + display_fn + '; exit 0'
    return cmd

@mod.action_class
class Actions:
    def betterdisplay_print_display_name(display_name: str):
        """testing fn calls"""
        print(f"Display: {display_name}")
        
    def betterdisplay_set(display_fn: str, display_name: str):
        """execute a set betterdisplay command"""
        cmd = display_cmd("set", display_fn, display_name) 
        subprocess.Popen(cmd, shell=True)

    def betterdisplay_toggle(display_fn: str, display_name: str):
        """execute a toggle betterdisplay command"""
        cmd = display_cmd("toggle", display_fn, display_name)
        subprocess.Popen(cmd, shell=True)
