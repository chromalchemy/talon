app.name: Adobe Photoshop (Beta)

app.name: Adobe Photoshop 2025

-

## +++++++++++++++++++++++++++ confirm changes (to exit modal)

^okay$: key(enter)

## ++++++++++++++++++ image generation .

generate (images | Image assets | assets):
    user.menu_select('File|Automate|Generator Plugins|Image Assets')


(new | add [new]) Layer [<user.text>]:
    user.ps_new_layer(text or "")

(new | add [new]) Layer (down | below) [<user.text>]:
    user.ps_new_layer(text or "")
    sleep(500ms)
    user.ps_move_layer_down()

#test invoke squint js script
squint test | new custom layer:
    user.system_command_nb("open \"/Users/ryan/dev/ps script/scripts/create_layer.psjs\"")

New Background from Layer:
    user.ps_new_background_from_layer()

New Group:
    user.ps_new_group()

New Group from Layers:
    user.ps_new_group_from_layers()

New Artboard:
    user.ps_new_artboard()

New Artboard from Group:
    user.ps_new_artboard_from_group()

New Artboard from Layers:
    user.ps_new_artboard_from_layers()

New Frame from Layers:
    user.ps_new_frame_from_layers()

Convert to Frame:
    user.ps_convert_to_frame()

New Layer [via] Copy:
    user.ps_new_layer_via_copy()

New Layer [Via] Cut:
    user.ps_new_layer_via_cut()

Copy (CSS | C S S | cee es es):
    user.ps_copy_css()

Copy (S V G | es vee gee):
    user.ps_copy_svg()

Duplicate Layer:
    user.ps_duplicate_layer()

Duplicate layers:
    user.ps_duplicate_layers()

(Delete | chuck) layer:
    user.ps_delete_layer()
    
(Delete | chuck) group:
    user.ps_delete_group()

(Delete | chuck) Hidden Layers:
    user.ps_delete_hidden_layers()

Export Layer As:
    user.ps_export_as()

rename layer [<user.text>]:
    user.ps_rename_layer(text or "")

(Rename artboard | artboard rename):
    user.ps_rename_artboard()

[layer] (Blending | blend) (Options | opts):
    user.ps_layer_style_blending_options()

(Bevel | Emboss) [layer] (style | thou):
    user.ps_layer_style_bevel_and_emboss()

Stroke [layer] (style | thou):
    user.ps_layer_style_stroke()

Inner Shadow [layer] (style | thou):
    user.ps_layer_style_inner_shadow()

Inner Glow [layer] (style | thou):
    user.ps_layer_style_inner_glow()

Satin [layer] (style | thou):
    user.ps_layer_style_satin()

Color Overlay [layer] (style | thou):
    user.ps_layer_style_color_overlay()

Gradient Overlay [layer] (style | thou):
    user.ps_layer_style_gradient_overlay()

Pattern Overlay [layer] (style | thou):
    user.ps_layer_style_pattern_overlay()

Outer Glow [layer] (style | thou):
    user.ps_layer_style_outer_glow()

Drop Shadow [layer] (style | thou):
    user.ps_layer_style_drop_shadow()

(Copy | carve) [Layer] (style | thou):
    user.ps_layer_style_copy_layer_style()

(Paste | pace) [Layer] (style | thou):
    user.ps_layer_style_paste_layer_style()

(Clear | chuck) [Layer] (style | thou):
    user.ps_layer_style_clear_layer_style()

Global Light:
    user.ps_layer_style_global_light()

(Create | new) Layer (style | thou):
    user.ps_layer_style_create_layer()

Hide All (Effects | styles):
    user.ps_layer_style_hide_all_effects()

Scale (Effects | styles | style | thou):
    user.ps_layer_style_scale_effects()

Smart Filter:
    user.ps_smart_filter()


## ++++++++++++++++++++++++++++ new adjustment layer .

new {user.ryan.photoshop.adjustment_layer.list} [adjustment] layer:
    user.ps_new_adjustment_layer(user.ryan.photoshop.adjustment_layer.list)
    sleep(200ms)
    key(enter)

## +++++++++++++++++++++ layer options .

Layer Content Options:
    user.ps_layer_content_options()

## ++++++++++++++++++++++++ layer mask .

(new | add) layer mask [Reveal] [All]:
    user.ps_layer_mask_reveal_all()

(new | add) layer mask Hide [All]:
    user.ps_layer_mask_hide_all()

(new | add) layer mask [Reveal] Selection:
    user.ps_layer_mask_reveal_selection()

(new | add) layer mask Hide Selection:
    user.ps_layer_mask_hide_selection()

(new | add) layer mask [From] Transparency:
    user.ps_layer_mask_from_transparency()

(Delete | chuck) layer mask:
    user.ps_layer_mask_delete()

Apply layer mask:
    user.ps_layer_mask_apply()

(enable | disable | toggle | hide | show) layer mask:
    user.ps_layer_mask_enable()

(link | unlink) layer mask:
    user.ps_layer_mask_link()

go  layer mask: 
    key(cmd-\)

go layer:
    key(cmd-shift-2)

invert (layer | mask): 
    user.ps_adjustments_invert()
    
## +++++++++++++++++++++++ vector mask .

New vector mask reveal [all]:
    user.ps_vector_mask_reveal_all()

New vector mask Hide [All]:
    user.ps_vector_mask_hide_all()

New vector mask [from] Current Path:
    user.ps_vector_mask_current_path()

(Delete | chuck) vector mask:
    user.ps_vector_mask_delete()

(enable | disable | toggle | hide | show) vector mask:
    user.ps_vector_mask_enable()

(link | unlink) vector mask:
    user.ps_vector_mask_link()

## ___________________________________ .

[(create | make)] (clipping | clip) mask:
    user.ps_create_clipping_mask()

mask all objects:
    user.ps_mask_all_objects()

## ++++++++++++++++++++++ smart object .

(Convert to | make) [Smart] Object:
    user.ps_smart_objects_convert_to_smart_object()

copy to [Smart] Object:
    user.ps_smart_objects_new_smart_object_via_copy()

Reveal [smart] [object] [in Finder]:
    user.ps_smart_objects_reveal_in_finder()

Update [Modified] (object | [object] (Contents | content)):
    user.ps_smart_objects_update_modified_content()

Update [All] [Modified] objects:
    user.ps_smart_objects_update_all_modified_content()

Edit [object] (Contents | content):
    user.ps_smart_objects_edit_contents()

Reset [object] Transform:
    user.ps_smart_objects_reset_transform()

(unsmart | un smart | remove smart) object:
    user.ps_scripts_unsmart()

## ++++++++++++++++++++ linked objects .

Relink (object | [object] to File):
    user.ps_smart_objects_relink_to_file()

Relink (layer | claire | clare) (to | with) File | replace layer with linked [file]:
    user.ps_smart_objects_convert_to_smart_object()
    sleep(800ms)
    user.ps_smart_objects_relink_to_file()

Relink [object] to (Library | lib) (Graphic | item):
    user.ps_smart_objects_relink_to_library_graphic()

Replace (object | [object] (Contents | content)):
    user.ps_smart_objects_replace_contents()

Export [object] (Contents | content):
    user.ps_smart_objects_export_contents()

Embed Linked [object]:
    user.ps_smart_objects_embed_linked()

Embed All Linked [objects]:
    user.ps_smart_objects_embed_all_linked()

Convert [object] to Linked [file]:
    user.ps_smart_objects_convert_to_linked()

Convert [object] (to | two) (Layers | layer):
    user.ps_smart_objects_convert_to_layers()

## ___________________________________ .

Stack Mode:
    user.ps_smart_objects_stack_mode()

Video Layers:
    user.ps_video_layers()

