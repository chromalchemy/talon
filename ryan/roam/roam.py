from pickle import BINSTRING
from talon import Module, actions
import re

mod = Module()

#tag: user.roam

# mod.list("roam_tag", desc="Declared Roam tag names")

# @mod.capture(rule="{self.roam_tag}")
# def one_roam_tag(m) -> str:
#     "One Roam Tag"
#     return str(m)

# mod.list("user.ryan.roam.refs.list", desc="Declared Roam reference ids")

# @ctx.action_class("user")
# class UserActions:
@mod.action_class   
class Actions:
    def roam_find_command(text: str):
        """Run Command from command palette"""
        actions.key("cmd-p")
        actions.sleep("100ms")
        actions.user.paste(text)
        actions.sleep("100ms")

    def run_roam_command(text: str):
        """Run Command from command palette"""
        actions.user.roam_find_command(text)
        actions.key("enter")
        actions.sleep("100ms")

    def roam_lower(text: str):
        """Lowercases text"""
        return text.lower()
    
    def roam_go_block_end():
        """go to end of block"""
        actions.key("cmd-a")
        actions.sleep("100ms")
        actions.key("right")
        actions.sleep("100ms")

    def roam_new_block_direct_below():
        """ccc"""
        actions.key("cmd-a")
        actions.sleep("100ms")
        actions.key("right")
        actions.sleep("100ms")
        actions.key("enter")
        actions.sleep("100ms")

    def roam_new_block_below():
        """ccc"""
        actions.key("ctrl-shift-k")
        actions.sleep("700ms")

    def roam_new_block_above():
        """ccc"""
        actions.key("ctrl-shift-u")
        actions.sleep("1000ms")

    def roam_new_child_block():
        """new child block"""
        actions.key("cmd-a")
        actions.sleep("100ms")
        actions.key("right")
        actions.sleep("100ms")
        actions.key("enter")
        actions.sleep("100ms")
        actions.key("tab")
        actions.sleep("100ms")

    def roam_select_block():
        """ """
        actions.key("esc")
        actions.sleep("100ms")

    def roam_select_none():
        """ """
        actions.key("esc:2")
        actions.sleep("100ms")
    
    def roam_select_block_below():
        """select block below"""
        actions.key("esc")
        actions.sleep("100ms")
        actions.key("down")
        actions.sleep("100ms")

    def roam_block_back(n: int):
        """ block back with timeout"""
        if n == 1:
            actions.key("shift-tab")
        else:
            for _ in range(n):
                actions.key("shift-tab")
                actions.sleep("100ms")

    def roam_block_forward(n: int):
        """ block back with timeout"""
        if n == 1:
            actions.key("tab")
        else:
            for _ in range(n):
                actions.key("tab")
                actions.sleep("100ms")

    def roam_block_down(n: int):
        """ block back with timeout"""
        for _ in range(n):
            actions.key("cmd-shift-down")
            actions.sleep("100ms")

    def roam_block_up(n: int):
        """ block back with timeout"""
        for _ in range(n): 
            actions.key("cmd-shift-up")
            actions.sleep("100ms")
            
    def roam_break_block():
        "break block"
        actions.key("enter")
        actions.sleep("300ms")

    def roam_click_block():
        """click inside block and wait to settle"""
        actions.mouse_click(0)
        actions.user.mouse_drag_end()
        actions.sleep("200ms")

    def roam_select_block_text():
        """select block text"""
        actions.edit.select_all()
        actions.sleep("100ms")

    def roam_strip_block_text_whitespace_padding():
        """select block text"""
        actions.edit.select_all()
        actions.sleep("200ms")
        block_str = actions.edit.selected_text()
        actions.edit.delete()
        actions.sleep("300ms")
        x = actions.user.bb_run_fn(block_str, "string-transforms/trim-block", "ryan/clojure/string-fns/")
        actions.sleep("300ms")
        print(x)
        # block_lines = block_str.splitlines()
        # stripped_lines=  [line.rstrip() for line in block_lines]
        # print(stripped_lines)
        # stripped_text = "\n".join(stripped_lines).strip()
        # print("this is striped: ")
        # print(stripped_text)
        # actions.insert(stripped_text)
    
    def roam_cut_block_text():
        """select block text"""
        actions.edit.select_all()
        actions.sleep("100ms")
        actions.edit.cut()

    def roam_go_block_start():
        """select block text"""
        actions.key("shift-home left")

    def roam_select_block_start():
        """select block text"""
        actions.key("shift-home")
            
    def roam_go_block_end():
        """select block text"""
        actions.key("shift-end right")

    def roam_select_block_end():
        """select block text"""
        actions.key("shift-end")

    def roam_cut_block_end():
        """select block text"""
        actions.key("shift-end")
        actions.sleep("300ms")
        actions.edit.cut()
        actions.sleep("300ms")

    def roam_insert_tag(s: str):
        """inserts a formal tag reference string"""
        x = "{{[[" + s + "]]}}"
        actions.insert(x)


    
    def roam_tag(formatter: str, text: str, abbreviation: str, specified_tag: str):
        """"""
        # print(f"Formatter: {formatter}")
        # print(f"Text: {text}")
        # print(f"Abbreviation: {abbreviation}")
        # print(f"specified-tag: {specified_tag}")
        if bool(formatter) and bool(text):
            txt = actions.user.formatted_text(text, formatter)
        else:
            txt = text
        s = abbreviation + specified_tag + txt
        # print(f"final: {s}")
        return s

    def roam_init_send_block_to_date_text():
        """send block to date with string"""
        actions.key("cmd-d")
        actions.sleep("200ms")
        

    def roam_clear_block_to_date_text():
        """clear block to date text"""
        actions.edit.select_all()
        actions.sleep("100ms")
        actions.key("delete")
        actions.sleep("100ms")
        
    
    def roam_exit_block_to_date_text():
        """exit block to date text"""
        actions.sleep("100ms")
        actions.key("tab enter")
        actions.sleep("100ms")
        actions.key("tab:2 enter")
    
    def roam_send_block_to_date_text(date: str):
        """send block to date with string"""
        actions.user.roam_init_send_block_to_date_text()
        actions.user.roam_clear_block_to_date_text()
        actions.insert(date)
        actions.user.roam_exit_block_to_date_text()

    def roam_insert_text_at_beginning_of_block(text: str):
        """insert at beginning of block"""
        actions.user.roam_select_block_text()
        selected_text = actions.edit.selected_text()
        actions.insert(f"{selected_text} #{text}")
        actions.sleep("300ms")
        actions.key("enter")

    def roam_primary_search(text: str = ""):
        """primary search"""
        actions.key("cmd-u")
        if text != "":
            actions.sleep("200ms")
            actions.insert(f"{text}")
            actions.sleep("500ms")
            actions.key("enter")

    def roam_send_block_to_date_by_calendar():
        """send block to date by calendar with teleport extension"""
        actions.key("cmd-alt-shift-t")

    ## roam send block plugin

    #general

    def roam_select_send_block_to_reference_field():
        """send block to reference"""
        print("trying to select field")
        actions.key("left")
        actions.sleep("500ms")
        actions.key("tab")
        actions.sleep("500ms")
        actions.key("right")
        actions.sleep("700ms")

    def roam_select_send_block_to_page_field():
        """send block to page"""
        print("trying to select page field")
        actions.key("right")
        actions.sleep("100ms")

    def roam_close_out_send_block_modal_from_ref_field():
        """close out send block modal"""
        actions.sleep("1600ms")     
        actions.key("tab")
        actions.sleep("200ms")
        actions.key("enter")

    def roam_close_out_send_block_modal_from_page_field():
        """close out send block modal"""
        actions.sleep("1600ms")     
        actions.key("enter tab:2 enter")
    
    
    ## send block to location top

    def roam_start_send_block_to_location_top():
        """start send block to location top"""
        actions.key("cmd-alt-m")
        actions.sleep("2500ms")
    
    def roam_start_send_block_to_reference_top():
        """start send block to reference"""
        actions.user.roam_start_send_block_to_location_top()
        actions.user.roam_select_send_block_to_reference_field()

    def roam_send_block_to_reference_top(reference: str):
        """send block to reference"""
        actions.user.roam_start_send_block_to_reference_top()
        actions.insert(reference)
        actions.user.roam_close_out_send_block_modal_from_ref_field()

    ## send block to page 

    def roam_start_send_block_to_page_top():
        """start send block to page"""
        actions.user.roam_start_send_block_to_location_top()
        actions.user.roam_select_send_block_to_page_field()

    def roam_send_block_to_page_top(page_string: str):
        """send block to page"""
        actions.user.roam_start_send_block_to_page_top()
        actions.insert(page_string)
        actions.user.roam_close_out_send_block_modal_from_page_field()


    ## send block to top of reference and leave reference
    
    def roam_start_send_block_to_location_top_leave_reference():
        """start send block to location"""
        actions.key("cmd-alt-ctrl-m")
        actions.sleep("2500ms")
        
    def roam_start_send_block_to_reference_top_leave_reference():
        """start send block to reference"""
        actions.user.roam_start_send_block_to_location_top_leave_reference()
        actions.user.roam_select_send_block_to_reference_field()

    def roam_send_block_to_reference_top_leave_reference(reference: str):
        """send block to ref and leave ref"""
        actions.user.roam_start_send_block_to_reference_top_leave_reference()
        actions.insert(reference)
        actions.user.roam_close_out_send_block_modal_from_ref_field()

    def roam_start_send_block_to_page_top_and_leave_reference():
        """start send block to page"""
        actions.user.roam_start_send_block_to_location_top_leave_reference()
        actions.user.roam_select_send_block_to_page_field()

    def roam_send_block_to_page_top_and_leave_reference(page_string: str):
        """send block to page and leave ref"""
        actions.user.roam_start_send_block_to_page_top_and_leave_reference()
        actions.insert(page_string)
        actions.user.roam_close_out_send_block_modal_from_page_field()

    ### move to top and sidebar

    def roam_start_send_block_to_location_top_and_sidebar():
        """start send block to top and sidebar"""
        actions.user.run_roam_command("mbts")
        actions.sleep("2500ms")

    def roam_start_send_block_to_reference_top_and_sidebar():
        """start send block to reference"""
        actions.user.roam_start_send_block_to_location_top_and_sidebar()
        actions.user.roam_select_send_block_to_reference_field()

    def roam_send_block_to_reference_top_and_sidebar(reference: str):
        """send block to reference"""
        actions.user.roam_start_send_block_to_reference_top_and_sidebar()
        actions.insert(reference)
        actions.user.roam_close_out_send_block_modal_from_ref_field()

    def roam_start_send_block_to_page_top_and_sidebar():
        """start send block to page"""
        actions.user.roam_start_send_block_to_location_top_and_sidebar()
        actions.user.roam_select_send_block_to_page_field()

    def roam_send_block_to_page_top_and_sidebar(page_string: str):
        """send block to page"""
        actions.user.roam_start_send_block_to_page_top_and_sidebar()
        actions.insert(page_string)
        actions.user.roam_close_out_send_block_modal_from_page_field()

    ### move and zoom

    def roam_start_send_block_to_location_top_and_zoom():
        """start send block to top and sidebar"""
        actions.user.run_roam_command("mbtz")
        actions.sleep("2500ms")

    def roam_start_send_block_to_reference_top_and_zoom():
        """start send block to reference"""
        actions.user.roam_start_send_block_to_location_top_and_zoom()
        actions.user.roam_select_send_block_to_reference_field()

    def roam_send_block_to_reference_top_and_zoom(reference: str):
        """send block to reference"""
        actions.user.roam_start_send_block_to_reference_top_and_zoom()
        actions.insert(reference)
        actions.user.roam_close_out_send_block_modal_from_ref_field()

    def roam_start_send_block_to_page_top_and_zoom():
        """start send block to page"""
        actions.user.roam_start_send_block_to_location_top_and_zoom()
        actions.user.roam_select_send_block_to_page_field()

    def roam_send_block_to_page_top_and_zoom(page_string: str):
        """send block to page"""
        actions.user.roam_start_send_block_to_page_top_and_zoom()
        actions.insert(page_string)
        actions.user.roam_close_out_send_block_modal_from_page_field()

    def roam_select_block_hat(target: str):
        """select block hat"""
        actions.insert(target)
        actions.sleep("300ms")

        