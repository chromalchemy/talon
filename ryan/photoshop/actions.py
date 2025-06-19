import os

from talon import Module, actions
from typing import Optional


def normalize_amount_str(amount: str):
    amount_lower = amount.lower()
    if amount_lower == "max" or amount_lower == "ax":
        return "100"
    elif amount_lower == "half":
        return "50"
    elif "%" in amount:
        return amount.replace("%", "")
    return amount


mod = Module()

@mod.action_class

class Actions:
    def ps_new_background_from_layer():
        """new background from layer"""
        actions.user.menu_select("Layer|New|Background from Layer...")

    def ps_new_group():
        """new group"""
        actions.user.menu_select("Layer|New|Group...")

    def ps_new_group_from_layers():
        """new group from layers"""
        actions.user.menu_select("Layer|New|Group from Layers...")

    def ps_new_artboard():
        """new artboard"""
        actions.user.menu_select("Layer|New|Artboard...")

    def ps_new_artboard_from_group():
        """new artboard from group"""
        actions.user.menu_select("Layer|New|Artboard from Group...")

    def ps_new_artboard_from_layers():
        """new artboard from layers"""
        actions.user.menu_select("Layer|New|Artboard from Layers...")

    def ps_new_frame_from_layers():
        """new frame from layers"""
        actions.user.menu_select("Layer|New|Frame from Layers...")

    def ps_convert_to_frame():
        """convert to frame"""
        actions.user.menu_select("Layer|New|Convert to Frame")

    def ps_new_layer_via_copy():
        """new layer via copy"""
        actions.user.menu_select("Layer|New|Layer Via Copy")

    def ps_new_layer_via_cut():
        """new layer via cut"""
        actions.user.menu_select("Layer|New|Layer Via Cut")

    def ps_copy_css():
        """layer copy css"""
        actions.user.menu_select("Layer|Copy CSS")

    def ps_copy_svg():
        """layer copy svg"""
        actions.user.menu_select("Layer|Copy SVG")

    def ps_duplicate_layer():
        """layer duplicate layer"""
        actions.user.menu_select("Layer|Duplicate Layer...")

    def ps_duplicate_layers():
        """duplicate layers"""
        actions.user.menu_select('Layer|Duplicate Layers...')

    def ps_delete_layer():
        """delete layer"""
        actions.key("delete")
        # actions.user.menu_select("Layer|Delete|Layer")

    def ps_delete_layers():
        """delete layers"""
        actions.user.ps_delete_layer()
        # actions.user.menu_select("Layer|Delete|Layers")

    def ps_delete_group():
        """delete group"""
        actions.user.ps_delete_layer()
        # actions.user.menu_select("Layer|Delete|Group")

    def ps_delete_hidden_layers():
        """layer delete hidden layers"""
        actions.user.menu_select("Layer|Delete|Hidden Layers")

    def ps_export_as():
        """layer export as"""
        actions.user.menu_select("Layer|Export As...")

    def ps_rename_layer():
        """layer rename layer"""
        actions.user.menu_select("Layer|Rename Layer...")

    def ps_rename_artboard():
        """layer rename artboard"""
        actions.user.menu_select("Layer|Rename Artboard...")

    def ps_layer_style_blending_options():
        """layer layer style blending options"""
        actions.user.menu_select("Layer|Layer Style|Blending Options...")

    def ps_layer_style_bevel_and_emboss():
        """layer layer style bevel and emboss"""
        actions.user.menu_select("Layer|Layer Style|Bevel & Emboss...")

    def ps_layer_style_stroke():
        """layer layer style stroke"""
        actions.user.menu_select("Layer|Layer Style|Stroke...")

    def ps_layer_style_inner_shadow():
        """layer layer style inner shadow"""
        actions.user.menu_select("Layer|Layer Style|Inner Shadow...")

    def ps_layer_style_inner_glow():
        """layer layer style inner glow"""
        actions.user.menu_select("Layer|Layer Style|Inner Glow...")

    def ps_layer_style_satin():
        """layer layer style satin"""
        actions.user.menu_select("Layer|Layer Style|Satin...")

    def ps_layer_style_color_overlay():
        """layer layer style color overlay"""
        actions.user.menu_select("Layer|Layer Style|Color Overlay...")

    def ps_layer_style_gradient_overlay():
        """layer layer style gradient overlay"""
        actions.user.menu_select("Layer|Layer Style|Gradient Overlay...")

    def ps_layer_style_pattern_overlay():
        """layer layer style pattern overlay"""
        actions.user.menu_select("Layer|Layer Style|Pattern Overlay...")

    def ps_layer_style_outer_glow():
        """layer layer style outer glow"""
        actions.user.menu_select("Layer|Layer Style|Outer Glow...")

    def ps_layer_style_drop_shadow():
        """layer layer style drop shadow"""
        actions.user.menu_select("Layer|Layer Style|Drop Shadow...")

    def ps_layer_style_copy_layer_style():
        """layer layer style copy layer style"""
        actions.user.menu_select("Layer|Layer Style|Copy Layer Style")
        # actions.key("cmd-ctrl-c")

    def ps_layer_style_paste_layer_style():
        """layer layer style paste layer style"""
        actions.user.menu_select("Layer|Layer Style|Paste Layer Style")
        # actions.key("cmd-ctrl-v")

    def ps_layer_style_clear_layer_style():
        """layer layer style clear layer style"""
        actions.user.menu_select("Layer|Layer Style|Clear Layer Style")

    def ps_layer_style_global_light():
        """layer layer style global light"""
        actions.user.menu_select("Layer|Layer Style|Global Light...")

    def ps_layer_style_create_layer():
        """layer layer style create layer"""
        actions.user.menu_select("Layer|Layer Style|Create Layer")

    def ps_layer_style_hide_all_effects():
        """layer layer style hide all effects"""
        actions.user.menu_select("Layer|Layer Style|Hide All Effects")

    def ps_layer_style_scale_effects():
        """layer layer style scale effects"""
        actions.user.menu_select("Layer|Layer Style|Scale Effects...")

    def ps_smart_filter():
        """layer smart filter"""
        actions.user.menu_select("Layer|Smart Filter")


    ## Adjustment Layers

    def ps_new_adjustment_layer(adjustment_name: str):
        """New adjustment layer"""
        fill_layers = ["Solid Color", "Gradient", "Pattern"]
        if adjustment_name in fill_layers:
            actions.user.menu_select(f"Layer|New Fill Layer|{adjustment_name}...")
        else:
            actions.user.menu_select(f"Layer|New Adjustment Layer|{adjustment_name}...")

    def ps_layer_content_options():
        """layer layer content options"""
        actions.user.menu_select("Layer|Layer Content Options")

    def ps_layer_mask_reveal_all():
        """layer layer mask reveal all"""
        actions.user.menu_select("Layer|Layer Mask|Reveal All")

    def ps_layer_mask_hide_all():
        """layer layer mask hide all"""
        actions.user.menu_select("Layer|Layer Mask|Hide All")

    def ps_layer_mask_reveal_selection():
        """layer layer mask reveal selection"""
        actions.user.menu_select("Layer|Layer Mask|Reveal Selection")

    def ps_layer_mask_hide_selection():
        """layer layer mask hide selection"""
        actions.user.menu_select("Layer|Layer Mask|Hide Selection")

    def ps_layer_mask_from_transparency():
        """layer layer mask from transparency"""
        actions.user.menu_select("Layer|Layer Mask|From Transparency")

    def ps_layer_mask_delete():
        """layer layer mask delete"""
        actions.user.menu_select("Layer|Layer Mask|Delete")

    def ps_layer_mask_apply():
        """layer layer mask apply"""
        actions.user.menu_select("Layer|Layer Mask|Apply")

    def ps_layer_mask_enable():
        """layer layer mask enable"""
        actions.user.menu_select("Layer|Layer Mask|Enable")

    def ps_layer_mask_link():
        """layer layer mask link"""
        actions.user.menu_select("Layer|Layer Mask|Link")

    def ps_vector_mask_reveal_all():
        """layer vector mask reveal all"""
        actions.user.menu_select("Layer|Vector Mask|Reveal All")

    def ps_vector_mask_hide_all():
        """layer vector mask hide all"""
        actions.user.menu_select("Layer|Vector Mask|Hide All")

    def ps_vector_mask_current_path():
        """layer vector mask current path"""
        actions.user.menu_select("Layer|Vector Mask|Current Path")

    def ps_vector_mask_delete():
        """layer vector mask delete"""
        actions.user.menu_select("Layer|Vector Mask|Delete")

    def ps_vector_mask_enable():
        """layer vector mask enable"""
        actions.user.menu_select("Layer|Vector Mask|Enable")

    def ps_vector_mask_link():
        """layer vector mask link"""
        actions.user.menu_select("Layer|Vector Mask|Link")

    def ps_create_clipping_mask():
        """layer create clipping mask"""
        actions.user.menu_select("Layer|Create Clipping Mask")

    def ps_mask_all_objects():
        """layer mask all objects"""
        actions.user.menu_select("Layer|Mask All Objects")

    def ps_smart_objects_convert_to_smart_object():
        """layer smart objects convert to smart object"""
        actions.user.menu_select("Layer|Smart Objects|Convert to Smart Object")
        actions.key("ctrl-f11")

    def ps_smart_objects_new_smart_object_via_copy():
        """layer smart objects new smart object via copy"""
        actions.user.menu_select("Layer|Smart Objects|New Smart Object via Copy")

    def ps_smart_objects_reveal_in_finder():
        """layer smart objects reveal in finder"""
        actions.user.menu_select("Layer|Smart Objects|Reveal in Finder")

    def ps_smart_objects_update_modified_content():
        """layer smart objects update modified content"""
        actions.user.menu_select("Layer|Smart Objects|Update Modified Content")

    def ps_smart_objects_update_all_modified_content():
        """layer smart objects update all modified content"""
        actions.user.menu_select("Layer|Smart Objects|Update All Modified Content")

    def ps_smart_objects_edit_contents():
        """layer smart objects edit contents"""
        actions.user.menu_select("Layer|Smart Objects|Edit Contents")

    def ps_smart_objects_reset_transform():
        """layer smart objects reset transform"""
        actions.user.menu_select("Layer|Smart Objects|Reset Transform")

    def ps_smart_objects_relink_to_file():
        """layer smart objects relink to file"""
        actions.user.menu_select("Layer|Smart Objects|Relink to File...")

    def ps_smart_objects_relink_to_library_graphic():
        """layer smart objects relink to library graphic"""
        actions.user.menu_select("Layer|Smart Objects|Relink to Library Graphic...")

    def ps_smart_objects_replace_contents():
        """layer smart objects replace contents"""
        actions.user.menu_select("Layer|Smart Objects|Replace Contents...")

    def ps_smart_objects_export_contents():
        """layer smart objects export contents"""
        actions.user.menu_select("Layer|Smart Objects|Export Contents...")

    def ps_smart_objects_embed_linked():
        """layer smart objects embed linked"""
        actions.user.menu_select("Layer|Smart Objects|Embed Linked")

    def ps_smart_objects_embed_all_linked():
        """layer smart objects embed all linked"""
        actions.user.menu_select("Layer|Smart Objects|Embed All Linked")

    def ps_smart_objects_convert_to_linked():
        """layer smart objects convert to linked"""
        actions.user.menu_select("Layer|Smart Objects|Convert to Linked...")

    def ps_smart_objects_convert_to_layers():
        """layer smart objects convert to layers"""
        actions.user.menu_select("Layer|Smart Objects|Convert to Layers")

    def ps_smart_objects_stack_mode():
        """layer smart objects stack mode"""
        actions.user.menu_select("Layer|Smart Objects|Stack Mode")

    def ps_smart_objects_rasterize():
        """layer smart objects rasterize"""
        actions.user.menu_select("Layer|Smart Objects|Rasterize")

    def ps_video_layers():
        """layer video layers"""
        actions.user.menu_select("Layer|Video Layers")

    def ps_rasterize_type():
        """layer rasterize type"""
        actions.user.menu_select("Layer|Rasterize|Type")

    def ps_rasterize_shape():
        """layer rasterize shape"""
        actions.user.menu_select("Layer|Rasterize|Shape")

    def ps_rasterize_fill_content():
        """layer rasterize fill content"""
        actions.user.menu_select("Layer|Rasterize| Content")

    def ps_rasterize_vector_mask():
        """layer rasterize vector mask"""
        actions.user.menu_select("Layer|Rasterize|Vector Mask")

    def ps_rasterize_smart_obiect():
        """layer rasterize smart obiect"""
        actions.user.menu_select("Layer|Rasterize|Smart Obiect")

    def ps_rasterize_generative():
        """layer rasterize generative"""
        actions.user.menu_select("Layer|Rasterize|Generative")

    def ps_rasterize_video():
        """layer rasterize video"""
        actions.user.menu_select("Layer|Rasterize|Video")

    def ps_rasterize_3d():
        """layer rasterize 3d"""
        actions.user.menu_select("Layer|Rasterize|3D")

    def ps_rasterize_layer_style():
        """layer rasterize layer style"""
        actions.user.menu_select("Layer|Rasterize|Layer Style")

    def ps_rasterize_layer():
        """layer rasterize layer"""
        actions.user.menu_select("Layer|Rasterize|Layer")

    def ps_rasterize_all_layers():
        """layer rasterize all layers"""
        actions.user.menu_select("Layer|Rasterize|All Layers")

    def ps_new_layer_based_slice():
        """layer new layer based slice"""
        actions.user.menu_select("Layer|New Layer Based Slice")

    def ps_group_layers():
        """layer group layers"""
        actions.user.menu_select("Layer|Group Layers")

    def ps_ungroup_layers():
        """layer ungroup layers"""
        actions.user.menu_select("Layer|Ungroup Layers")

    def ps_hide_layers():
        """layer hide layers"""
        actions.user.menu_select("Layer|Hide Layers")

    def ps_arrange_bring_to_front():
        """layer arrange bring to front"""
        actions.user.menu_select("Layer|Arrange|Bring to Front")

    def ps_arrange_bring_forward():
        """layer arrange bring forward"""
        actions.user.menu_select("Layer|Arrange|Bring Forward")

    def ps_arrange_send_backward():
        """layer arrange send backward"""
        actions.user.menu_select("Layer|Arrange|Send Backward")

    def ps_arrange_send_to_back():
        """layer arrange send to back"""
        actions.user.menu_select("Layer|Arrange|Send to Back")

    def ps_arrange_reverse():
        """layer arrange reverse"""
        actions.user.menu_select("Layer|Arrange|Reverse")

    def ps_combine_shapes_unite_shapes():
        """layer combine shapes unite shapes"""
        actions.user.menu_select("Layer|Combine Shapes|Unite Shapes")

    def ps_combine_shapes_subtract_front_shape():
        """layer combine shapes subtract front shape"""
        actions.user.menu_select("Layer|Combine Shapes|Subtract Front Shape")

    def ps_combine_shapes_unite_shapes_at_overlap():
        """layer combine shapes unite shapes at overlap"""
        actions.user.menu_select("Layer|Combine Shapes|Unite Shapes at Overlap")

    def ps_combine_shapes_subtract_shapes_at_overlap():
        """layer combine shapes subtract shapes at overlap"""
        actions.user.menu_select("Layer|Combine Shapes|Subtract Shapes at Overlap")

    def ps_align_top_edges():
        """layer align top edges"""
        actions.user.menu_select("Layer|Align|Top Edges")

    def ps_align_vertical_centers():
        """layer align vertical centers"""
        actions.user.menu_select("Layer|Align|Vertical Centers")

    def ps_align_bottom_edges():
        """layer align bottom edges"""
        actions.user.menu_select("Layer|Align|Bottom Edges")

    def ps_align_left_edges():
        """layer align left edges"""
        actions.user.menu_select("Layer|Align|Left Edges")

    def ps_align_horizontal_centers():
        """layer align horizontal centers"""
        actions.user.menu_select("Layer|Align|Horizontal Centers")

    def ps_align_right_edges():
        """layer align right edges"""
        actions.user.menu_select("Layer|Align|Right Edges")

    def ps_align_layers_to_artboard():
        """layer align layers to artboard"""
        actions.user.menu_select("Layer|Align Layers to Artboard")

    def ps_distribute_top_edges():
        """layer distribute top edges"""
        actions.user.menu_select("Layer|Distribute|Top Edges")

    def ps_distribute_vertical_centers():
        """layer distribute vertical centers"""
        actions.user.menu_select("Layer|Distribute|Vertical Centers")

    def ps_distribute_bottom_edges():
        """layer distribute bottom edges"""
        actions.user.menu_select("Layer|Distribute|Bottom Edges")

    def ps_distribute_left_edges():
        """layer distribute left edges"""
        actions.user.menu_select("Layer|Distribute|Left Edges")

    def ps_distribute_horizontal_centers():
        """layer distribute horizontal centers"""
        actions.user.menu_select("Layer|Distribute|Horizontal Centers")

    def ps_distribute_right_edges():
        """layer distribute right edges"""
        actions.user.menu_select("Layer|Distribute|Right Edges")

    def ps_distribute_horizontally():
        """layer distribute horizontally"""
        actions.user.menu_select("Layer|Distribute|Horizontally")

    def ps_distribute_vertically():
        """layer distribute vertically"""
        actions.user.menu_select("Layer|Distribute|Vertically")

    def ps_lock_layers():
        """layer lock layers"""
        actions.user.menu_select("Layer|Lock Layers...")
        # actions.key(cmd-/)

    def ps_link_layers():
        """layer link layers"""
        actions.user.menu_select("Layer|Link Layers")

    def ps_select_linked_layers():
        """layer select linked layers"""
        actions.user.menu_select("Layer|Select Linked Layers")

    def ps_merge_layers():
        """layer merge layers"""
        actions.user.menu_select("Layer|Merge Layers")

    def ps_merge_visible():
        """layer merge visible"""
        actions.user.menu_select("Layer|Merge Visible")

    def ps_flatten_image():
        """layer flatten image"""
        actions.user.menu_select("Layer|Flatten Image")

    def ps_matting_color_decontaminate():
        """layer matting color decontaminate"""
        actions.user.menu_select("Layer|Matting|Color Decontaminate")

    def ps_matting_defringe():
        """layer matting defringe"""
        actions.user.menu_select("Layer|Matting|Defringe...")

    def ps_matting_remove_black_matte():
        """layer matting remove black matte"""
        actions.user.menu_select("Layer|Matting|Remove Black Matte")

    def ps_matting_remove_white_matte():
        """layer matting remove white matte"""
        actions.user.menu_select("Layer|Matting|Remove White Matte")

    def ps_type_more_from_adobe_fonts():
        """type more from adobe fonts"""
        actions.user.menu_select("Type|More from Adobe Fonts...")

    def ps_type_panels_character_panel():
        """type panels character panel"""
        actions.user.menu_select("Type|Panels|Character Panel")

    def ps_type_panels_paragraph_panel():
        """type panels paragraph panel"""
        actions.user.menu_select("Type|Panels|Paragraph Panel")

    def ps_type_panels_glyphs_panel():
        """type panels glyphs panel"""
        actions.user.menu_select("Type|Panels|Glyphs Panel")

    def ps_type_panels_character_styles_panel():
        """type panels character styles panel"""
        actions.user.menu_select("Type|Panels|Character Styles Panel")

    def ps_type_panels_paragraph_styles_panel():
        """type panels paragraph styles panel"""
        actions.user.menu_select("Type|Panels|Paragraph Styles Panel")

    def ps_type_anti_alias_none():
        """type anti alias none"""
        actions.user.menu_select("Type|Anti-Alias|None")

    def ps_type_anti_alias_sharp():
        """type anti alias sharp"""
        actions.user.menu_select("Type|Anti-Alias|Sharp")

    def ps_type_anti_alias_crisp():
        """type anti alias crisp"""
        actions.user.menu_select("Type|Anti-Alias|Crisp")

    def ps_type_anti_alias_strong():
        """type anti alias strong"""
        actions.user.menu_select("Type|Anti-Alias|Strong")

    def ps_type_anti_alias_smooth():
        """type anti alias smooth"""
        actions.user.menu_select("Type|Anti-Alias|Smooth")

    def ps_type_anti_alias_mac_lcd():
        """type anti alias mac lcd"""
        actions.user.menu_select("Type|Anti-Alias|Mac LCD")

    def ps_type_anti_alias_mac():
        """type anti alias mac"""
        actions.user.menu_select("Type|Anti-Alias|Mac")

    def ps_type_orientation_horizontal():
        """type orientation horizontal"""
        actions.user.menu_select("Type|Orientation|Horizontal")

    def ps_type_orientation_vertical():
        """type orientation vertical"""
        actions.user.menu_select("Type|Orientation|Vertical")

    def ps_type_opentype_standard_ligatures():
        """type opentype standard ligatures"""
        actions.user.menu_select("Type|OpenType|Standard Ligatures")

    def ps_type_opentype_contextual_alternates():
        """type opentype contextual alternates"""
        actions.user.menu_select("Type|OpenType|Contextual Alternates")

    def ps_type_opentype_discretionary_ligatures():
        """type opentype discretionary ligatures"""
        actions.user.menu_select("Type|OpenType|Discretionary Ligatures")

    def ps_type_opentype_swash():
        """type opentype swash"""
        actions.user.menu_select("Type|OpenType|Swash")

    def ps_type_opentype_oldstyle():
        """type opentype oldstyle"""
        actions.user.menu_select("Type|OpenType|Oldstyle")

    def ps_type_opentype_stylistic_alternates():
        """type opentype stylistic alternates"""
        actions.user.menu_select("Type|OpenType|Stylistic Alternates")

    def ps_type_opentype_titling_alternates():
        """type opentype titling alternates"""
        actions.user.menu_select("Type|OpenType|Titling Alternates")

    def ps_type_opentype_ornaments():
        """type opentype ornaments"""
        actions.user.menu_select("Type|OpenType|Ornaments")

    def ps_type_opentype_ordinals():
        """type opentype ordinals"""
        actions.user.menu_select("Type|OpenType|Ordinals")

    def ps_type_opentype_fractions():
        """type opentype fractions"""
        actions.user.menu_select("Type|OpenType|Fractions")

    def ps_type_opentype_justification_alternates():
        """type opentype justification alternates"""
        actions.user.menu_select("Type|OpenType|Justification Alternates")

    def ps_type_opentype_japanese_78():
        """type opentype japanese 78"""
        actions.user.menu_select("Type|OpenType|Japanese 78")

    def ps_type_opentype_japanese_expert():
        """type opentype japanese expert"""
        actions.user.menu_select("Type|OpenType|Japanese Expert")

    def ps_type_opentype_japanese_traditional():
        """type opentype japanese traditional"""
        actions.user.menu_select("Type|OpenType|Japanese Traditional")

    def ps_type_opentype_proportional_metrics():
        """type opentype proportional metrics"""
        actions.user.menu_select("Type|OpenType|Proportional Metrics")

    def ps_type_opentype_kana():
        """type opentype kana"""
        actions.user.menu_select("Type|OpenType|Kana")

    def ps_type_opentype_roman_italics():
        """type opentype roman italics"""
        actions.user.menu_select("Type|OpenType|Roman Italics")

    def ps_type_extrude_to_3d():
        """type extrude to 3d"""
        actions.user.menu_select("Type|Extrude to 3D")

    def ps_type_create_work_path():
        """type create work path"""
        actions.user.menu_select("Type|Create Work Path")

    def ps_type_convert_to_shape():
        """type convert to shape"""
        actions.user.menu_select("Type|Convert to Shape")

    def ps_type_rasterize_type_layer():
        """type rasterize type layer"""
        actions.user.menu_select("Type|Rasterize Type Layer")

    def ps_type_convert_to_paragraph_text():
        """type convert to paragraph text"""
        actions.user.menu_select("Type|Convert to Paragraph Text")

    def ps_type_warp_text():
        """type warp text"""
        actions.user.menu_select("Type|Warp Text...")

    def ps_type_match_font():
        """type match font"""
        actions.user.menu_select("Type|Match Font...")

    def ps_type_font_preview_size_none():
        """type font preview size none"""
        actions.user.menu_select("Type|Font Preview Size|None")

    def ps_type_font_preview_size_small():
        """type font preview size small"""
        actions.user.menu_select("Type|Font Preview Size|Small")

    def ps_type_font_preview_size_medium():
        """type font preview size medium"""
        actions.user.menu_select("Type|Font Preview Size|Medium")

    def ps_type_font_preview_size_large():
        """type font preview size large"""
        actions.user.menu_select("Type|Font Preview Size|Large")

    def ps_type_font_preview_size_extra_large():
        """type font preview size extra large"""
        actions.user.menu_select("Type|Font Preview Size|Extra Large")

    def ps_type_font_preview_size_huge():
        """type font preview size huge"""
        actions.user.menu_select("Type|Font Preview Size|Huge")

    def ps_type_language_options():
        """type language options"""
        actions.user.menu_select("Type|Language Options")

    def ps_type_update_all_text_layers():
        """type update all text layers"""
        actions.user.menu_select("Type|Update All Text Layers")

    def ps_type_manage_missing_fonts():
        """type manage missing fonts"""
        actions.user.menu_select("Type|Manage Missing Fonts")

    def ps_type_paste_lorem_ipsum():
        """type paste lorem ipsum"""
        actions.user.menu_select("Type|Paste Lorem Ipsum")

    def ps_type_load_default_type_styles():
        """type load default type styles"""
        actions.user.menu_select("Type|Load Default Type Styles")

    def ps_type_save_default_type_styles():
        """type save default type styles"""
        actions.user.menu_select("Type|Save Default Type Styles")

    def ps_filter_last_filter():
        """filter last filter"""
        actions.user.menu_select("Filter|Last Filter")

    def ps_filter_convert_for_smart_filters():
        """filter convert for smart filters"""
        actions.user.menu_select("Filter|Convert for Smart Filters")

    def ps_filter_neural_filters():
        """filter neural filters"""
        actions.user.menu_select("Filter|Neural Filters...")

    def ps_filter_filter_gallery():
        """filter filter gallery"""
        actions.user.menu_select("Filter|Filter Gallery...")

    def ps_filter_adaptive_wide_angle():
        """filter adaptive wide angle"""
        actions.user.menu_select("Filter|Adaptive Wide Angle...")

    def ps_filter_camera_raw_filter():
        """filter camera raw filter"""
        actions.user.menu_select("Filter|Camera Raw Filter...")

    def ps_filter_lens_correction():
        """filter lens correction"""
        actions.user.menu_select("Filter|Lens Correction...")

    def ps_filter_liquify():
        """filter liquify"""
        actions.user.menu_select("Filter|Liquify...")

    def ps_filter_vanishing_point():
        """filter vanishing point"""
        actions.user.menu_select("Filter|Vanishing Point...")

    def ps_filter_blur_average():
        """blur average"""
        actions.user.menu_select("Filter|Blur|Average")

    def ps_filter_blur_blur():
        """blur"""
        actions.user.menu_select("Filter|Blur|Blur")

    def ps_filter_blur_blur_more():
        """blur more"""
        actions.user.menu_select("Filter|Blur|Blur More")

    def ps_filter_blur_box_blur():
        """box blur"""
        actions.user.menu_select("Filter|Blur|Box Blur...")

    # def ps_filter_blur_live_gaussian_blur():
    #     """live gaussian blur"""
    #     actions.user.menu_select("Filter|Blur|Live Gaussian Blur...")

    def ps_filter_blur_gaussian_blur():
        """gaussian blur"""
        print("gaussian blur from python")
        actions.user.menu_select("Filter|Blur|Gaussian Blur...")

    def ps_filter_blur_lens_blur():
        """lens blur"""
        actions.user.menu_select("Filter|Blur|Lens Blur...")

    def ps_filter_blur_motion_blur():
        """motion blur"""
        actions.user.menu_select("Filter|Blur|Motion Blur...")

    def ps_filter_blur_radial_blur():
        """radial blur"""
        actions.user.menu_select("Filter|Blur|Radial Blur...")

    def ps_filter_blur_shape_blur():
        """shape blur"""
        actions.user.menu_select("Filter|Blur|Shape Blur...")

    def ps_filter_blur_smart_blur():
        """smart blur"""
        actions.user.menu_select("Filter|Blur|Smart Blur...")

    def ps_filter_blur_surface_blur():
        """surface blur"""
        actions.user.menu_select("Filter|Blur|Surface Blur...")

    def ps_filter_blur_gallery_field_blur():
        """gallery field blur"""
        actions.user.menu_select("Filter|Blur Gallery|Field Blur..")

    def ps_filter_blur_gallery_iris_blur():
        """blur gallery iris blur"""
        actions.user.menu_select("Filter|Blur Gallery|Iris Blur...")

    def ps_filter_blur_gallery_tilt_shift():
        """blur gallery tilt shift"""
        actions.user.menu_select("Filter|Blur Gallery|Tilt-Shift...")

    def ps_filter_blur_gallery_path_blur():
        """blur gallery path blur"""
        actions.user.menu_select("Filter|Blur Gallery|Path Blur...")

    def ps_filter_blur_gallery_spin_blur():
        """blur gallery spin blur"""
        actions.user.menu_select("Filter|Blur Gallery|Spin Blur...")

    def ps_filter_distort_displace():
        """filter distort displace"""
        actions.user.menu_select("Filter|Distort|Displace...")

    def ps_filter_distort_pinch():
        """filter distort pinch"""
        actions.user.menu_select("Filter|Distort|Pinch...")

    def ps_filter_distort_polar_coordinates():
        """filter distort polar coordinates"""
        actions.user.menu_select("Filter|Distort|Polar Coordinates...")

    def ps_filter_distort_ripple():
        """filter distort ripple"""
        actions.user.menu_select("Filter|Distort|Ripple...")

    def ps_filter_distort_shear():
        """filter distort shear"""
        actions.user.menu_select("Filter|Distort|Shear...")

    def ps_filter_distort_spherize():
        """filter distort spherize"""
        actions.user.menu_select("Filter|Distort|Spherize...")

    def ps_filter_distort_twirl():
        """filter distort twirl"""
        actions.user.menu_select("Filter|Distort|Twirl...")

    def ps_filter_distort_wave():
        """filter distort wave"""
        actions.user.menu_select("Filter|Distort|Wave...")

    def ps_filter_distort_zigzag():
        """filter distort zigzag"""
        actions.user.menu_select("Filter|Distort|ZigZag...")

    def ps_filter_noise_add_noise():
        """filter noise add noise"""
        actions.user.menu_select("Filter|Noise|Add Noise...")

    def ps_filter_noise_despeckle():
        """filter noise despeckle"""
        actions.user.menu_select("Filter|Noise|Despeckle")

    def ps_filter_noise_dust_and_scratches():
        """filter noise dust and scratches"""
        actions.user.menu_select("Filter|Noise|Dust & Scratches...")

    def ps_filter_noise_median():
        """filter noise median"""
        actions.user.menu_select("Filter|Noise|Median...")

    def ps_filter_noise_reduce_noise():
        """filter noise reduce noise"""
        actions.user.menu_select("Filter|Noise|Reduce Noise...")

    def ps_filter_pixelate_color_halftone():
        """filter pixelate color halftone"""
        actions.user.menu_select("Filter|Pixelate|Color Halftone...")

    def ps_filter_pixelate_crystallize():
        """filter pixelate crystallize"""
        actions.user.menu_select("Filter|Pixelate|Crystallize...")

    def ps_filter_pixelate_facet():
        """filter pixelate facet"""
        actions.user.menu_select("Filter|Pixelate|Facet")

    def ps_filter_pixelate_fragment():
        """filter pixelate fragment"""
        actions.user.menu_select("Filter|Pixelate|Fragment")

    def ps_filter_pixelate_mezzotint():
        """filter pixelate mezzotint"""
        actions.user.menu_select("Filter|Pixelate|Mezzotint...")

    def ps_filter_pixelate_mosaic():
        """filter pixelate mosaic"""
        actions.user.menu_select("Filter|Pixelate|Mosaic...")

    def ps_filter_pixelate_pointillize():
        """filter pixelate pointillize"""
        actions.user.menu_select("Filter|Pixelate|Pointillize...")

    def ps_filter_render_flame():
        """filter render flame"""
        actions.user.menu_select("Filter|Render|Flame...")

    def ps_filter_render_picture_frame():
        """filter render picture frame"""
        actions.user.menu_select("Filter|Render|Picture Frame...")

    def ps_filter_render_tree():
        """filter render tree"""
        actions.user.menu_select("Filter|Render|Tree...")

    def ps_filter_render_clouds():
        """filter render clouds"""
        actions.user.menu_select("Filter|Render|Clouds")

    def ps_filter_render_difference_clouds():
        """filter render difference clouds"""
        actions.user.menu_select("Filter|Render|Difference Clouds")

    def ps_filter_render_fibers():
        """filter render fibers"""
        actions.user.menu_select("Filter|Render|Fibers...")

    def ps_filter_render_lens_flare():
        """filter render lens flare"""
        actions.user.menu_select("Filter|Render|Lens Flare...")

    def ps_filter_render_lighting_effects():
        """filter render lighting effects"""
        actions.user.menu_select("Filter|Render|Lighting Effects...")

    def ps_filter_sharpen_sharpen():
        """filter sharpen sharpen"""
        actions.user.menu_select("Filter|Sharpen|Sharpen")

    def ps_filter_sharpen_sharpen_edges():
        """filter sharpen sharpen edges"""
        actions.user.menu_select("Filter|Sharpen|Sharpen Edges")

    def ps_filter_sharpen_sharpen_more():
        """filter sharpen sharpen more"""
        actions.user.menu_select("Filter|Sharpen|Sharpen More")

    def ps_filter_sharpen_smart_sharpen():
        """filter sharpen smart sharpen"""
        actions.user.menu_select("Filter|Sharpen|Smart Sharpen...")

    def ps_filter_sharpen_unsharp_mask():
        """filter sharpen unsharp mask"""
        actions.user.menu_select("Filter|Sharpen|Unsharp Mask...")

    def ps_filter_stylize_diffuse():
        """filter stylize diffuse"""
        actions.user.menu_select("Filter|Stylize|Diffuse...")

    def ps_filter_stylize_emboss():
        """filter stylize emboss"""
        actions.user.menu_select("Filter|Stylize|Emboss...")

    def ps_filter_stylize_extrude():
        """filter stylize extrude"""
        actions.user.menu_select("Filter|Stylize|Extrude...")

    def ps_filter_stylize_find_edges():
        """filter stylize find edges"""
        actions.user.menu_select("Filter|Stylize|Find Edges")

    def ps_filter_stylize_oil_paint():
        """filter stylize oil paint"""
        actions.user.menu_select("Filter|Stylize|Oil Paint...")

    def ps_filter_stylize_solarize():
        """filter stylize solarize"""
        actions.user.menu_select("Filter|Stylize|Solarize")

    def ps_filter_stylize_tiles():
        """filter stylize tiles"""
        actions.user.menu_select("Filter|Stylize|Tiles...")

    def ps_filter_stylize_trace_contour():
        """filter stylize trace contour"""
        actions.user.menu_select("Filter|Stylize|Trace Contour...")

    def ps_filter_stylize_wind():
        """filter stylize wind"""
        actions.user.menu_select("Filter|Stylize|Wind...")

    def ps_filter_other_custom():
        """filter other custom"""
        actions.user.menu_select("Filter|Other|Custom...")

    def ps_filter_other_high_pass():
        """filter other high pass"""
        actions.user.menu_select("Filter|Other|High Pass...")

    def ps_filter_other_hsb_hsl():
        """filter other hsb hsl"""
        actions.user.menu_select("Filter|Other|HSB/HSL")

    def ps_filter_other_maximum():
        """filter other maximum"""
        actions.user.menu_select("Filter|Other|Maximum...")

    def ps_filter_other_minimum():
        """filter other minimum"""
        actions.user.menu_select("Filter|Other|Minimum...")

    def ps_filter_other_offset():
        """filter other offset"""
        actions.user.menu_select("Filter|Other|Offset...")

    def ps_file_new():
        """file new"""
        actions.user.menu_select("File|New...")

    def ps_file_open():
        """file open"""
        actions.user.menu_select("File|Open...")

    def ps_file_browse_in_bridge():
        """file browse in bridge"""
        actions.user.menu_select("File|Browse in Bridge...")

    def ps_file_open_as_smart_object():
        """file open as smart object"""
        actions.user.menu_select("File|Open as Smart Object...")

    def ps_file_open_recent():
        """file open recent"""
        actions.user.menu_select("File|Open Recent")

    def ps_file_close():
        """file close"""
        actions.user.menu_select("File|Close")

    def ps_file_close_all():
        """file close all"""
        actions.user.menu_select("File|Close All")

    def ps_file_close_others():
        """file close others"""
        actions.user.menu_select("File|Close Others")

    def ps_file_close_and_go_to_bridge():
        """file close and go to bridge"""
        actions.user.menu_select("File|Close and Go to Bridge...")

    def ps_file_save():
        """file save"""
        actions.user.menu_select("File|Save")

    def ps_file_save_as():
        """file save as"""
        actions.user.menu_select("File|Save As...")

    def ps_file_save_a_copy():
        """file save a copy"""
        actions.user.menu_select("File|Save a Copy...")

    def ps_file_revert():
        """file revert"""
        actions.user.menu_select("File|Revert")

    def ps_file_invite_to_edit():
        """file invite to edit"""
        actions.user.menu_select("File|Invite to Edit...")

    def ps_file_share_for_review_new():
        """file share for review new"""
        actions.user.menu_select("File|Share for Review NEW...")

    def ps_file_export_quick_export_as(file_extension: str):
        """file export quick export as <file_extension>"""
        actions.user.menu_select(f"File|Export|Quick Export as {file_extension}")

    def ps_file_export_export_as():
        """file export export as"""
        actions.user.menu_select("File|Export|Export As...")

    def ps_file_export_export_preferences():
        """file export export preferences"""
        actions.user.menu_select("File|Export|Export Preferences...")

    def ps_file_export_save_for_web_legacy():
        """file export save for web legacy"""
        actions.user.menu_select("File|Export|Save for Web (Legacy)...")

    def ps_file_export_artboards_to_files():
        """file export artboards to files"""
        actions.user.menu_select("File|Export|Artboards to Files...")

    def ps_file_export_artboards_to_pdf():
        """file export artboards to pdf"""
        actions.user.menu_select("File|Export|Artboards to PDF...")

    def ps_file_export_export_for_aero():
        """file export export for aero"""
        actions.user.menu_select("File|Export|Export For Aero...")

    def ps_file_export_layer_comps_to_files():
        """file export layer comps to files"""
        actions.user.menu_select("File|Export|Layer Comps to Files...")

    def ps_file_export_layer_comps_to_pdf():
        """file export layer comps to pdf"""
        actions.user.menu_select("File|Export|Layer Comps to PDF...")

    def ps_file_export_layers_to_files():
        """file export layers to files"""
        actions.user.menu_select("File|Export|Layers to Files...")

    def ps_file_export_color_lookup_tables():
        """file export color lookup tables"""
        actions.user.menu_select("File|Export|Color Lookup Tables...")

    def ps_file_export_data_sets_as_files():
        """file export data sets as files"""
        actions.user.menu_select("File|Export|Data Sets as Files...")

    def ps_file_export_paths_to_illustrator():
        """file export paths to illustrator"""
        actions.user.menu_select("File|Export|Paths to Illustrator...")

    def ps_file_export_render_video():
        """file export render video"""
        actions.user.menu_select("File|Export|Render Video...")

    def ps_file_search_adobe_stock():
        """file search adobe stock"""
        actions.user.menu_select("File|Search Adobe Stock...")

    def ps_file_search_adobe_express_templates():
        """file search adobe express templates"""
        actions.user.menu_select("File|Search Adobe Express Templates...")

    def ps_file_place_embedded():
        """file place embedded"""
        actions.user.menu_select("File|Place Embedded...")

    def ps_file_place_linked():
        """file place linked"""
        actions.user.menu_select("File|Place Linked...")

    def ps_file_package():
        """file package"""
        actions.user.menu_select("File|Package...")

    def ps_file_automate_batch():
        """file automate batch"""
        actions.user.menu_select("File|Automate|Batch...")

    def ps_file_automate_pdf_presentation():
        """file automate pdf presentation"""
        actions.user.menu_select("File|Automate|PDF Presentation...")

    def ps_file_automate_create_droplet():
        """file automate create droplet"""
        actions.user.menu_select("File|Automate|Create Droplet...")

    def ps_file_automate_crop_and_straighten_photos():
        """file automate crop and straighten photos"""
        actions.user.menu_select("File|Automate|Crop and Straighten Photos")

    def ps_file_automate_contact_sheet_ii():
        """file automate contact sheet ii"""
        actions.user.menu_select("File|Automate|Contact Sheet II...")

    def ps_file_automate_conditional_mode_change():
        """file automate conditional mode change"""
        actions.user.menu_select("File|Automate|Conditional Mode Change...")

    def ps_file_automate_fit_image():
        """file automate fit image"""
        actions.user.menu_select("File|Automate|Fit Image...")

    def ps_file_automate_lens_correction():
        """file automate lens correction"""
        actions.user.menu_select("File|Automate|Lens Correction...")

    def ps_file_automate_merge_to_hdr_pro():
        """file automate merge to hdr pro"""
        actions.user.menu_select("File|Automate|Merge to HDR Pro...")

    def ps_file_automate_photomerge():
        """file automate photomerge"""
        actions.user.menu_select("File|Automate|Photomerge...")

    def ps_scripts_image_processor():
        """file scripts image processor"""
        actions.user.menu_select("File|Scripts|Image Processor...")

    def ps_scripts_delete_all_empty_layers():
        """file scripts delete all empty layers"""
        actions.user.menu_select("File|Scripts|Delete All Empty Layers")

    def ps_scripts_flatten_all_layer_effects():
        """file scripts flatten all layer effects"""
        actions.user.menu_select("File|Scripts|Flatten All Layer Effects")

    def ps_scripts_flatten_all_masks():
        """file scripts flatten all masks"""
        actions.user.menu_select("File|Scripts|Flatten All Masks")

    def ps_scripts_advanced_font_remapping():
        """file scripts m advanced font remapping 1 0"""
        actions.user.menu_select("File|Scripts|[M] Advanced Font Remapping 1.0")

    def ps_scripts_align_to_baseline():
        """file scripts m align to baseline 1 1"""
        actions.user.menu_select("File|Scripts|[M] Align to baseline 1.1")

    def ps_scripts_clear_hidden_effects():
        """file scripts m clear hidden effects 1 1"""
        actions.user.menu_select("File|Scripts|[M] Clear hidden effects 1.1")

    def ps_scripts_delete_all_empty_layers_faster():
        """file scripts m delete all empty layers faster v1 1"""
        actions.user.menu_select("File|Scripts|[M] Delete all empty layers faster v1.1")

    def ps_scripts_delete_unused_layers():
        """file scripts m delete unused layers 1 0"""
        actions.user.menu_select("File|Scripts|[M] Delete unused layers 1.0")

    def ps_scripts_fix_font_weight():
        """file scripts m fix font weight 1 0"""
        actions.user.menu_select("File|Scripts|[M] Fix Font Weight 1.0")

    def ps_scripts_live_shape_resurrection():
        """file scripts m live shape resurrection v1 1"""
        actions.user.menu_select("File|Scripts|[M] Live shape resurrection v1.1")

    def ps_scripts_remove_unused_filters():
        """file scripts m remove unused filters 1 0"""
        actions.user.menu_select("File|Scripts|[M] Remove unused filters 1.0")

    def ps_scripts_text_columns():
        """file scripts m text columns 1 1"""
        actions.user.menu_select("File|Scripts|[M] Text columns 1.1")

    def ps_scripts_toggle_locks():
        """file scripts m toggle locks 1 0"""
        actions.user.menu_select("File|Scripts|[M] Toggle locks 1.0")

    def ps_scripts_transform_with_style():
        """file scripts m transform with style 1 1"""
        actions.user.menu_select("File|Scripts|[M] Transform with style 1.1")

    def ps_scripts_undeform():
        """file scripts m undeform 1 1"""
        actions.user.menu_select("File|Scripts|[M] Undeform 1.1")

    def ps_scripts_unsmart():
        """file scripts m unsmart 2 1 3"""
        actions.user.menu_select("File|Scripts|[M] Unsmart 2.1.3")

    def ps_scripts_load_files_into_stack():
        """file scripts load files into stack"""
        actions.user.menu_select("File|Scripts|Load Files into Stack...")

    def ps_scripts_statistics():
        """file scripts statistics"""
        actions.user.menu_select("File|Scripts|Statistics...")

    def ps_scripts_browse():
        """file scripts browse"""
        actions.user.menu_select("File|Scripts|Browse...")

    def ps_file_insert_from_iphone():
        """iport from ios iphone 2"""
        actions.user.menu_select("File|Import from iPhone|iPhone (2)")

    def ps_file_insert_from_iphone_take_photo():
        """iport from ios take photo"""
        actions.user.menu_select("File|Import from iPhone|Take Photo")

    def ps_file_insert_from_iphone_scan_documents():
        """iport from ios scan documents"""
        actions.user.menu_select('File|Import from iPhone|Scan Documents')

    def ps_file_insert_from_iphone_add_sketch():
        """iport from ios add sketch"""
        actions.user.menu_select("File|Import from iPhone|Add Sketch")

    def ps_file_file_info():
        """file file info"""
        actions.user.menu_select("File|File Info...")



    def ps_file_print_one_copy():
        """file print one copy"""
        actions.user.menu_select("File|Print One Copy")

    def ps_select_all():
        """select all"""
        actions.user.menu_select("Select|All")

    def ps_select_deselect():
        """select deselect"""
        actions.user.menu_select("Select|Deselect")
        # actions.key(cmd-d)

    def ps_select_reselect():
        """select reselect"""
        actions.user.menu_select("Select|Reselect")

    def ps_select_inverse():
        """select inverse"""
        actions.user.menu_select("Select|Inverse")

    def ps_select_all_layers():
        """select all layers"""
        actions.user.menu_select("Select|All Layers")

    def ps_select_deselect_layers():
        """select deselect layers"""
        actions.user.menu_select("Select|Deselect Layers")

    def ps_select_find_layers():
        """select find layers"""
        actions.user.menu_select("Select|Find Layers")

    def ps_select_isolate_layers():
        """select isolate layers"""
        actions.user.menu_select("Select|Isolate Layers")

    def ps_select_color_range():
        """select color range"""
        actions.user.menu_select("Select|Color Range...")

    def ps_select_focus_area():
        """select focus area"""
        actions.user.menu_select("Select|Focus Area...")

    def ps_select_subject():
        """select subject"""
        actions.user.menu_select("Select|Subject")

    def ps_select_sky():
        """select sky"""
        actions.user.menu_select("Select|Sky")

    def ps_select_select_and_mask():
        """select select and mask"""
        actions.user.menu_select("Select|Select and Mask...")

    def ps_select_modify_border(border_amount: Optional[str] = None):
        """select modify border"""
        print(f"border_amount: {border_amount}" )
        actions.user.menu_select("Select|Modify|Border...")
        if border_amount is not None:
            actions.insert(border_amount)
            actions.sleep("200ms")
            actions.key("enter")
        
    def ps_select_modify_smooth():
        """select modify smooth"""
        actions.user.menu_select("Select|Modify|Smooth...")

    def ps_select_modify_expand():
        """select modify expand"""
        actions.user.menu_select("Select|Modify|Expand...")

    def ps_select_modify_contract():
        """select modify contract"""
        actions.user.menu_select("Select|Modify|Contract...")

    def ps_select_modify_feather():
        """select modify feather"""
        actions.user.menu_select("Select|Modify|Feather...")

    def ps_select_grow():
        """select grow"""
        actions.user.menu_select("Select|Grow")

    def ps_select_similar():
        """select similar"""
        actions.user.menu_select("Select|Similar")

    def ps_select_transform_selection():
        """select transform selection"""
        actions.user.menu_select("Select|Transform Selection")

    def ps_select_edit_in_quick_mask_mode():
        """select edit in quick mask mode"""
        actions.user.menu_select("Select|Edit in Quick Mask Mode")
        # actions.user.key("q")

    def ps_select_load_selection():
        """select load selection"""
        actions.user.menu_select("Select|Load Selection...")

    def ps_select_save_selection():
        """select save selection"""
        actions.user.menu_select("Select|Save Selection...")

    def ps_select_new_3d_extrusion():
        """select new 3d extrusion"""
        actions.user.menu_select("Select|New 3D Extrusion")

    def ps_view_proof_setup():
        """view proof setup"""
        actions.user.menu_select("View|Proof Setup")

    def ps_view_proof_colors():
        """view proof colors"""
        actions.user.menu_select("View|Proof Colors")

    def ps_view_gamut_warning():
        """view gamut warning"""
        actions.user.menu_select("View|Gamut Warning")

    def ps_view_pixel_aspect_ratio():
        """view pixel aspect ratio"""
        actions.user.menu_select("View|Pixel Aspect Ratio")

    def ps_view_pixel_aspect_ratio_correction():
        """view pixel aspect ratio correction"""
        actions.user.menu_select("View|Pixel Aspect Ratio Correction")

    def ps_view_32_bit_preview_options():
        """view 32 bit preview options"""
        actions.user.menu_select("View|32-bit Preview Options...")

    def ps_view_zoom_in():
        """view zoom in"""
        actions.user.menu_select("View|Zoom In")

    def ps_view_zoom_out():
        """view zoom out"""
        actions.user.menu_select("View|Zoom Out")

    def ps_view_fit_on_screen():
        """view fit on screen"""
        actions.user.menu_select("View|Fit on Screen")

    def ps_view_fit_layers_on_screen():
        """view fit layers on screen"""
        actions.user.menu_select("View|Fit Layers on Screen")

    def ps_view_fit_artboard_on_screen():
        """view fit artboard on screen"""
        actions.user.menu_select("View|Fit Artboard on Screen")

    def ps_view_100():
        """view 100"""
        actions.user.menu_select("View|100%")

    def ps_view_200():
        """view 200"""
        actions.user.menu_select("View|200%")

    def ps_view_print_size():
        """view print size"""
        actions.user.menu_select("View|Print Size")

    def ps_view_actual_size():
        """view actual size"""
        actions.user.menu_select("View|Actual Size")

    def ps_view_flip_horizontal():
        """view flip horizontal"""
        actions.user.menu_select("View|Flip Horizontal")

    def ps_view_pattern_preview():
        """view pattern preview"""
        actions.user.menu_select("View|Pattern Preview")

    def ps_view_screen_mode_standard_screen_mode():
        """view screen mode standard screen mode"""
        actions.user.menu_select("View|Screen Mode|Standard Screen Mode")

    def ps_view_screen_mode_full_screen_mode_with_menu_bar():
        """view screen mode full screen mode with menu bar"""
        actions.user.menu_select("View|Screen Mode|Full Screen Mode With Menu Bar")

    def ps_view_screen_mode_full_screen_mode():
        """view screen mode full screen mode"""
        actions.user.menu_select("View|Screen Mode|Full Screen Mode")

    def ps_view_extras():
        """view extras"""
        actions.user.menu_select("View|Extras")

    def ps_view_show_layer_edges():
        """view show layer edges"""
        actions.user.menu_select("View|Show|Layer Edges")

    def ps_view_show_selection_edges():
        """view show selection edges"""
        actions.user.menu_select("View|Show|Selection Edges")

    def ps_view_show_target_path():
        """view show target path"""
        actions.user.menu_select("View|Show|Target Path")

    def ps_view_show_grid():
        """view show grid"""
        actions.user.menu_select("View|Show|Grid")

    def ps_view_show_guides():
        """view show guides"""
        actions.user.menu_select("View|Show|Guides")

    def ps_view_show_canvas_guides():
        """view show canvas guides"""
        actions.user.menu_select("View|Show|Canvas Guides")

    def ps_view_show_artboard_guides():
        """view show artboard guides"""
        actions.user.menu_select("View|Show|Artboard Guides")

    def ps_view_show_artboard_names():
        """view show artboard names"""
        actions.user.menu_select("View|Show|Artboard Names")

    def ps_view_show_count():
        """view show count"""
        actions.user.menu_select("View|Show|Count")

    def ps_view_show_smart_guides():
        """view show smart guides"""
        actions.user.menu_select("View|Show|Smart Guides")

    def ps_view_show_slices():
        """view show slices"""
        actions.user.menu_select("View|Show|Slices")

    def ps_view_show_notes():
        """view show notes"""
        actions.user.menu_select("View|Show|Notes")

    def ps_view_show_pixel_grid():
        """view show pixel grid"""
        actions.user.menu_select("View|Show|Pixel Grid")

    def ps_view_show_pattern_preview_tile_bounds():
        """view show pattern preview tile bounds"""
        actions.user.menu_select("View|Show|Pattern Preview Tile Bounds")

    def ps_view_show_3d_secondary_view():
        """view show 3d secondary view"""
        actions.user.menu_select("View|Show|3D Secondary View")

    def ps_view_show_3d_ground_plane():
        """view show 3d ground plane"""
        actions.user.menu_select("View|Show|3D Ground Plane")

    def ps_view_show_3d_lights():
        """view show 3d lights"""
        actions.user.menu_select("View|Show|3D Lights")

    def ps_view_show_3d_selection():
        """view show 3d selection"""
        actions.user.menu_select("View|Show|3D Selection")

    def ps_view_show_uv_overlay():
        """view show uv overlay"""
        actions.user.menu_select("View|Show|UV Overlay")

    def ps_view_show_3d_mesh_bounding_box():
        """view show 3d mesh bounding box"""
        actions.user.menu_select("View|Show|3D Mesh Bounding Box")

    def ps_view_show_mesh():
        """view show mesh"""
        actions.user.menu_select("View|Show|Mesh")

    def ps_view_show_edit_pins():
        """view show edit pins"""
        actions.user.menu_select("View|Show|Edit Pins")

    def ps_view_show_all():
        """view show all"""
        actions.user.menu_select("View|Show|All")

    def ps_view_show_none():
        """view show none"""
        actions.user.menu_select("View|Show|None")

    def ps_view_show_show_extras_options():
        """view show show extras options"""
        actions.user.menu_select("View|Show|Show Extras Options...")

    def ps_view_rulers():
        """view rulers"""
        actions.user.menu_select("View|Rulers")

    def ps_view_snap():
        """view snap"""
        actions.user.menu_select("View|Snap")

    def ps_view_snap_to_guides():
        """view snap to guides"""
        actions.user.menu_select("View|Snap To|Guides")

    def ps_view_snap_to_grid():
        """view snap to grid"""
        actions.user.menu_select("View|Snap To|Grid")

    def ps_view_snap_to_layers():
        """view snap to layers"""
        actions.user.menu_select("View|Snap To|Layers")

    def ps_view_snap_to_slices():
        """view snap to slices"""
        actions.user.menu_select("View|Snap To|Slices")

    def ps_view_snap_to_artboard_bounds():
        """view snap to artboard bounds"""
        actions.user.menu_select("View|Snap To|Artboard Bounds")

    def ps_view_snap_to_all():
        """view snap to all"""
        actions.user.menu_select("View|Snap To|All")

    def ps_view_snap_to_none():
        """view snap to none"""
        actions.user.menu_select("View|Snap To|None")

    def ps_view_guides_edit_selected_guides():
        """view guides edit selected guides"""
        actions.user.menu_select("View|Guides|Edit Selected Guides")

    def ps_view_guides_lock_guides():
        """view guides lock guides"""
        actions.user.menu_select("View|Guides|Lock Guides")

    def ps_view_guides_clear_guides():
        """view guides clear guides"""
        actions.user.menu_select("View|Guides|Clear Guides")

    def ps_view_guides_clear_selected_guides():
        """view guides clear selected guides"""
        actions.user.menu_select("View|Guides|Clear Selected Guides")

    def ps_view_guides_clear_selected_artboard_guides():
        """view guides clear selected artboard guides"""
        actions.user.menu_select("View|Guides|Clear Selected Artboard Guides")

    def ps_view_guides_clear_canvas_guides():
        """view guides clear canvas guides"""
        actions.user.menu_select("View|Guides|Clear Canvas Guides")

    def ps_view_guides_new_guide():
        """view guides new guide"""
        actions.user.menu_select("View|Guides|New Guide...")

    def ps_view_guides_new_guide_layout():
        """view guides new guide layout"""
        actions.user.menu_select("View|Guides|New Guide Layout..")

    def ps_view_guides_new_guides_from_shape():
        """view guides new guides from shape"""
        actions.user.menu_select("View|Guides|New Guides From Shape")

    def ps_view_lock_slices():
        """view lock slices"""
        actions.user.menu_select("View|Lock Slices")

    def ps_view_clear_slices():
        """view clear slices"""
        actions.user.menu_select("View|Clear Slices")

    def ps_view_customize_touch_bar():
        """view customize touch bar"""
        actions.user.menu_select("View|Customize Touch Bar...")

    def ps_undo():
        """edit undo"""
        actions.user.menu_select("Edit|Undo")

    def ps_redo():
        """edit redo"""
        actions.user.menu_select("Edit|Redo")

    def ps_toggle_last_state():
        """edit toggle last state"""
        actions.user.menu_select("Edit|Toggle Last State")

    def ps_cut():
        """edit cut"""
        actions.user.menu_select("Edit|Cut")

    def ps_copy():
        """edit copy"""
        actions.user.menu_select("Edit|Copy")

    def ps_copy_merged():
        """edit copy merged"""
        actions.user.menu_select("Edit|Copy Merged")

    def ps_paste():
        """edit paste"""
        actions.user.menu_select("Edit|Paste")

    def ps_paste_without_formatting():
        """edit paste special paste without formatting"""
        actions.user.menu_select("Edit|Paste Special|Paste without Formatting")

    def ps_paste_in_place():
        """edit paste special paste in place"""
        actions.user.menu_select("Edit|Paste Special|Paste in Place")

    def ps_paste_into():
        """edit paste special paste into"""
        actions.user.menu_select("Edit|Paste Special|Paste Into")

    def ps_paste_outside():
        """edit paste special paste outside"""
        actions.user.menu_select("Edit|Paste Special|Paste Outside")

    def ps_clear():
        """edit clear"""
        actions.user.menu_select("Edit|Clear")

    def ps_search():
        """edit search"""
        actions.user.menu_select("Edit|Search")

    def ps_check_spelling():
        """edit check spelling"""
        actions.user.menu_select("Edit|Check Spelling...")

    def ps_find_and_replace_text():
        """edit find and replace text"""
        actions.user.menu_select("Edit|Find and Replace Text...")

    def ps_fill():
        """edit fill"""
        actions.user.menu_select("Edit|Fill...")

    def ps_stroke():
        """edit stroke"""
        actions.user.menu_select("Edit|Stroke...")

    def ps_content_aware_fill():
        """edit content aware fill"""
        actions.user.menu_select("Edit|Content-Aware Fill...")

    def ps_generative_fill():
        """edit generative fill"""
        actions.user.menu_select("Edit|Generative Fill...")

    def ps_content_aware_scale():
        """edit content aware scale"""
        actions.user.menu_select("Edit|Content-Aware Scale")

    def ps_puppet_warp():
        """edit puppet warp"""
        actions.user.menu_select("Edit|Puppet Warp")

    def ps_perspective_warp():
        """edit perspective warp"""
        actions.user.menu_select("Edit|Perspective Warp")

    def ps_free_transform():
        """edit free transform"""
        # actions.user.menu_select("Edit|Free Transform")
        actions.key("cmd-t")

    def ps_free_transform_path():
        """edit free transform path"""
        # actions.user.menu_select("Edit|Free Transform Path")
        actions.user.ps_free_transform()

    def ps_transform_again():
        """edit transform again"""
        actions.user.menu_select("Edit|Transform|Again")

    def ps_scale():
        """edit transform scale"""
        actions.user.menu_select("Edit|Transform|Scale")

    def ps_rotate():
        """edit transform rotate"""
        actions.user.menu_select("Edit|Transform|Rotate")

    def ps_skew():
        """edit transform skew"""
        actions.user.menu_select("Edit|Transform|Skew")

    def ps_distort():
        """edit transform distort"""
        actions.user.menu_select("Edit|Transform|Distort")

    def ps_transform_perspective():
        """edit transform perspective"""
        actions.user.menu_select("Edit|Transform|Perspective")

    def ps_warp():
        """edit transform warp"""
        actions.user.menu_select("Edit|Transform|Warp")

    def ps_split_warp_horizontally():
        """edit transform split warp horizontally"""
        actions.user.menu_select("Edit|Transform|Split Warp Horizontally")

    def ps_split_warp_vertically():
        """edit transform split warp vertically"""
        actions.user.menu_select("Edit|Transform|Split Warp Vertically")

    def ps_split_warp_crosswise():
        """edit transform split warp crosswise"""
        actions.user.menu_select("Edit|Transform|Split Warp Crosswise")

    def ps_remove_warp_split():
        """edit transform remove warp split"""
        actions.user.menu_select("Edit|Transform|Remove Warp Split")

    def ps_convert_warp_anchor_point():
        """edit transform convert warp anchor point"""
        actions.user.menu_select("Edit|Transform|Convert warp anchor point")

    def ps_toggle_transform_guides():
        """edit transform toggle guides"""
        actions.user.menu_select("Edit|Transform|Toggle Guides")

    def ps_rotate_180():
        """edit transform rotate 180"""
        actions.user.menu_select("Edit|Transform|Rotate 180°")

    def ps_rotate_90_clockwise():
        """edit transform rotate 90 clockwise"""
        actions.user.menu_select("Edit|Transform|Rotate 90° Clockwise")

    def ps_rotate_90_counter_clockwise():
        """edit transform rotate 90 counter clockwise"""
        actions.user.menu_select("Edit|Transform|Rotate 90° Counter Clockwise")

    def ps_flip_horizontal():
        """edit transform flip horizontal"""
        actions.user.menu_select("Edit|Transform|Flip Horizontal")

    def ps_flip_vertical():
        """edit transform flip vertical"""
        actions.user.menu_select("Edit|Transform|Flip Vertical")

    def ps_auto_align_layers():
        """edit auto align layers"""
        actions.user.menu_select("Edit|Auto-Align Layers...")

    def ps_auto_blend_layers():
        """edit auto blend layers"""
        actions.user.menu_select("Edit|Auto-Blend Layers...")

    def ps_sky_replacement():
        """edit sky replacement"""
        actions.user.menu_select("Edit|Sky Replacement...")

    def ps_define_brush_preset():
        """edit define brush preset"""
        actions.user.menu_select("Edit|Define Brush Preset...")

    def ps_define_pattern():
        """edit define pattern"""
        actions.user.menu_select("Edit|Define Pattern...")

    def ps_define_custom_shape():
        """edit define custom shape"""
        actions.user.menu_select("Edit|Define Custom Shape...")

    def ps_purge_clipboard():
        """edit purge clipboard"""
        actions.user.menu_select("Edit|Purge|Clipboard")

    def ps_purge_histories():
        """edit purge histories"""
        actions.user.menu_select("Edit|Purge|Histories")

    def ps_purge_all():
        """edit purge all"""
        actions.user.menu_select("Edit|Purge|All")

    def ps_purge_video_cache():
        """edit purge video cache"""
        actions.user.menu_select("Edit|Purge|Video Cache")

    def ps_adobe_pdf_presets():
        """edit adobe pdf presets"""
        actions.user.menu_select("Edit|Adobe PDF Presets...")

    def ps_preset_manager():
        """edit presets preset manager"""
        actions.user.menu_select("Edit|Presets|Preset Manager...")

    def ps_migrate_presets():
        """edit presets migrate presets"""
        actions.user.menu_select("Edit|Presets|Migrate Presets")

    def ps_export_import_presets():
        """edit presets export import presets"""
        actions.user.menu_select("Edit|Presets|Export/Import Presets...")

    def ps_remote_connections():
        """edit remote connections"""
        actions.user.menu_select("Edit|Remote Connections...")

    def ps_color_settings():
        """edit color settings"""
        actions.user.menu_select("Edit|Color Settings...")

    def ps_convert_to_profile():
        """edit convert to profile"""
        actions.user.menu_select("Edit|Convert to Profile...")

    def ps_keyboard_shortcuts():
        """edit keyboard shortcuts"""
        actions.user.menu_select("Edit|Keyboard Shortcuts...")

    def ps_menus():
        """edit menus"""
        actions.user.menu_select("Edit|Menus...")

    def ps_toolbar():
        """edit toolbar"""
        actions.user.menu_select("Edit|Toolbar...")

    def ps_start_dictation():
        """edit start dictation"""
        actions.user.menu_select("Edit|Start Dictation")

    def ps_mode_bitmap():
        """image mode bitmap"""
        actions.user.menu_select("Image|Mode|Bitmap")

    def ps_mode_grayscale():
        """image mode grayscale"""
        actions.user.menu_select("Image|Mode|Grayscale")

    def ps_mode_duotone():
        """image mode duotone"""
        actions.user.menu_select("Image|Mode|Duotone")

    def ps_mode_indexed_color():
        """image mode indexed color"""
        actions.user.menu_select("Image|Mode|Indexed Color...")

    def ps_mode_rgb_color():
        """image mode rgb color"""
        actions.user.menu_select("Image|Mode|RGB Color")

    def ps_mode_cmyk_color():
        """image mode cmyk color"""
        actions.user.menu_select("Image|Mode|CMYK Color")

    def ps_mode_lab_color():
        """image mode lab color"""
        actions.user.menu_select("Image|Mode|Lab Color")

    def ps_mode_multichannel():
        """image mode multichannel"""
        actions.user.menu_select("Image|Mode|Multichannel")

    def ps_mode_8_bits():
        """image mode 8 bits channel"""
        actions.user.menu_select("Image|Mode|8 Bits/Channel")

    def ps_mode_16_bits():
        """image mode 16 bits channel"""
        actions.user.menu_select("Image|Mode|16 Bits Channel")

    def ps_mode_32_bits():
        """image mode 32 bits channel"""
        actions.user.menu_select("Image|Mode|32 Bits/Channel")

    def ps_mode_color_table():
        """image mode color table"""
        actions.user.menu_select("Image|Mode|Color Table...")

    def ps_adjustments_brightness_contrast():
        """image adjustments brightness contrast"""
        actions.user.menu_select("Image|Adjustments|Brightness/Contrast...")

    def ps_adjustments_levels():
        """image adjustments levels"""
        actions.user.menu_select("Image|Adjustments|Levels...")

    def ps_adjustments_curves():
        """image adjustments curves"""
        actions.user.menu_select("Image|Adjustments|Curves...")

    def ps_adjustments_exposure():
        """image adjustments exposure"""
        actions.user.menu_select("Image|Adjustments|Exposure...")

    def ps_adjustments_vibrance():
        """image adjustments vibrance"""
        actions.user.menu_select("Image|Adjustments|Vibrance...")

    def ps_adjustments_hue_saturation():
        """image adjustments hue saturation"""
        actions.user.menu_select("Image|Adjustments|Hue/Saturation...")

    def ps_adjustments_color_balance():
        """image adjustments color balance"""
        actions.user.menu_select("Image|Adjustments|Color Balance...")

    def ps_adjustments_black_and_white():
        """image adjustments black and white"""
        actions.user.menu_select("Image|Adjustments|Black & White...")

    def ps_adjustments_photo_filter():
        """image adjustments photo filter"""
        actions.user.menu_select("Image|Adjustments|Photo Filter...")

    def ps_adjustments_channel_mixer():
        """image adjustments channel mixer"""
        actions.user.menu_select("Image|Adjustments|Channel Mixer...")

    def ps_adjustments_color_lookup():
        """image adjustments color lookup"""
        actions.user.menu_select("Image|Adjustments|Color Lookup...")

    def ps_adjustments_invert():
        """image adjustments invert"""
        actions.user.menu_select("Image|Adjustments|Invert")

    def ps_adjustments_posterize():
        """image adjustments posterize"""
        actions.user.menu_select("Image|Adjustments|Posterize...")

    def ps_adjustments_threshold():
        """image adjustments threshold"""
        actions.user.menu_select("Image|Adjustments|Threshold...")

    def ps_adjustments_gradient_map():
        """image adjustments gradient map"""
        actions.user.menu_select("Image|Adjustments|Gradient Map...")

    def ps_adjustments_selective_color():
        """image adjustments selective color"""
        actions.user.menu_select("Image|Adjustments|Selective Color...")

    def ps_adjustments_shadows_highlights():
        """image adjustments shadows highlights"""
        actions.user.menu_select("Image|Adjustments|Shadows Highlights...")

    def ps_adjustments_hdr_toning():
        """image adjustments hdr toning"""
        actions.user.menu_select("Image|Adjustments|HDR Toning...")

    def ps_adjustments_hdr__high_def_range():
        """image adjustments hdr  high def range"""
        actions.user.menu_select("Image|Adjustments|(HDR | High Def range)")

    def ps_adjustments_desaturate():
        """image adjustments desaturate"""
        actions.user.menu_select("Image|Adjustments|Desaturate")

    def ps_adjustments_match_color():
        """image adjustments match color"""
        actions.user.menu_select("Image|Adjustments|Match Color...")

    def ps_adjustments_replace_color():
        """image adjustments replace color"""
        actions.user.menu_select("Image|Adjustments|Replace Color..")

    def ps_adjustments_equalize():
        """image adjustments equalize"""
        actions.user.menu_select("Image|Adjustments|Equalize")

    def ps_auto_tone():
        """image auto tone"""
        actions.user.menu_select("Image|Auto Tone")

    def ps_auto_contrast():
        """image auto contrast"""
        actions.user.menu_select("Image|Auto Contrast")

    def ps_auto_color():
        """image auto color"""
        actions.user.menu_select("Image|Auto Color")

    def ps_image_size():
        """image image size"""
        actions.user.menu_select("Image|Image Size...")

    def ps_canvas_size():
        """image canvas size"""
        actions.user.menu_select("Image|Canvas Size...")

    def ps_rotate_180():
        """image image rotation 180"""
        actions.user.menu_select("Image|Image Rotation|180°")

    def ps_rotate_90_clockwise():
        """image image rotation 90 clockwise"""
        actions.user.menu_select("Image|Image Rotation|90° Clockwise")

    def ps_rotate_90_counter_clockwise():
        """image image rotation 90 counter clockwise"""
        actions.user.menu_select("Image|Image Rotation|90° Counter Clockwise")

    def ps_rotate_arbitrary():
        """image image rotation arbitrary"""
        actions.user.menu_select("Image|Image Rotation|Arbitrary...")

    def ps_flip_canvas_horizontal():
        """image image rotation flip canvas horizontal"""
        actions.user.menu_select("Image|Image Rotation|Flip Canvas Horizontal")

    def ps_flip_canvas_vertical():
        """image image rotation flip canvas vertical"""
        actions.user.menu_select("Image|Image Rotation|Flip Canvas Vertical")

    def ps_crop():
        """image crop"""
        actions.user.menu_select("Image|Crop")

    def ps_trim():
        """image trim"""
        actions.user.menu_select("Image|Trim...")

    def ps_reveal_all():
        """image reveal all"""
        actions.user.menu_select("Image|Reveal All")

    def ps_duplicate_image():
        """image duplicate"""
        actions.user.menu_select("Image|Duplicate...")

    def ps_apply_image():
        """image apply image"""
        actions.user.menu_select("Image|Apply Image..")

    def ps_calculations():
        """image calculations"""
        actions.user.menu_select("Image|Calculations...")

    def ps_variables_define():
        """image variables define"""
        actions.user.menu_select("Image|Variables|Define...")

    def ps_variables_data_sets():
        """image variables data sets"""
        actions.user.menu_select("Image|Variables|Data Sets..")

    def ps_apply_data_set():
        """image apply data set"""
        actions.user.menu_select("Image|Apply Data Set...")

    def ps_trap():
        """image trap"""
        actions.user.menu_select("Image|Trap...")

    def ps_analysis_set_measurement_scale():
        """image analysis set measurement scale"""
        actions.user.menu_select("Image|Analysis|Set Measurement Scale")

    def ps_analysis_select_data_points():
        """image analysis select data points"""
        actions.user.menu_select("Image|Analysis|Select Data Points")

    def ps_analysis_record_measurements():
        """image analysis record measurements"""
        actions.user.menu_select("Image|Analysis|Record Measurements")

    def ps_analysis_ruler_tool():
        """image analysis ruler tool"""
        actions.user.menu_select("Image|Analysis|Ruler Tool")

    def ps_analysis_count_tool():
        """image analysis count tool"""
        actions.user.menu_select("Image|Analysis|Count Tool")

    def ps_analysis_place_scale_marker():
        """image analysis place scale marker"""
        actions.user.menu_select("Image|Analysis|Place Scale Marker...")

    def ps_plugins_panel():
        """plugins plugins panel"""
        actions.user.menu_select("Plugins|Plugins Panel")

    def ps_browse_plugins():
        """plugins browse plugins"""
        actions.user.menu_select("Plugins|Browse Plugins...")

    def ps_manage_plugins():
        """plugins manage plugins"""
        actions.user.menu_select("Plugins|Manage Plugins..")

    def ps_plugins_prostacker():
        """plugins prostacker prostacker"""
        actions.user.menu_select("Plugins|ProStacker|ProStacker")

    def ps_window_tile_all_vertically():
        """window arrange tile all vertically"""
        actions.user.menu_select("Window|Arrange|Tile All Vertically")

    def ps_window_tile_all_horizontally():
        """window arrange tile all horizontally"""
        actions.user.menu_select("Window|Arrange|Tile All Horizontally")

    def ps_window_2_up_horizontal():
        """window arrange 2 up horizontal"""
        actions.user.menu_select("Window|Arrange|2-up Horizontal")

    def ps_window_2_up_vertical():
        """window arrange 2 up vertical"""
        actions.user.menu_select("Window|Arrange|2-up Vertical")

    def ps_window_3_up_horizontal():
        """window arrange 3 up horizontal"""
        actions.user.menu_select("Window|Arrange|3-up Horizontal")

    def ps_window_3_up_vertical():
        """window arrange 3 up vertical"""
        actions.user.menu_select("Window|Arrange|3-up Vertical")

    def ps_window_3_up_stacked():
        """window arrange 3 up stacked"""
        actions.user.menu_select("Window|Arrange|3-up Stacked")

    def ps_window_4_up():
        """window arrange 4 up"""
        actions.user.menu_select("Window|Arrange|4-up")

    def ps_window_6_up():
        """window arrange 6 up"""
        actions.user.menu_select("Window|Arrange|6-up")

    def ps_window_consolidate_all_to_tabs():
        """window arrange consolidate all to tabs"""
        actions.user.menu_select("Window|Arrange|Consolidate All to Tabs")

    def ps_window_cascade():
        """window arrange cascade"""
        actions.user.menu_select("Window|Arrange|Cascade")

    def ps_window_tile():
        """window arrange tile"""
        actions.user.menu_select("Window|Arrange|Tile")

    def ps_window_float_in_window():
        """window arrange float in window"""
        actions.user.menu_select("Window|Arrange|Float in Window")

    def ps_window_float_all_in_windows():
        """window arrange float all in windows"""
        actions.user.menu_select("Window|Arrange|Float All in Windows")

    def ps_window_match_zoom():
        """window arrange match zoom"""
        actions.user.menu_select("Window|Arrange|Match Zoom")

    def ps_window_match_location():
        """window arrange match location"""
        actions.user.menu_select("Window|Arrange|Match Location")

    def ps_window_match_rotation():
        """window arrange match rotation"""
        actions.user.menu_select("Window|Arrange|Match Rotation")

    def ps_window_match_all():
        """window arrange match all"""
        actions.user.menu_select("Window|Arrange|Match All")

    def ps_window_minimize_window():
        """window arrange minimize window"""
        actions.user.menu_select("Window|Arrange|Minimize [window]")

    def ps_window_bring_all_to_front():
        """window arrange bring all to front"""
        actions.user.menu_select("Window|Arrange|Bring All to Front")

    def ps_workspace_ryan1():
        """window workspace ryan1"""
        actions.user.menu_select("Window|Workspace|ryan1")

    def ps_workspace_rvan2():
        """window workspace rvan2"""
        actions.user.menu_select("Window|Workspace|rvan2")

    def ps_workspace_essentials_default():
        """window workspace essentials default"""
        actions.user.menu_select("Window|Workspace|Essentials (Default)")

    def ps_workspace_3d():
        """window workspace 3d"""
        actions.user.menu_select("Window|Workspace|3D")

    def ps_workspace_motion():
        """window workspace motion"""
        actions.user.menu_select("Window|Workspace|Motion")

    def ps_workspace_painting():
        """window workspace painting"""
        actions.user.menu_select("Window|Workspace|Painting")

    def ps_workspace_photography():
        """window workspace photography"""
        actions.user.menu_select("Window|Workspace|Photography")

    def ps_workspace_graphic_and_web():
        """window workspace graphic and web"""
        actions.user.menu_select("Window|Workspace|Graphic and Web")

    def ps_workspace_new():
        """window workspace new workspace"""
        actions.user.menu_select("Window|Workspace|New Workspace...")

    def ps_workspace_delete():
        """window workspace delete workspace"""
        actions.user.menu_select("Window|Workspace|Delete Workspace...")

    def ps_workspace_keyboard_shortcuts_and_menus():
        """window workspace keyboard shortcuts and menus"""
        actions.user.menu_select("Window|Workspace|Keyboard Shortcuts & Menus...")

    def ps_workspace_lock_workspace():
        """window workspace lock workspace"""
        actions.user.menu_select("Window|Workspace|Lock Workspace")

    def ps_window_actions():
        """window actions"""
        actions.user.menu_select("Window|Actions")

    def ps_window_adjustments():
        """window adjustments"""
        actions.user.menu_select("Window|Adjustments")

    def ps_window_beta_feedback():
        """window beta feedback"""
        actions.user.menu_select("Window|Beta Feedback")

    def ps_window_brush_settings():
        """window brush settings"""
        actions.user.menu_select("Window|Brush Settings")

    def ps_window_brushes():
        """window brushes"""
        actions.user.menu_select("Window|Brushes")

    def ps_window_channels():
        """window channels"""
        actions.user.menu_select("Window|Channels")

    def ps_window_character():
        """window character"""
        actions.user.menu_select("Window|Character")

    def ps_window_character_styles():
        """window character styles"""
        actions.user.menu_select("Window|Character Styles")

    def ps_window_clone_source():
        """window clone source"""
        actions.user.menu_select("Window|Clone Source")

    def ps_window_color():
        """window color"""
        actions.user.menu_select("Window|Color")

    def ps_window_comments():
        """window comments"""
        actions.user.menu_select("Window|Comments")

    def ps_window_content_credentials_beta():
        """window content credentials beta"""
        actions.user.menu_select("Window|Content Credentials (Beta)")

    def ps_window_glyphs():
        """window glyphs"""
        actions.user.menu_select("Window|Glyphs")

    def ps_window_gradients():
        """window gradients"""
        actions.user.menu_select("Window|Gradients")

    def ps_window_histogram():
        """window histogram"""
        actions.user.menu_select("Window|Histogram")

    def ps_window_history():
        """window history"""
        actions.user.menu_select("Window|History")

    def ps_window_info():
        """window info"""
        actions.user.menu_select("Window|Info")

    def ps_window_layer_comps():
        """window layer comps"""
        actions.user.menu_select("Window|Layer Comps")

    def ps_window_layers():
        """window layers"""
        actions.user.menu_select("Window|Layers")

    def ps_window_libraries():
        """window libraries"""
        actions.user.menu_select("Window|Libraries")

    def ps_window_materials():
        """window materials"""
        actions.user.menu_select("Window|Materials")

    def ps_window_measurement_log():
        """window measurement log"""
        actions.user.menu_select("Window|Measurement Log")

    def ps_window_navigator():
        """window navigator"""
        actions.user.menu_select("Window|Navigator")

    def ps_window_notes():
        """window notes"""
        actions.user.menu_select("Window|Notes")

    def ps_window_paragraph():
        """window paragraph"""
        actions.user.menu_select("Window|Paragraph")

    def ps_window_paragraph_styles():
        """window paragraph styles"""
        actions.user.menu_select("Window|Paragraph Styles")

    def ps_window_paths():
        """window paths"""
        actions.user.menu_select("Window|Paths")

    def ps_window_patterns():
        """window patterns"""
        actions.user.menu_select("Window|Patterns")

    def ps_window_properties():
        """window properties"""
        actions.user.menu_select("Window|Properties")

    def ps_window_shapes():
        """window shapes"""
        actions.user.menu_select("Window|Shapes")

    def ps_window_styles():
        """window styles"""
        actions.user.menu_select("Window|Styles")

    def ps_window_swatches():
        """window swatches"""
        actions.user.menu_select("Window|Swatches")

    def ps_window_timeline():
        """window timeline"""
        actions.user.menu_select("Window|Timeline")

    def ps_window_tool_presets():
        """window tool presets"""
        actions.user.menu_select("Window|Tool Presets")

    def ps_window_version_history():
        """window version history"""
        actions.user.menu_select("Window|Version History")

    def ps_window_application_frame():
        """window application frame"""
        actions.user.menu_select("Window|Application Frame")

    def ps_window_options():
        """window options"""
        actions.user.menu_select("Window|Options")

    def ps_window_tools():
        """window tools"""
        actions.user.menu_select("Window|Tools")

    def ps_window_contextual_task_bar():
        """window contextual task bar"""
        actions.user.menu_select("Window|Contextual Task Bar")
    
    def ps_set_backdrop_color(color_name: str):
        """window contextual task bar"""
        actions.mouse_click(1)
        actions.sleep("200ms")
        actions.insert(color_name)
        actions.sleep("200ms")
        actions.key("enter")

    def ps_open_settings():
        """open settings"""
        actions.key("cmd-k")

    def ps_choose_fade_blending_mode(blending_mode: str):
        """choose fade blending mode"""
        actions.user.mouse_helper_click_image_relative("2025-03-24_12.03.32.644427.png", 0, 51, 1, 0, False)
        actions.insert(blending_mode)
        actions.sleep("100ms")
    
    def ps_fade(amount: Optional[str] = None, blending_mode: Optional[str] = None):
        """edit / fade"""
        actions.key("shift-cmd-f")
        actions.sleep("100ms")


        if amount and blending_mode:
            actions.insert(amount)
            actions.sleep("100ms")
            actions.user.ps_choose_fade_blending_mode(blending_mode)
            actions.key("enter:2")
            actions.user.mouse_helper_position_restore()
            return
        
        if amount:
            print(f"amount: {amount}")
            actions.insert(amount)
            actions.sleep("100ms")
            actions.key("enter")
            return

        if blending_mode:
            actions.user.ps_choose_fade_blending_mode(blending_mode)
            actions.key("enter:2")
            actions.user.mouse_helper_position_restore()
            return

    