## +++++++++++++++++++++++++ rasterize .

(rasterize | raster | pixelate) [smart] object:
    user.ps_smart_objects_rasterize()

(rasterize | raster | pixelate) Type:
    user.ps_rasterize_type()

(rasterize | raster | pixelate) Shape:
    user.ps_rasterize_shape()

(rasterize | raster | pixelate)  Content:
    user.ps_rasterize_fill_content()

(rasterize | raster | pixelate) Vector Mask:
    user.ps_rasterize_vector_mask()

(rasterize | raster | pixelate) Smart Obiect:
    user.ps_rasterize_smart_obiect()

(rasterize | raster | pixelate) generative:
    user.ps_rasterize_generative()

(rasterize | raster | pixelate) Video:
    user.ps_rasterize_video()

(rasterize | raster | pixelate) 3D:
    user.ps_rasterize_3d()

(rasterize | raster | pixelate) Layer Style:
    user.ps_rasterize_layer_style()

(rasterize | raster | pixelate) Layer:
    user.ps_rasterize_layer()

(rasterize | raster | pixelate) All [Layers]:
    user.ps_rasterize_all_layers()

## ___________________________________ .
    
new layer slice:
    user.ps_new_layer_based_slice()

## ++++++++++++++++++++ layer grouping .

Group Layers:
    user.ps_group_layers()

Ungroup Layers:
    user.ps_ungroup_layers()

(Ungroup | release) (artboards | artboard):
    user.menu_select('Layer|Ungroup Artboards')


## ++++++++++++ layer stack navigation .

layer (send | move) [to] (back | bottom) | layer center back:
    user.ps_move_layer_bottom()
 
layer (send | move) [to] (front | top):
    user.ps_move_layer_top()
 
layer (send | move) (up | for | forward) [<digits>]:  
    user.ps_move_layer_up(digits or 1)
 
layer (send | move) (down | back | backwards | backward) [<digits>]:
    user.ps_move_layer_down(digits or 1)
   
## ++++++++++++++++++ layer visibility .

(show | hide) layer | layer (show | hide) | toggle layer [visibility]: 
    user.ps_toggle_layer_visibility()

Hide Layers:
    user.ps_hide_layers()

## +++++++++++++++++++++++ lock layers .

Lock Layers [popup]:
    user.ps_lock_layers()

(Toggle | disable | enable | flip) [layer] locks:
    user.ps_scripts_toggle_locks()

## +++++++++++++++++++ arrange layers .

(Bring | send) to (Front | top):
    user.ps_arrange_bring_to_front()

(Bring | send) (forward | up):
    user.ps_arrange_bring_forward()

send (back | backward | down):
    user.ps_arrange_send_backward()

send to (back | bottom) | (centerback | center back):
    user.ps_arrange_send_to_back()

reverse (layer | layers) [order]:
    user.ps_arrange_reverse()

## +++++++++++++++++++++ shape algebra .

Unite Shapes:
    user.ps_combine_shapes_unite_shapes()

Subtract Front Shape:
    user.ps_combine_shapes_subtract_front_shape()

Unite Shapes [at] Overlap:
    user.ps_combine_shapes_unite_shapes_at_overlap()

Subtract Shapes [at] Overlap:
    user.ps_combine_shapes_subtract_shapes_at_overlap()

## +++++++++++++++++++++++++++++ align .

Auto Align Layers:
    user.ps_auto_align_layers()

Align Top Edges:
    user.ps_align_top_edges()

Align Vertical Centers:
    user.ps_align_vertical_centers()

Align Bottom Edges:
    user.ps_align_bottom_edges()

Align Left Edges:
    user.ps_align_left_edges()

Align Horizontal Centers:
    user.ps_align_horizontal_centers()

Align Right Edges:
    user.ps_align_right_edges()

Align Layers to Artboard:
    user.ps_align_layers_to_artboard()

Center layer  [on (page | artboard )]:
    key(cmd-a)
    sleep(100ms)
    user.menu_select('Layer|Align Layers to Selection|Horizontal Centers')
    sleep(200ms)
    key(cmd-d)

## ++++++++++++++++++++++++ distribute .

(spread | distribute) Top Edges:
    user.ps_distribute_top_edges()

(spread | distribute) Vertical Centers:
    user.ps_distribute_vertical_centers()

(spread | distribute) Bottom Edges:
    user.ps_distribute_bottom_edges()

(spread | distribute) Left Edges:
    user.ps_distribute_left_edges()

(spread | distribute) Horizontal Centers:
    user.ps_distribute_horizontal_centers()

(spread | distribute) Right Edges:
    user.ps_distribute_right_edges()

(spread | distribute) Horizontally:
    user.ps_distribute_horizontally()

(spread | distribute) Vertically:
    user.ps_distribute_vertically()

## +++++++++++++++++++++ linked layers .

Link Layers:
    user.ps_link_layers()

Select Linked Layers:
    user.ps_select_linked_layers()

## ++++++++++++++++++++++++++++++ merge layers .

Merge Layers:
    user.ps_merge_layers()

Merge Visible [layers]:
    user.ps_merge_visible()

Flatten Image:
    user.ps_flatten_image()

## +++++++++++++++ matte.

Color Decontaminate matte:
    user.ps_matting_color_decontaminate()

Defringe matte:
    user.ps_matting_defringe()

Remove Black Matte:
    user.ps_matting_remove_black_matte()

Remove White Matte:
    user.ps_matting_remove_white_matte()

## +++++++++++++++++++++++ adobe fonts .

More from Adobe Fonts:
    user.ps_type_more_from_adobe_fonts()


#refresh text block
## fixes broke variable fond rendering
refresh (text | type) [block]: 
    user.ps_type_anti_alias_crisp()
    user.ps_type_anti_alias_sharp()

## ++++++++++++++++++++++++++++ type panels .

Character Panel:
    user.ps_type_panels_character_panel()

Paragraph Panel:
    user.ps_type_panels_paragraph_panel()

Glyphs Panel:
    user.ps_type_panels_glyphs_panel()

Character Styles Panel:
    user.ps_type_panels_character_styles_panel()

Paragraph Styles Panel:
    user.ps_type_panels_paragraph_styles_panel()

## +++++++++++++++++++++ anti-aliasing .

[type] anti alias None:
    user.ps_type_anti_alias_none()

[type] anti alias Sharp:
    user.ps_type_anti_alias_sharp()

[type] anti alias Crisp:
    user.ps_type_anti_alias_crisp()

[type] anti alias Strong:
    user.ps_type_anti_alias_strong()

[type] anti alias Smooth:
    user.ps_type_anti_alias_smooth()

[type] anti alias Mac LCD:
    user.ps_type_anti_alias_mac_lcd()

[type] anti alias Mac:
    user.ps_type_anti_alias_mac()

## ++++++++++++++++++ type orientation .

type Horizontal:
    user.ps_type_orientation_horizontal()

type Vertical:
    user.ps_type_orientation_vertical()

## +++++++++++++++++++++++++ open type .

open type Standard Ligatures:
    user.ps_type_opentype_standard_ligatures()

open type Contextual Alternates:
    user.ps_type_opentype_contextual_alternates()

open type Discretionary Ligatures:
    user.ps_type_opentype_discretionary_ligatures()

open type Swash:
    user.ps_type_opentype_swash()

open type Oldstyle:
    user.ps_type_opentype_oldstyle()

open type Stylistic Alternates:
    user.ps_type_opentype_stylistic_alternates()

open type Titling Alternates:
    user.ps_type_opentype_titling_alternates()

open type Ornaments:
    user.ps_type_opentype_ornaments()

open type Ordinals:
    user.ps_type_opentype_ordinals()

open type Fractions:
    user.ps_type_opentype_fractions()

open type Justification Alternates:
    user.ps_type_opentype_justification_alternates()

open type Japanese 78:
    user.ps_type_opentype_japanese_78()

open type Japanese Expert:
    user.ps_type_opentype_japanese_expert()

open type Japanese Traditional:
    user.ps_type_opentype_japanese_traditional()

open type Proportional Metrics:
    user.ps_type_opentype_proportional_metrics()

open type Kana:
    user.ps_type_opentype_kana()

open type Roman Italics:
    user.ps_type_opentype_roman_italics()

## +++++++++++++++++++++++++++ 3d type .

Extrude to 3D:
    user.ps_type_extrude_to_3d()

## ++++++++++++++++++++++++++ type fns .

type Create Work Path:
    user.ps_type_create_work_path()

type Convert to Shape:
    user.ps_type_convert_to_shape()

Rasterize Type Layer:
    user.ps_type_rasterize_type_layer()

Convert to Paragraph Text:
    user.ps_type_convert_to_paragraph_text()

Warp Text:
    user.ps_type_warp_text()

Match Font:
    user.ps_type_match_font()

## ++++++++++++++++++++++ font preview .

font preview None:
    user.ps_type_font_preview_size_none()

font preview Small:
    user.ps_type_font_preview_size_small()

font preview Medium:
    user.ps_type_font_preview_size_medium()

font preview Large:
    user.ps_type_font_preview_size_large()

font preview Extra Large:
    user.ps_type_font_preview_size_extra_large()

font preview Huge:
    user.ps_type_font_preview_size_huge()


## ++++++++++++++++++++++++++ type misc .

type Language Options:
    user.ps_type_language_options()

Update All Text Layers:
    user.ps_type_update_all_text_layers()

Manage Missing Fonts:
    user.ps_type_manage_missing_fonts()

Paste Lorem Ipsum:
    user.ps_type_paste_lorem_ipsum()

## +++++++++++++++++++++++ type styles .

Load Default Type Styles:
    user.ps_type_load_default_type_styles()

Save Default Type Styles:
    user.ps_type_save_default_type_styles()

## +++++++++++++++++++++++++++ filters .

Last Filter:
    user.ps_filter_last_filter()

Convert for Smart Filters:
    user.ps_filter_convert_for_smart_filters()

Neural Filters:
    user.ps_filter_neural_filters()

Filter Gallery:
    user.ps_filter_filter_gallery()

Wide Angle [filter]:
    user.ps_filter_adaptive_wide_angle()

camera (raw | ra) [(filter | module)]:
    user.ps_filter_camera_raw_filter()

Lens Correction:
    user.ps_filter_lens_correction()

# from automate menu
Auto Lens Correction:
    user.ps_file_automate_lens_correction()


Liquify:
    user.ps_filter_liquify()

Vanishing Point:
    user.ps_filter_vanishing_point()

Average:
    user.ps_filter_blur_average()

Blur (one | once | simple) | simple blur:
    user.ps_filter_blur_blur()

Blur More:
    user.ps_filter_blur_blur_more()

Box Blur:
    user.ps_filter_blur_box_blur()

# Live [(Gaussian | gauss | power)] Blur | [(Gaussian | gauss | power)] Blur live:
#     print("live gaussian blur")
#     user.ps_filter_blur_live_gaussian_blur()

[(gaussian | gauss | power)] Blur:
    print("gaussian blur")
    user.ps_filter_blur_gaussian_blur()

[(gaussian | gauss | power)] Blur <user.number_string> [(pix | pixels)]:
    print("gaussian blur")
    user.ps_filter_blur_gaussian_blur()
    sleep(200ms)
    insert(number_string)
    key(enter)


Lens Blur:
    user.ps_filter_blur_lens_blur()

Motion Blur:
    user.ps_filter_blur_motion_blur()

Radial Blur:
    user.ps_filter_blur_radial_blur()

Shape Blur:
    user.ps_filter_blur_shape_blur()

Smart Blur:
    user.ps_filter_blur_smart_blur()

Surface Blur:
    user.ps_filter_blur_surface_blur()

Field Blur..:
    user.ps_filter_blur_gallery_field_blur()

Iris Blur:
    user.ps_filter_blur_gallery_iris_blur()

Tilt-Shift:
    user.ps_filter_blur_gallery_tilt_shift()

Path Blur:
    user.ps_filter_blur_gallery_path_blur()

Spin Blur:
    user.ps_filter_blur_gallery_spin_blur()

Displace:
    user.ps_filter_distort_displace()

Pinch:
    user.ps_filter_distort_pinch()

Polar Coordinates:
    user.ps_filter_distort_polar_coordinates()

Ripple:
    user.ps_filter_distort_ripple()

Shear:
    user.ps_filter_distort_shear()

Spherize:
    user.ps_filter_distort_spherize()

Twirl:
    user.ps_filter_distort_twirl()

Wave:
    user.ps_filter_distort_wave()

ZigZag:
    user.ps_filter_distort_zigzag()

Add Noise:
    user.ps_filter_noise_add_noise()

Despeckle:
    user.ps_filter_noise_despeckle()

Dust & Scratches:
    user.ps_filter_noise_dust_and_scratches()

Median:
    user.ps_filter_noise_median()

Reduce Noise:
    user.ps_filter_noise_reduce_noise()

Color Halftone:
    user.ps_filter_pixelate_color_halftone()

Crystallize:
    user.ps_filter_pixelate_crystallize()

Facet:
    user.ps_filter_pixelate_facet()

Fragment:
    user.ps_filter_pixelate_fragment()

Mezzotint:
    user.ps_filter_pixelate_mezzotint()

Mosaic:
    user.ps_filter_pixelate_mosaic()

Pointillize | make [into] points:
    user.ps_filter_pixelate_pointillize()

Flame:
    user.ps_filter_render_flame()

Picture Frame:
    user.ps_filter_render_picture_frame()

Tree:
    user.ps_filter_render_tree()

Clouds:
    user.ps_filter_render_clouds()

Difference Clouds:
    user.ps_filter_render_difference_clouds()

Fibers:
    user.ps_filter_render_fibers()

Lens Flare:
    user.ps_filter_render_lens_flare()

Lighting Effects:
    user.ps_filter_render_lighting_effects()

Sharpen:
    user.ps_filter_sharpen_sharpen()

Sharpen Edges:
    user.ps_filter_sharpen_sharpen_edges()

Sharpen More:
    user.ps_filter_sharpen_sharpen_more()

Smart Sharpen:
    user.ps_filter_sharpen_smart_sharpen()

Unsharp Mask:
    user.ps_filter_sharpen_unsharp_mask()

Diffuse:
    user.ps_filter_stylize_diffuse()

Emboss:
    user.ps_filter_stylize_emboss()

Extrude:
    user.ps_filter_stylize_extrude()

Find Edges:
    user.ps_filter_stylize_find_edges()

Oil Paint:
    user.ps_filter_stylize_oil_paint()

Solarize:
    user.ps_filter_stylize_solarize()

Tiles:
    user.ps_filter_stylize_tiles()

Trace Contour:
    user.ps_filter_stylize_trace_contour()

Wind:
    user.ps_filter_stylize_wind()

Custom filter:
    user.ps_filter_other_custom()

High Pass:
    user.ps_filter_other_high_pass()

hsl | hue saturation lightness:
    user.ps_filter_other_hsb_hsl()

Maximum:
    user.ps_filter_other_maximum()

Minimum:
    user.ps_filter_other_minimum()

Offset:
    user.ps_filter_other_offset()

## ++++++++++++++++++++++++ open file.

File New | new (file | pane | tab):
    user.ps_file_new()

File Open | open file:
    user.ps_file_open()

File Browse in Bridge | browse [files] [in] bridge:
    user.ps_file_browse_in_bridge()

File Open [as] Smart Object | open file as smart object:
    user.ps_file_open_as_smart_object()

File Open Recent | open recent file:
    user.ps_file_open_recent()

(file | tab) Close | close (file | tab):
    user.ps_file_close()

(file | tab) Close All | close all (files | tabs):
    user.ps_file_close_all()

(file | tab) Close Others | close other files:
    user.ps_file_close_others()

Close [(file | tab)] and Go [to] Bridge:
    user.ps_file_close_and_go_to_bridge()

## +++++++++++++++++++++++++ save file .

File Save | save file:
    user.ps_file_save()

[(File | fil)] Save As:
    user.ps_file_save_as()

[File | fil] Save a Copy:
    user.ps_file_save_a_copy()

File Revert | revert file:
    user.ps_file_revert()

## +++++++++++++++++++++++ multiplayer .

Invite [to] Edit [file]:
    user.ps_file_invite_to_edit()

Share [file] for Review:
    user.ps_file_share_for_review_new()

## ++++++++++++++++++++++++++++ export .

Quick Export [as] [(file | jpg | jpeg | png)]:
    user.ps_file_export_quick_export_as("JPG")

Export (as | [for] web [file]):
    user.ps_file_export_export_as()

quick Export (Preferences | prefs | settings):
    user.ps_file_export_export_preferences()

Save for Web [(legacy | classic)]:
    user.ps_file_export_save_for_web_legacy()

export (artboards | art boards | artboard | art board) [to (files | file)]:
    user.ps_file_export_artboards_to_files()

export (artboards | art boards | artboard | art board) to PDF:
    user.ps_file_export_artboards_to_pdf()

Export [For] Aero:
    user.ps_file_export_export_for_aero()

export Layer Comps [to Files]:
    user.ps_file_export_layer_comps_to_files()

export Layer Comps to PDF:
    user.ps_file_export_layer_comps_to_pdf()

export Layers [to Files]:
    user.ps_file_export_layers_to_files()

export Color Lookup [(Tables | table)]:
    user.ps_file_export_color_lookup_tables()

export Data Sets [as Files]:
    user.ps_file_export_data_sets_as_files()

export Paths [to] Illustrator:
    user.ps_file_export_paths_to_illustrator()

(export | Render) Video:
    user.ps_file_export_render_video()

Search Adobe Stock:
    user.ps_file_search_adobe_stock()

Search [Adobe] Express Templates:
    user.ps_file_search_adobe_express_templates()

## ++++++++++++++++++++ insert objects .

[File] Place [file] [as] [smart] (object | embedded):
    user.ps_file_place_embedded()

[File] Place [file] [as] Linked [(file | object)]:
    user.ps_file_place_linked()

[File] Package [file]:
    user.ps_file_package()

## +++++++++++++++++++++++ automations .

Batch process:
    user.ps_file_automate_batch()

create PDF Presentation:
    user.ps_file_automate_pdf_presentation()

Create Droplet:
    user.ps_file_automate_create_droplet()

Crop and Straighten Photos:
    user.ps_file_automate_crop_and_straighten_photos()

Contact Sheet two:
    user.ps_file_automate_contact_sheet_ii()

Conditional Mode Change:
    user.ps_file_automate_conditional_mode_change()

Fit Image:
    user.ps_file_automate_fit_image()


Merge to HDR [Pro]:
    user.ps_file_automate_merge_to_hdr_pro()

Photomerge | merge photos:
    user.ps_file_automate_photomerge()

## +++++++++++++++++++++++++++ scripts .

Image Processor | process images:
    user.ps_scripts_image_processor()

(Delete | chuck) [All] Empty Layers:
    user.ps_scripts_delete_all_empty_layers()

Flatten All Layer Effects:
    user.ps_scripts_flatten_all_layer_effects()

Flatten All Masks:
    user.ps_scripts_flatten_all_masks()


## ++++++++++++++++++++++++++++ custom scripts

Advanced Font Remapping | remap font:
    user.ps_scripts_advanced_font_remapping()

Align [to] (baseline | baselines):
    user.ps_scripts_align_to_baseline()

Clear hidden effects:
    user.ps_scripts_clear_hidden_effects()

(Delete | chuck) [all] empty layers [faster]:
    user.ps_scripts_delete_all_empty_layers_faster()

(Delete | chuck) [all] unused layers:
    user.ps_scripts_delete_unused_layers()

Fix Font Weight:
    user.ps_scripts_fix_font_weight()

Live shape resurrection | resurrect live shape:
    user.ps_scripts_live_shape_resurrection()

(Delete | chuck | remove) unused filters:
    user.ps_scripts_remove_unused_filters()

Text columns:
    user.ps_scripts_text_columns()

transform with style:
    user.ps_scripts_transform_with_style()

undeform | un deform | (remove | chuck) transformation:
    user.ps_scripts_undeform()

Load Files into Stack:
    user.ps_scripts_load_files_into_stack()

## ++++++++++++++++++++++ scripts meta .

Script statistics:
    user.ps_scripts_statistics()

Browse [for] scripts | open script:
    user.ps_scripts_browse()


## +++++++++++++++++++++ iPhone import .

import from (iphone | phone):
    user.ps_file_insert_from_iphone()

Take Photo from (iphone | phone):
    user.ps_file_insert_from_iphone_take_photo()

Scan (Documents | document) from (iphone | phone):
    user.ps_file_insert_from_iphone_scan_documents()

Add Sketch from (iphone | phone):
    user.ps_file_insert_from_iphone_add_sketch()

## ___________________________________ .

File File Info:
    user.ps_file_file_info()

File Print One Copy:
    user.ps_file_print_one_copy()

## ___________________________________ . selection

Deselect [all] | select none:
    user.ps_select_deselect()

Reselect | restore (selection | select | ants):
    user.ps_select_reselect()

## +++++++++++++++++++++ select layers .

Select All Layers:
    user.ps_select_all_layers()

Deselect Layers | (layer | layers) [select] none:
    user.ps_select_deselect_layers()

(Find | search | hunt) Layers:
    user.ps_select_find_layers()

## ++++++++++++++++++ mutate selection .

select (Inverse | opposite) | (invert | inverts | swap) (selection | select | ants):
    user.ps_select_inverse()

## ++++++++++++++++++++ focus layer(s) .

(Isolate | focus) (layer | Layers):
    user.ps_select_isolate_layers()

## ++++++++++++++++++++++++++++ select fns .

Select All:
    user.ps_select_all()

Select Color Range:
    user.ps_select_color_range()

Focus Area:
    user.ps_select_focus_area()

Select Subject:
    user.ps_select_subject()

Select Sky:
    user.ps_select_sky()

## ++++++++++++++++++ mutate selection .

Select and Mask | modify selection:
    user.ps_select_select_and_mask()

[add] Border [to] (Selection | ants) [<user.number_string>]:
    none = types.none()
    user.ps_select_modify_border(number_string or none)

Smooth (Selection | ants):
    user.ps_select_modify_smooth()

Expand (Selection | ants):
    user.ps_select_modify_expand()

Contract (Selection | ants):
    user.ps_select_modify_contract()

Feather (Selection | ants):
    user.ps_select_modify_feather()

Grow Selection:
    user.ps_select_grow()

Select Similar:
    user.ps_select_similar()

Transform Selection:
    user.ps_select_transform_selection()

## ++++++++++++++++++++++++ quick (paint) mask mode .

[(Edit [in] | (toggle | show | hide))] Quick Mask:
    user.ps_select_edit_in_quick_mask_mode()


## ++++++++++++++++++ saved selections .

Load Selection:
    user.ps_select_load_selection()

Save Selection:
    user.ps_select_save_selection()


## ++++++++++++++++++++++ 3d extrusion .

New 3D Extrusion:
    user.ps_select_new_3d_extrusion()

## ++++++++++++++++++++ color proofing .

Proof Setup:
    user.ps_view_proof_setup()

Proof Colors:
    user.ps_view_proof_colors()

Gamut Warning:
    user.ps_view_gamut_warning()

## ++++++++++++++++ pixel aspect ratio .

Pixel Aspect Ratio:
    user.ps_view_pixel_aspect_ratio()

Pixel Aspect Ratio Correction:
    user.ps_view_pixel_aspect_ratio_correction()

## +++++++++++++++ bid depth preview ? .

32-bit Preview Options:
    user.ps_view_32_bit_preview_options()

## ++++++++++++++++++++++++++++++ zoom .

Zoom In:
    user.ps_view_zoom_in()

Zoom Out:
    user.ps_view_zoom_out()

zoom fit [on screen]:
    user.ps_view_fit_on_screen()

zoom fit layer [on screen]:
    user.ps_view_fit_layers_on_screen()

zoom fit artboard [on screen]:
    user.ps_view_fit_artboard_on_screen()

zoom (100 | base) | reset zoom | default zoom | zoom default:
    user.ps_view_100()

zoom (200 | 2 x | two ex):
    user.ps_view_200()

Print Size:
    user.ps_view_print_size()

zoom actual [size]:
    user.ps_view_actual_size()

## +++++++++++++++++++++++++ flip view .

flip view horizontal:
    user.ps_view_flip_horizontal()

## ++++++++++++++++++++++++++++++ pattern preview .

Pattern Preview:
    user.ps_view_pattern_preview()

## ++++++++++++++++++++++++++++++ screen mode .

Standard Screen [Mode]:
    user.ps_view_screen_mode_standard_screen_mode()

Full Screen [Mode] With Menu [Bar]:
    user.ps_view_screen_mode_full_screen_mode_with_menu_bar()

Full Screen [Mode]:
    user.ps_view_screen_mode_full_screen_mode()

## ++++++++++++++++++++++++++++ show / hide extras.

(toggle | show | hide) Layer Edges:
    user.ps_view_show_layer_edges()

(toggle | show | hide) Selection Edges:
    user.ps_view_show_selection_edges()

(toggle | show | hide) Target Path:
    user.ps_view_show_target_path()

(toggle | show | hide) Grid:
    user.ps_view_show_grid()

(toggle | show | hide) Guides:
    user.ps_view_show_guides()

(toggle | show | hide) Canvas Guides:
    user.ps_view_show_canvas_guides()

(toggle | show | hide) Artboard Guides:
    user.ps_view_show_artboard_guides()

(toggle | show | hide) Artboard Names:
    user.ps_view_show_artboard_names()

(toggle | show | hide) Count:
    user.ps_view_show_count()

(toggle | show | hide) Smart Guides:
    user.ps_view_show_smart_guides()

(toggle | show | hide) Slices:
    user.ps_view_show_slices()

(toggle | show | hide) Notes:
    user.ps_view_show_notes()

(toggle | show | hide) Pixel Grid:
    user.ps_view_show_pixel_grid()

(toggle | show | hide) Pattern Preview Tile Bounds:
    user.ps_view_show_pattern_preview_tile_bounds()

(toggle | show | hide) 3D Secondary View:
    user.ps_view_show_3d_secondary_view()

(toggle | show | hide) 3D Ground Plane:
    user.ps_view_show_3d_ground_plane()

(toggle | show | hide) 3D Lights:
    user.ps_view_show_3d_lights()

(toggle | show | hide) 3D Selection:
    user.ps_view_show_3d_selection()

(toggle | show | hide) UV Overlay:
    user.ps_view_show_uv_overlay()

(toggle | show | hide) 3D Mesh Bounding Box:
    user.ps_view_show_3d_mesh_bounding_box()

(toggle | show | hide) Mesh:
    user.ps_view_show_mesh()

(toggle | show | hide) Edit Pins:
    user.ps_view_show_edit_pins()

## +++++++++++++++++++ multiple extras .

[view] (toggle | show | hide | flip) Extras:
    user.ps_view_extras()

[view] show All extras:
    user.ps_view_show_all()

[view] hide all extras:
    user.ps_view_show_none()

[view] (toggle | show | hide) Extras (Options | list):
    user.ps_view_show_show_extras_options()

## +++++++++++++++++++++++++++++ ruler .

(toggle | show | hide) (Rulers | ruler) | (rulers | ruler) (on | off):
    user.ps_view_rulers()


## ++++++++++++++++++++++++++++++ snap .

(toggle | enable | disable) Snap | snap (on | off):
    user.ps_view_snap()

Snap To Guides:
    user.ps_view_snap_to_guides()

Snap To Grid:
    user.ps_view_snap_to_grid()

Snap To Layers:
    user.ps_view_snap_to_layers()

Snap To Slices:
    user.ps_view_snap_to_slices()

Snap To Artboard Bounds:
    user.ps_view_snap_to_artboard_bounds()

Snap To All:
    user.ps_view_snap_to_all()

Snap To None:
    user.ps_view_snap_to_none()

## ++++++++++++++++++++++++++++ guides .

Edit Selected Guides:
    user.ps_view_guides_edit_selected_guides()

Lock Guides:
    user.ps_view_guides_lock_guides()

Clear Guides:
    user.ps_view_guides_clear_guides()

Clear Selected Guides:
    user.ps_view_guides_clear_selected_guides()

Clear Selected Artboard Guides:
    user.ps_view_guides_clear_selected_artboard_guides()

Clear Canvas Guides:
    user.ps_view_guides_clear_canvas_guides()

New Guide:
    user.ps_view_guides_new_guide()

New Guide Layout..:
    user.ps_view_guides_new_guide_layout()

New Guides From Shape:
    user.ps_view_guides_new_guides_from_shape()

## ++++++++++++++++++++++++++++ slices .

Lock Slices:
    user.ps_view_lock_slices()

Clear Slices:
    user.ps_view_clear_slices()


## +++++++++++++++++++++++++ touch bar .

Customize Touch Bar | touch bar settings:
    user.ps_view_customize_touch_bar()



## +++++++++++++++++++++++++++ history state

Undo | nope:
    user.ps_undo()

Redo:
    user.ps_redo()

[(Toggle | swap | flip)] Last [State]:
    user.ps_toggle_last_state()

## +++++++++++++++++ fade last bitmap (edit/fade..)

(Fade | fades | vade | they'd | fig) [(stroke | that)]:
    user.ps_fade()

(Fade | fades | vade | they'd | fig) [(stroke | that)] <user.number_string>:
    user.ps_fade(number_string)

(Fade | fades | vade | they'd | fig) [(stroke | that)] {user.ryan.proportions.list}:
    user.ps_fade("{user.ryan.proportions.list}")

(Fade | fades | vade | they'd | fig) [(stroke | that)] {user.ryan.photoshop.blending_mode.list}:
    none = types.none()
    user.ps_fade(none, "{user.ryan.photoshop.blending_mode.list}")

(Fade | fades | vade | they'd | fig) [(stroke | that)] ({user.ryan.photoshop.blending_mode.list} <user.number_string> | <user.number_string>  {user.ryan.photoshop.blending_mode.list} ):
    user.ps_fade(number_string, "{user.ryan.photoshop.blending_mode.list}")

(Fade | fades | vade | they'd | fig) [(stroke | that)] ({user.ryan.photoshop.blending_mode.list} {user.ryan.proportions.list} | {user.ryan.proportions.list}  {user.ryan.photoshop.blending_mode.list} ):
    user.ps_fade("{user.ryan.proportions.list}", "{user.ryan.photoshop.blending_mode.list}")

## ++++++++++++++++++++++++ fade layer .

[(Fade | fades | vade | they'd | fig)] (layer | lay) <number>:
    user.ps_command_nb("(fade-layer {{:opacity {number}}})")

[(Fade | fades | vade | they'd | fig)] (layer | lay) {user.ryan.proportions.list}:
    user.ps_command_nb("(fade-layer {{:opacity {user.ryan.proportions.list}}})")

[(Fade | fades | vade | they'd | fig)] (layer | lay) {user.ryan.photoshop.blending_mode.list}:
    user.ps_command_nb('(fade-layer {{:blending-mode "{user.ryan.photoshop.blending_mode.list}"}})')

[(Fade | fades | vade | they'd | fig)] (layer | lay) ({user.ryan.photoshop.blending_mode.list} <number> | <number>  {user.ryan.photoshop.blending_mode.list} ):
    user.ps_command_nb('(fade-layer {{:opacity {number} :blending-mode "{user.ryan.photoshop.blending_mode.list}"}})')

[(Fade | fades | vade | they'd | fig)] (layer | lay) ({user.ryan.photoshop.blending_mode.list} {user.ryan.proportions.list} | {user.ryan.proportions.list}  {user.ryan.photoshop.blending_mode.list} ):
    user.ps_command_nb('(fade-layer {{:opacity {user.ryan.proportions.list} :blending-mode "{user.ryan.photoshop.blending_mode.list}"}})')

## +++++++++++++++++++++++ cut / paste .

Cut:
    user.ps_cut()

Copy:
    user.ps_copy()

copy merged:
    user.ps_copy_merged()

[photo] (paste | pace):
    user.ps_paste()

[photo] (paste | pace) [text | type] (raw | unformatted | without formatting | [and] match style):
    user.ps_paste_without_formatting()

[photo] (paste | pace) [(in | to)] place:
    user.ps_paste_in_place()

[photo] (paste | pace) into:
    user.ps_paste_into()

[photo] (paste | pace) outside:
    user.ps_paste_outside()

## +++++++++++++++++++++++++++++ clear .

Clear:
    user.ps_clear()

## ++++++++++++++++++++++++++++ search .

Search:
    user.ps_search()

Check Spelling:
    user.ps_check_spelling()

[Find and] Replace Text:
    user.ps_find_and_replace_text()
    
## ++++++++++++++++++++++++++++ stroke .

Stroke (select | selection | ants):
    user.ps_stroke()

## ++++++++++++++++++++++++++++++ fill .

custom fill | fill custom:
    user.ps_fill()

(fill | bill | fil) [that] [with] [(foreground | primary | first)]  [color]: 
    key(alt-delete)

fill [that] [with] (background | second | secondary) [color]: 
    key(cmd-delete)

Content Aware Fill:
    user.ps_content_aware_fill()

Generative Fill:
    user.ps_generative_fill()

Content Aware Scale:
    user.ps_content_aware_scale()

## +++++++++++++++++++++++++ transform .

Puppet Warp:
    user.ps_puppet_warp()

Perspective Warp:
    user.ps_perspective_warp()

[free] transform:
    user.ps_free_transform()

[free] transform path:
    user.ps_free_transform_path()

[transform] Again:
    user.ps_transform_again()

[transform] (Scale | skill) [that]:
    user.ps_scale()

[transform] Rotate:
    user.ps_rotate()

[transform] Skew:
    user.ps_skew()

[transform] Distort:
    user.ps_distort()

[transform] Perspective:
    user.ps_transform_perspective()

[transform] Warp:
    user.ps_warp()

[transform] Split Warp (Horizontally | horizontal):
    user.ps_split_warp_horizontally()

[transform] Split Warp (Vertically | vertical):
    user.ps_split_warp_vertically()

[transform] Split Warp Crosswise:
    user.ps_split_warp_crosswise()

[transform] Remove Warp Split:
    user.ps_remove_warp_split()

[transform] Convert warp anchor point:
    user.ps_convert_warp_anchor_point()

[transform] Toggle Guides:
    user.ps_toggle_transform_guides()

[transform] Rotate one eighty [degrees] [Clockwise]:
    user.ps_rotate_180()

[transform] Rotate Ninety [degrees] [Clockwise]:
    user.ps_rotate_90_clockwise()

[transform] Rotate Ninety [degrees] Counter [Clockwise]:
    user.ps_rotate_90_counter_clockwise()

[transform] (flip | the) horizontal:
    user.ps_flip_horizontal()

[transform] Flip Vertical:
    user.ps_flip_vertical()


Auto Blend Layers:
    user.ps_auto_blend_layers()

replace sky:
    user.ps_sky_replacement()

## +++++++++++++++++++++++++++++ purge state

Purge Clipboard:
    user.ps_purge_clipboard()

Purge Histories:
    user.ps_purge_histories()

Purge All:
    user.ps_purge_all()

Purge Video Cache:
    user.ps_purge_video_cache()

## ++++++++++++++++++++++++++++ manage presets

Define Brush Preset:
    user.ps_define_brush_preset()

Define Pattern:
    user.ps_define_pattern()

Define Custom Shape:
    user.ps_define_custom_shape()


Adobe PDF Presets:
    user.ps_adobe_pdf_presets()

Preset Manager:
    user.ps_preset_manager()

Migrate Presets:
    user.ps_migrate_presets()

(Export | Import) Presets:
    user.ps_export_import_presets()

## +++++++++++++++++++++++++ ps config .

Open settings:
    user.ps_open_settings()

Remote Connection settings:
    user.ps_remote_connections()

[edit] Color Settings:
    user.ps_color_settings()

Convert to Profile:
    user.ps_convert_to_profile()

[(go | edit | open)]  [keyboard] shortcuts:
    user.ps_keyboard_shortcuts()

edit Menus:
    user.ps_menus()

edit Toolbar:
    user.ps_toolbar()

Start Dictation:
    user.ps_start_dictation()

## ++++++++++++++++++++++++ color mode .

color mode Bitmap:
    user.ps_mode_bitmap()

color mode Grayscale:
    user.ps_mode_grayscale()

color mode Duotone:
    user.ps_mode_duotone()

color mode Indexed:
    user.ps_mode_indexed_color()

color mode (red green blue | rgb):
    user.ps_mode_rgb_color()

color mode (cmyk | cyan magenta):
    user.ps_mode_cmyk_color()

color mode lab:
    user.ps_mode_lab_color()

color mode Multichannel:
    user.ps_mode_multichannel()

color mode eight bits:
    user.ps_mode_8_bits()

color mode sixteen bits:
    user.ps_mode_16_bits()

color mode thirty two bits:
    user.ps_mode_32_bits()

Color Table:
    user.ps_mode_color_table()

## +++++++++++++++++++++++ image adjustments .

[adjust] (Brightness | Contrast):
    user.ps_adjustments_brightness_contrast()

[adjust] Levels:
    user.ps_adjustments_levels()

[adjust] Curves:
    user.ps_adjustments_curves()

[adjust] Exposure:
    user.ps_adjustments_exposure()

[adjust] Vibrance:
    user.ps_adjustments_vibrance()

[adjust] (Hue | Saturation):
    user.ps_adjustments_hue_saturation()

[adjust] Color Balance:
    user.ps_adjustments_color_balance()

[adjust] Black and White:
    user.ps_adjustments_black_and_white()

[adjust] Photo Filter:
    user.ps_adjustments_photo_filter()

[adjust] Channel Mixer:
    user.ps_adjustments_channel_mixer()

[adjust] (Lookup color | Color Lookup):
    user.ps_adjustments_color_lookup()

[adjust] Invert:
    user.ps_adjustments_invert()

[adjust] Posterize:
    user.ps_adjustments_posterize()

[adjust] Threshold:
    user.ps_adjustments_threshold()

[adjust] Gradient Map:
    user.ps_adjustments_gradient_map()

[adjust] Selective Color:
    user.ps_adjustments_selective_color()

[adjust] (Shadows |  Highlights):
    user.ps_adjustments_shadows_highlights()

[adjust] HDR Toning:
    user.ps_adjustments_hdr_toning()

[adjust] (HDR | High Def range):
    user.ps_adjustments_hdr__high_def_range()

[adjust] Desaturate:
    user.ps_adjustments_desaturate()

[adjust] Match Color:
    user.ps_adjustments_match_color()

[adjust] Replace Color..:
    user.ps_adjustments_replace_color()

Equalize [color]:
    user.ps_adjustments_equalize()

## +++++++++++++++++++++++++++ auto adjustments

Auto Tone:
    user.ps_auto_tone()

Auto Contrast:
    user.ps_auto_contrast()

Auto Color:
    user.ps_auto_color()

## +++++++++++++++++++++ document size .

[change] Image Size:
    user.ps_image_size()

[change] Canvas Size:
    user.ps_canvas_size()

## ++++++++++++++++++++++ rotate image .

rotate image (one eighty [degrees] | half):
    user.ps_rotate_180()

rotate image ninety [degrees] [clockwise]:
    user.ps_rotate_90_clockwise()

rotate image ninety [degrees] counter [clockwise]:
    user.ps_rotate_90_counter_clockwise()

rotate image [ arbitrary]:
    user.ps_rotate_arbitrary()

## ++++++++++++++++++++++++ flip canvas

Flip Canvas Horizontal:
    user.ps_flip_canvas_horizontal()

Flip Canvas Vertical:
    user.ps_flip_canvas_vertical()


## ++++++++++++++++++++++++++++ crop .

Crop:
    user.ps_crop()

Trim:
    user.ps_trim()

Reveal All:
    user.ps_reveal_all()


## ++++++++++++++++++++ spawn new imagee .

Duplicate Image:
    user.ps_duplicate_image()

Apply Image..:
    user.ps_apply_image()

image Calculations:
    user.ps_calculations()

## +++++++++++++++++++++++++ variable data

define variables:
    user.ps_variables_define()

[variable] data sets:
    user.ps_variables_data_sets()

Apply Data Set:
    user.ps_apply_data_set()

photo Trap:
    user.ps_trap()

Set Measurement Scale:
    user.ps_analysis_set_measurement_scale()

Select Data Points:
    user.ps_analysis_select_data_points()

Record Measurements:
    user.ps_analysis_record_measurements()

Ruler Tool:
    user.ps_analysis_ruler_tool()

Count Tool:
    user.ps_analysis_count_tool()

Place Scale Marker:
    user.ps_analysis_place_scale_marker()

Plugins Panel:
    user.ps_plugins_panel()

Browse Plugins:
    user.ps_browse_plugins()

Manage Plugins..:
    user.ps_manage_plugins()

ProStacker:
    user.ps_plugins_prostacker()

[(windows | tabs)] Tile (all | windows) (Vertical | vert):
    user.ps_window_tile_all_vertically()

[(windows | tabs)] Tile (all | windows) (Horizontal | horz):
    user.ps_window_tile_all_horizontally()

[(windows | tabs)] two up (Horizontal | horz) | tabs two up (Horizontal | horz | horizontally) | tabs two wide:
    user.ps_window_2_up_horizontal()

[(windows | tabs)] two up (Vertical | vert) | tabs two up [(Vertical | Vertically | vert)]:
    user.ps_window_2_up_vertical() 

[(windows | tabs)] three up (Horizontal | horz):
    user.ps_window_3_up_horizontal()

[(windows | tabs)] three up (Vertical | vert):
    user.ps_window_3_up_vertical()

[(windows | tabs)] three up stacked:
    user.ps_window_3_up_stacked()

[(windows | tabs)] [windows] four up:
    user.ps_window_4_up()

[(windows | tabs)] six up:
    user.ps_window_6_up()

(consolidate | group | gather) [windows] [to] tabs:
    user.ps_window_consolidate_all_to_tabs()

cascade windows:
    user.ps_window_cascade()

Tile windows:
    user.ps_window_tile()

Float in Window:
    user.ps_window_float_in_window()

Float All in Windows:
    user.ps_window_float_all_in_windows()

Match Zoom:
    user.ps_window_match_zoom()

Match Location:
    user.ps_window_match_location()

Match Rotation:
    user.ps_window_match_rotation()

Match All:
    user.ps_window_match_all()

Minimize [window]:
    user.ps_window_minimize_window()

windows to Front:
    user.ps_window_bring_all_to_front()

Workspace ryan1:
    user.ps_workspace_ryan1()

Workspace rvan2:
    user.ps_workspace_rvan2()

Workspace Essentials (Default):
    user.ps_workspace_essentials_default()

Workspace 3D:
    user.ps_workspace_3d()

Workspace Motion:
    user.ps_workspace_motion()

Workspace Painting:
    user.ps_workspace_painting()

Workspace Photography:
    user.ps_workspace_photography()

Workspace Graphic and Web:
    user.ps_workspace_graphic_and_web()

Workspace New Workspace:
    user.ps_workspace_new()

Workspace Delete Workspace:
    user.ps_workspace_delete()

Workspace Keyboard Shortcuts & Menus:
    user.ps_workspace_keyboard_shortcuts_and_menus()

Workspace Lock Workspace:
    user.ps_workspace_lock_workspace()

bar Actions:
    user.ps_window_actions()

bar Adjustments:
    user.ps_window_adjustments()

bar Beta Feedback:
    user.ps_window_beta_feedback()

bar Brush Settings:
    user.ps_window_brush_settings()

bar Brushes:
    user.ps_window_brushes()

bar Channels:
    user.ps_window_channels()

bar Character:
    user.ps_window_character()

bar (character | char) (styles | style):
    user.ps_window_character_styles()

bar (clone source | clone | cloning):
    user.ps_window_clone_source()

bar Color:
    user.ps_window_color()

bar Comments:
    user.ps_window_comments()

bar Content Credentials (Beta):
    user.ps_window_content_credentials_beta()

bar Glyphs:
    user.ps_window_glyphs()

bar (gradients | grads):
    user.ps_window_gradients()

bar Histogram:
    user.ps_window_histogram()

bar History:
    user.ps_window_history()

bar Info:
    user.ps_window_info()

bar Layer (Comps | compositions):
    user.ps_window_layer_comps()

bar (layer | layers):
    user.ps_window_layers()

bar Libraries:
    user.ps_window_libraries()

bar Materials:
    user.ps_window_materials()

bar Measurement Log:
    user.ps_window_measurement_log()

bar Navigator:
    user.ps_window_navigator()

bar Notes:
    user.ps_window_notes()

bar Paragraph:
    user.ps_window_paragraph()

bar Paragraph Styles:
    user.ps_window_paragraph_styles()

bar Paths:
    user.ps_window_paths()

bar Patterns:
    user.ps_window_patterns()

bar (properties | props):
    user.ps_window_properties()

bar Shapes:
    user.ps_window_shapes()

bar Styles:
    user.ps_window_styles()

[bar] Swatches:
    user.ps_window_swatches()

bar Timeline:
    user.ps_window_timeline()

bar [tool] presets:
    user.ps_window_tool_presets()

bar Version History:
    user.ps_window_version_history()

bar Application Frame:
    user.ps_window_application_frame()

bar Options:
    user.ps_window_options()

bar Tools:
    user.ps_window_tools()

bar (floating | context | task) | [(toggle | show | hide)] [contextual] task bar:
    user.ps_window_contextual_task_bar()

# ++++++ brush  manipulation .

## ++++++++++++++++++++++++ brush size .

brush [size]  <user.number_string> :
    user.ps_command_nb("(set-brush-size! {number_string})")

brush [size] down [<user.number_string>]: 
    key("[:{number_string or 1}")

brush [size] up [<user.number_string>]: 
    key("]:{number_string or 1}")
 
## ++++++++++++++++++++ Brush hardness .
 
[brush] (hardness | hard) up [<user.number_string>]: 
     key("shift-]:{number_string or 1}")
 
[brush] (hardness | hard) down [<user.number_string>]: 
     key("shift-[:{number_string or 1}")
 
  ## +++|+++++++++++++++++++++++++++ flow .
 
[brush] flow <user.number_string>:
    user.ps_set_brush_flow(number_string)

# ex hitting 5 = level 50
[brush] flow level <user.number_string>: 
     key("shift-{number_string}")

[brush] flow max:
    key(shift-0) 
 
## +++++++++++++++++++++++++++ opacity .
 
[brush] (opacity | transparency | trans | opaque) <user.number_string> : 
    user.ps_set_brush_opacity(number_string)
 
[brush] (opacity | transparency | trans | opaque) level <user.number_string>: 
     key("{number_string}") 
 
[brush] (opacity | transparency | trans | opaque)  max: 
     key(0)    
 

## +++++++++++++++++++++++++++++ tools .

move group [tool]: 
    user.ps_select_move_group_tool()

move layer [tool]:
    user.ps_select_move_layer_tool()


{user.ryan.photoshop.tools.list} [(tool | to)]:
    user.ps_command_nb("(select-tool! :{user.ryan.photoshop.tools.list})")

# {user.ryan.photoshop.tool_key.list} [(tool | to)]:
#     key(user.ryan.photoshop.tool_key.list)

hold {user.ryan.photoshop.tool_key.list} |  {user.ryan.photoshop.tool_key.list} (mode | hold):
    key("{user.ryan.photoshop.tool_key.list}:down")

(release | exit) {user.ryan.photoshop.tool_key.list} |  {user.ryan.photoshop.tool_key.list} (release | exit):
    key("{user.ryan.photoshop.tool_key.list}:up")

(other | next | last | prev) {user.ryan.photoshop.tool_key.list} [(tool | to) | {user.ryan.photoshop.tool_key.list} (next | last | prev)]:
    key("shift-{user.ryan.photoshop.tool_key.list}")


## ++++++++++++++++++++++ jpeg filename helpers


^jpeg <number_small>: 
    insert(".jpg{number_small}")

^jpeg <number_small> [(file name | filename)] <user.text> :
    insert("{text}.jpg{number_small}")

^jpeg <number_small> [(file name | filename)] (pace | paste):
    t = clip.text()
    insert("{t}.jpg{number_small}") 

## +++++++++++++++++++++++ clone stamp .

rotate clone [<number>]:
    user.ps_rotate_clone(number or 1)


## ++++++++++++++++++ background color .

# this .talon list reference points to this relative path: ryan/photoshop/backdrop_color.talon-list 
[set] [canvas] backdrop [color] [to] {user.ryan.photoshop.backdrop_color.list}:
    user.ps_set_backdrop_color(user.ryan.photoshop.backdrop_color.list or "medium gray")

## +++++++++++++++++++++ copy/past color
[photo] paste color:
    user.ps_click() 
    key(cmd-v enter)

[photo] copy color:
    user.ps_click() 
    key(cmd-c esc)

## +++++++++++++++++++++++++++ testing .

photo test trace:
    user.ps_command_nb("(test-trace)")


## ++++++ Clone and rasterize gradient .

Clone [and] (raster | rasterize) (layer | gradient) [<user.text>]:
    user.ps_duplicate_layer(text or "cloned layer")
    user.ps_toggle_layer_visibility()
    sleep(300ms)
    user.ps_go_layer_down()
    sleep(300ms)
    user.ps_rasterize_layer()

## ++++++++++++++++++++ set font / character state . 

[set] (font | type) style {user.ryan.photoshop.font_styles.list}:
    user.ps_command_nb("(set-text-font! \"Avenir Next Condensed\" \"{user.ryan.photoshop.font_styles.list}\")")

[set] font size <user.number_string>:
    print("setting font size {number_string}")
    user.ps_command_nb("(set-font-size! {number_string})")

[set] [font] tracking <user.number_signed_string>:
    user.ps_command_nb("(set-font-tracking! {number_signed_string})")

((increase | raise | boost) [font] tracking  | [font] tracking (up | raise | boost | add)) <user.number_string>:
    user.ps_command_nb("(update-font-tracking! {number_string})")

((decrease  | lower | reduce) [font] tracking  | [font] tracking (down | remove | subtract)) <user.number_string>:
    user.ps_command_nb("(update-font-tracking! -{number_string})")


## +++++++++++++++++++++++++++++ transform draggging .

centered [scale] drag:
    user.mouse_drag(0)
    # user.grid_close()
    sleep(2000ms)
    key("alt:down")
    
clone drag | drag copy:
    key("alt:down")
    user.mouse_drag(0)
    # close the mouse grid
    user.grid_close()

set [transform] (anchor | origin) [point]:
    key(alt:down)
    mouse_click(0)


drag [current] layer:
    key(cmd:down)
    user.mouse_drag(0)
    # # close the mouse grid
    user.grid_close()

#doesnt work for dragging transform

## ++++++++++++++++++++++++++ tracking .

#  # mimic("point tracking")
# go tracking: 
#     mouse_move(914.6171875, 186.5703125)
#     sleep(3300ms)
#     mouse_click(0)

# # mimic("point tracking")
# [set] tracking [<user.number_string>]: 
#     mouse_move(914.6171875, 186.5703125)
#     sleep(2500ms)
#     mouse_click(0)
#     insert(number_string)
#     sleep(50ms)Bottom
#     key(enter)

# [set] tracking (negative | neg) [<user.number_string>]: 
#     mynum = "-" + number_string
#     mouse_move(914.6171875, 186.5703125)
#     sleep(2500ms)
#     mouse_click(0)
#     insert(mynum)
#     key(enter)

## ++++++++++++++++ history navigation .

# step backwards [<user.n20>]: key("cmd-alt-z:{n20 or 1}")
# step forwards [<user.n20>]: key("cmd-shift-z:{n20 or 1}")


## ++++++++++ primary /secondary color .

(default | reset) colors: key(d)

(swap | flip) (colors | color | brush): key(x)

## +++++++++ toggle colors for masking .

color black | paint mask | (mask | erase) (pixels | layer): 
    key(d)
    sleep(100ms)
    key(x)

color white | erase mask | (unmask | paint) (pixels | layer): 
    key(d)

paint (inside | outside) | (swap | flip) masking [brush] [polarity]: 
    key(x)

## +++++++++++++++++++++++++ edit text .

edit text [(here | point)]:
    user.ps_place_cursor_in_text() 

take text [(here | point)]:
    user.ps_select_text()

copy text [block] [(here | point)]:
    user.ps_select_text()
    sleep(500ms)
    edit.copy()

(paste | pace) text [(here | point)]:
    user.ps_select_text()
    key(cmd-v)

(paste | pace) (no |  without) (formatting | format): 
    user.menu_select('Edit|Paste Special|Paste without Formatting')

(paste | pace) [text] raw [(here | point)]:
    user.ps_select_text()
    user.menu_select('Edit|Paste Special|Paste without Formatting')



