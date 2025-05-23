(ns ps-menu-commands
  (:require [clojure.string :as string]
            [clojure.data.xml :as xml]
            [clojure.edn :as edn]
            [babashka.fs :as fs]
            [clojure.java.io :as io]
            ))

(def root-path (fs/cwd))

(defn read-edn-file [file-path]
  (with-open [reader (io/reader file-path)]
    (edn/read reader)))

(comment 
  (fs/file-name ".")
  (read-edn-file "deps.edn" ))

(defn xml-to-edn [xml-file #_output-file]
  (let [parsed-xml (xml/parse (io/input-stream xml-file))]
    parsed-xml
    #_(spit output-file (pr-str parsed-xml))))

(comment 
  (let 
    [parse-thing
     (fn [x]
       (let [{:keys [content attrs]}
             (into {} x)
             inner-thing
             (->> content
               (map
                 (fn [y]
                   (if (string? y)
                     {:keys y}
                     (let [{:keys [attrs content]}
                           (into {} y)]
                       {
                        ;; :attrs2 attrs ;; all empty
                        :keys (first content)})))))]
         (merge 
           attrs
           (first inner-thing)
           )))]
    (->>
      (xml-to-edn "../photoshop/ps keys.xml")
      :content
      (take 102)
      (map parse-thing)
      #_(map count)
      #_(map :cmd)
      #_(map 
        #(map count %))
      flatten
      ;; (map :attrs2)
     #_(distinct)
      (filter 
        #(string/includes? (:name %) "Others"))
      
      )))


(defn add-text-to-menu-item
  [menu-item 
   {:keys [pre post] 
    :as additions}]
  (cond
    (string? menu-item)
    [menu-item additions]
  
    (vector? menu-item)
    (let [[menu-item-command-str 
           {menu-item-pre :pre 
            menu-item-post :post 
            :as menu-item-config}]
          menu-item]
      (cond 
        
        (string? menu-item-config)
        (let [custom-command-str menu-item-config]
          [ menu-item-command-str 
           (str pre " " custom-command-str " " post)])
        
        (map? menu-item-config)
        [menu-item-command-str
         (cond-> menu-item-config
           (and post menu-item-post)
           (assoc :post (str menu-item-post " " post))

           (and post (nil? menu-item-post))
           (assoc :post menu-item-post)

           (and pre menu-item-pre)
           (assoc :pre (str menu-item-pre " " pre))

           (and pre (nil? menu-item-pre))
           (assoc :pre menu-item-pre))]
        
        :else menu-item) )
  
    :else menu-item))

(def layer-menu
  {"Layer"
   [{:pre true
     "New"
     ["Layer..."
      "Background from Layer"
      "Group..."
      "Group from Layers..."
      "Artboard..."
      "Artboard from Group..."
      "Artboard from Layers..."
      "Frame from Layers..."
      ["Convert to Frame"]
      ["Layer Via Copy" "Layer [via] Copy"]
      ["Layer Via Cut" "Layer [Via] Cut"]]}
    ["Copy CSS" "Copy (CSS | C S S | cee es es)"]
    ["Copy SVG" "Copy (S V G | es vee gee)"]
    "Duplicate Layer..."
  
    {:pre true
     "Delete"
     ["Layer"
      "Hidden Layers"]}
    ["Export As..." "Export Layer As"]
    ["Rename Layer..." "(Rename Layer | layer rename)"]
    ["Rename Artboard..." "(Rename artboard | artboard rename)"]
    {"Layer Style"
     [["Blending Options..." "[layer] (Blending | blend) (Options | opts)"]
      ["Bevel & Emboss..." "(Bevel | Emboss) [layer] style"]
      ["Stroke..." {:post "[layer] style"}]
      ["Inner Shadow..." {:post "[layer] style"}]
      ["Inner Glow..." {:post "[layer] style"}]
      ["Satin..." {:post "[layer] style"}]
      ["Color Overlay..." {:post "[layer] style"}]
      ["Gradient Overlay..." {:post "[layer] style"}]
      ["Pattern Overlay..." {:post "[layer] style"}]
      ["Outer Glow..." {:post "[layer] style"}]
      ["Drop Shadow..." {:post "[layer] style"}]
      ["Copy Layer Style" "Copy [Layer] Style"]
      ["Paste Layer Style" "Paste [Layer] Style"]
      ["Clear Layer Style" "Clear [Layer] Style"]
      "Global Light..."
      ["Create Layer" {:post "style"}]
      ["Hide All Effects" "Hide All (Effects | styles)"]
      ["Scale Effects..." "Scale (Effects | styles | style)"]]}
  
    "Smart Filter"
    {"New  Layer"
     [["Solid Color..." "New Solid Layer"]
      ["Gradient..." "New Gradient Layer"]
      ["Pattern..." "New Pattern Layer"]]}
    {:pre "new" :post "layer"
     "New Adjustment Layer"
     [["Brightness/Contrast..." "(Brightness | Contrast)"]
      "Levels..."
      "Curves..."
      "Exposure..."
      "Vibrance..."
      ["Hue Saturation..." "(Hue | Saturation)"]
      "Color Balance..."
      ["Black & White..." "Black and White"]
      "Photo Filter..."
      "Channel Mixer..."
      ["Color Lookup..." "(Lookup color | Color Lookup)"]
      "Invert"
      "Posterize..."
      "Threshold..."
      "Gradient Map..."
      "Selective Color..."]}
    "Layer Content Options"
    {"Layer Mask"
     [["Reveal All" {:pre "new layer mask"}]
      ["Hide All" {:pre "new layer mask"}]
      ["Reveal Selection" {:pre "new layer mask"}]
      ["Hide Selection" {:pre "new layer mask"}]
      ["From Transparency" {:pre "new layer mask"}]
      ["Delete" {:post "layer mask"}]
      ["Apply" {:post "layer mask"}]
      ["Enable" "(enable | disable) layer mask"]
      ["Link" "(link | unlink) layer mask"]]}
    {"Vector Mask"
     [["Reveal All" "New vector mask reveal [all]"]
      ["Hide All" {:pre "New vector mask"}]
      ["Current Path" {:pre "New vector mask [from]"}]
      ["Delete" {:post "vector mask"}]
      ["Enable" "(enable | disable) vector mask"]
      ["Link" "(link | unlink) vector mask"]]}
    ["Create Clipping Mask" "([(Create | make)] (Clipping | clip) Mask)"]
    "Mask All Obiects"
    {"Smart Objects"
     [["Convert to Smart Object" "(Convert to | make) Smart Object"]
      ["New Smart Object via Copy" "copy to Smart Object"]
      "Reveal in Finder"
      "Update Modified Content"
      "Update All Modified Content"
      "Edit Contents"
      "Reset Transform"
      "Relink to File..."
      "Relink to Library Graphic..."
      "Replace Contents..."
      "Export Contents..."
      "Embed Linked"
      "Embed All Linked"
      "Convert to Linked..."
      "Convert to Layers"
      "Stack Mode"
      ["Rasterize" "rasterize [layer]"]]}
    "Video Layers"
    {:pre "(rasterize | raster | pixelate)"
     "Rasterize"
     ["Type"
      "Shape"
      " Content"
      "Vector Mask"
      "Smart Obiect"
      "Video"
      "3D"
      "Layer Style"
      "Layer"
      "All Layers"]}
    ["New Layer Based Slice" "new layer slice"]
    "Group Layers"
    "Ungroup Layers"
    "Hide Layers"
    {"Arrange"
     [["Bring to Front" "(Bring | send) to (Front | top)"]
      ["Bring Forward" "(Bring | send) (forward | up)"]
      ["Send Backward" "send (back | backward | down) "]
      ["Send to Back" "send to (back | bottom)"]
      ["Reverse" "reverse (layer | layers) [order]"]]}
    {"Combine Shapes"
     ["Unite Shapes"
      "Subtract Front Shape"
      ["Unite Shapes at Overlap"  "Unite Shapes [at] Overlap"]
      ["Subtract Shapes at Overlap" "Subtract Shapes [at] Overlap"]]}
    {:pre true
     "Align"
     ["Top Edges"
      "Vertical Centers"
      "Bottom Edges"
      "Left Edges"
      "Horizontal Centers"
      "Right Edges"]}
    "Align Layers to Artboard"
    {:pre "(spread | distribute)"
     "Distribute"
     ["Top Edges"
      "Vertical Centers"
      "Bottom Edges"
      "Left Edges"
      "Horizontal Centers"
      "Right Edges"
      "Horizontally"
      "Vertically"]}
    "Lock Layers..."
    "Link Layers"
    "Select Linked Layers"
    "Merge Layers"
    ["Merge Visible" {:post "[layers]"}]
    "Flatten Image"
    {"Matting"
     [["Color Decontaminate" {:post "matte"}]
      ["Defringe..." {:post "matte"}]
      "Remove Black Matte"
      "Remove White Matte"]}]})

(def type-menu
  {"Type"
   ["More from Adobe Fonts..."
    {"Panels"
     ["Character Panel"
      "Paragraph Panel"
      "Glyphs Panel"
      "Character Styles Panel"
      "Paragraph Styles Panel"]}
    {:pre "[type] anti alias"
     "Anti-Alias"
     ["None"
      "Sharp"
      "Crisp"
      "Strong"
      "Smooth"
      "Mac LCD"
      "Mac"]}
    {:pre "type" 
     "Orientation"
     ["Horizontal"
      "Vertical"]}
    {:pre "open type"
     "OpenType"
     ["Standard Ligatures"
      "Contextual Alternates"
      "Discretionary Ligatures"
      "Swash"
      "Oldstyle"
      "Stylistic Alternates"
      "Titling Alternates"
      "Ornaments"
      "Ordinals"
      "Fractions"
      "Justification Alternates"
      "Japanese 78"
      "Japanese Expert"
      "Japanese Traditional"
      "Proportional Metrics"
      "Kana"
      "Roman Italics"]}
    "Extrude to 3D"
    ["Create Work Path" {:pre "type"}]
    ["Convert to Shape" {:pre "type"}]
    "Rasterize Type Layer"
    "Convert to Paragraph Text"
    "Warp Text..."
    "Match Font..."
    {:pre "font preview"
     "Font Preview Size"
     ["None"
      "Small"
      "Medium"
      "Large"
      "Extra Large"
      "Huge"]}
    ["Language Options" {:pre "type"}]
    "Update All Text Layers"
    "Manage Missing Fonts"
    "Paste Lorem Ipsum"
    "Load Default Type Styles"
    "Save Default Type Styles"]})

(def filter-menu
  {"Filter"
   ["Last Filter"
    "Convert for Smart Filters"
    "Neural Filters..."
    "Filter Gallery..."
    ["Adaptive Wide Angle..." "Wide Angle [filter]"]
    "Camera Raw Filter..."
    "Lens Correction..."
    "Liquify..."
    "Vanishing Point..."
         ;{"3D"}
    {"Blur"
     ["Average"
      "Blur"
      "Blur More"
      "Box Blur..."
      "Live Gaussian Blur..."
      "Gaussian Blur..."
      "Lens Blur..."
      "Motion Blur..."
      "Radial Blur..."
      "Shape Blur..."
      "Smart Blur..."
      "Surface Blur..."]}
    {"Blur Gallery"
     ["Field Blur.."
      "Iris Blur..."
      "Tilt-Shift..."
      "Path Blur..."
      "Spin Blur..."]}
    {"Distort"
     ["Displace..."
      "Pinch..."
      "Polar Coordinates..."
      "Ripple..."
      "Shear..."
      "Spherize..."
      "Twirl..."
      "Wave..."
      "ZigZag..."]}
    {"Noise"
     ["Add Noise..."
      "Despeckle"
      "Dust & Scratches..."
      "Median..."
      "Reduce Noise..."]}
    {"Pixelate"
     ["Color Halftone..."
      "Crystallize..."
      "Facet"
      "Fragment"
      "Mezzotint..."
      "Mosaic..."
      "Pointillize..."]}
    {"Render"
     ["Flame..."
      "Picture Frame..."
      "Tree..."
      "Clouds"
      "Difference Clouds"
      "Fibers..."
      "Lens Flare..."
      "Lighting Effects..."]}
    {"Sharpen"
     ["Sharpen"
      "Sharpen Edges"
      "Sharpen More"
      "Smart Sharpen..."
      "Unsharp Mask..."]}
    {"Stylize"
     ["Diffuse..."
      "Emboss..."
      "Extrude..."
      "Find Edges"
      "Oil Paint..."
      "Solarize"
      "Tiles..."
      "Trace Contour..."
      "Wind..."]}
         ;{"Video"}
    {"Other"
     [["Custom..." {:post "filter"}]
      "High Pass..."
      ["HSB/HSL" "(hsl | hue saturation lightness)"]
      "Maximum..."
      "Minimum..."
      "Offset..."]}]})

(def file-menu 
  {:pre true
   "File"
   ["New..."
    "Open..."
    "Browse in Bridge..."
    "Open as Smart Object..."
    "Open Recent"
    "Close"
    "Close All"
    "Close Others"
    "Close and Go to Bridge..."
    "Save"
    "Save As..."
    "Save a Copy..."
    "Revert"
    "Invite to Edit..."
    "Share for Review NEW..."
    {"Export"
     ["Quick Export as PNG"
      ["Export As..." "Export (as | [for] web [file])"]
      "Export Preferences..."
      ["Save for Web (Legacy)..." "Save for Web [(legacy | classic)]"]
      ["Artboards to Files..." {:pre "export"}]
      ["Artboards to PDF..." {:pre "export"}]
      "Export For Aero..."
      "Layer Comps to Files..."
      "Layer Comps to PDF..."
      ["Layers to Files..." {:pre "[export]"}]
      ["Color Lookup Tables..." {:pre "export"}]
      "Data Sets as Files..."
      ["Paths to Illustrator..." {:pre "[export]"}]
      "Render Video..."]}

    "Search Adobe Stock..."
    "Search Adobe Express Templates..."
    "Place Embedded..."
    "Place Linked..."
    "Package..."
    {"Automate"
     [#_{"Generator Plugins"
       [["Image Assets" "generate (images | image assets)"]]}
      "Batch..."
      "PDF Presentation..."
      "Create Droplet..."
      "Crop and Straighten Photos"
      "Contact Sheet II..."
      "Conditional Mode Change..."
      "Fit Image..."
      ["Lens Correction..." "Lens Correction Script"]
      "Merge to HDR Pro..."
      "Photomerge..."]}
    {"Scripts"
     ["Image Processor..."
      "Delete All Empty Layers"
      "Flatten All Layer Effects"
      "Flatten All Masks"
      "[M] Advanced Font Remapping 1.0"
      "[M] Align to baseline 1.1"
      "[M] Clear hidden effects 1.1"
      "[M] Delete all empty layers faster v1.1"
      "[M] Delete unused layers 1.0"
      "[M] Fix Font Weight 1.0"
      "[M] Live shape resurrection v1.1"
      "[M] Remove unused filters 1.0"
      "[M] Text columns 1.1"
      "[M] Toggle locks 1.0"
      ["[M] Transform with style 1.1" "transform with style"]
      ["[M] Undeform 1.1" "(undeform | un deform | remove transformation)"]
      ["[M] Unsmart 2.1.3" "unsmart | un smart | remove smart object"]
        ;;  "Script Events Manager..."
      "Load Files into Stack..."
        ;;  "Load Multiple DICOM Files..."
      ["Statistics..." "Script statistics"]
      ["Browse..." "Browse scripts"]]}
    #_{"Import"
       ["Variable Data Sets.."
        "Video Frames to Layers..."
        "Images from Device..."
        "Notes..."]}
    {:post "from iphone"
     "Insert from iPhone"
     [["iPhone (2)" "insert"]
      "Take Photo"
      "Scan Documents"
      "Add Sketch"]}
    "File Info..."
    ["Version History"]
    ["Print..."]
    "Print One Copy"]})

(def select-menu
  {"Select"
   [["All" "Select All"]
    "Deselect"
    "Reselect"
    "Inverse"
    ["All Layers" "Select All Layers"]
    "Deselect Layers"
    ["Find Layers" "Find Layers"]
    "Isolate Layers"
    ["Color Range..." "Select Color Range"]
    "Focus Area..."
    ["Subject" "Select Subject"]
    ["Sky" "Select Sky"]
    "Select and Mask..."
    {:post "Selection"
     "Modify"
     ["Border..."
      "Smooth..."
      "Expand..."
      "Contract..."
      "Feather..."]}
    ["Grow" {:post "Selection"}]
    ["Similar" {:pre "Select"}]
    "Transform Selection"
    ["Edit in Quick Mask Mode" "Edit [in] Quick Mask"]
    "Load Selection..."
    "Save Selection..."
    "New 3D Extrusion"]})

(def view-menu 
  {"View"
   ["Proof Setup"
    "Proof Colors"
    "Gamut Warning"
    "Pixel Aspect Ratio"
    "Pixel Aspect Ratio Correction"
    "32-bit Preview Options..."
    "Zoom In"
    "Zoom Out"
    "Fit on Screen"
    "Fit Layers on Screen"
    "Fit Artboard on Screen"
    ["100%" "(zoom 100 | reset zoom | default zoom | zoom default)"]
    ["200%" "zoom 200"]
    "Print Size"
    "Actual Size"
    ["Flip Horizontal" "flip view horizontal"]
    "Pattern Preview"
    {"Screen Mode"
     ["Standard Screen Mode"
      "Full Screen Mode With Menu Bar"
      "Full Screen Mode"]}
    ["Extras" {:pre :toggle}]
    {:pre :toggle
     "Show"
     ["Layer Edges"
      "Selection Edges"
      "Target Path"
      "Grid"
      "Guides"
      "Canvas Guides"
      "Artboard Guides"
      "Artboard Names"
      "Count"
      "Smart Guides"
      "Slices"
      "Notes"
      "Pixel Grid"
      "Pattern Preview Tile Bounds"
      "3D Secondary View"
      "3D Ground Plane"
      "3D Lights"
      "3D Selection"
      "UV Overlay"
      "3D Mesh Bounding Box"
      "Mesh"
      "Edit Pins"
      "All"
      "None"
      "Show Extras Options..."]}
    ["Rulers" {:pre true}]
    ["Snap" {:pre true}]
    {:pre true
     "Snap To"
     ["Guides"
      "Grid"
      "Layers"
      "Slices"
      "Artboard Bounds"
      "All"
      "None"]}
    {"Guides"
     ["Edit Selected Guides"
      "Lock Guides"
      "Clear Guides"
      "Clear Selected Guides"
      "Clear Selected Artboard Guides"
      "Clear Canvas Guides"
      "New Guide..."
      "New Guide Layout.."
      "New Guides From Shape"]}
    "Lock Slices"
    "Clear Slices"
    "Customize Touch Bar..."]})

(def edit-menu 
  {"Edit"
   ["Undo"
    "Redo"
    ["Toggle Last State" "[(Toggle | swap)] Last [State]"]
    "Fade..."
    "Cut"
    "Copy"
    "Copy Merged"
    "Paste"
    {"Paste Special"
     [["Paste without Formatting" "Paste raw"]
      "Paste in Place"
      "Paste Into"
      "Paste Outside"]}
    "Clear"
    "Search"
    "Check Spelling..."
    ["Find and Replace Text..." "[Find and] Replace Text"]
    "Stroke..."
    ["Content-Aware Fill..." "Content Aware Fill"]
    "Generative Fill..."
    ["Content-Aware Scale" "Content Aware Scale"]
    "Puppet Warp"
    "Perspective Warp"
    ["Free Transform" "( transform | free transform)"]
    ["Free Transform Path" "[free] transform path"]
    {:pre "[transform]"
     "Transform"
     ["Again"
      "Scale"
      "Rotate"
      "Skew"
      "Distort"
      "Perspective"
      "Warp"
      ["Split Warp Horizontally" "Split Warp (Horizontally | horizontal)"]
      ["Split Warp Vertically" "Split Warp (Vertically | vertical)"]
      "Split Warp Crosswise"
      "Remove Warp Split"
      "Convert warp anchor point"
      "Toggle Guides"
      ["Rotate 180°" "Rotate one eighty"]
      ["Rotate 90° Clockwise" "Rotate Ninety"]
      ["Rotate 90° Counter Clockwise" "Rotate Ninety Counter"]
      ["Flip Horizontal" "(flip | the) horizontal"]
      "Flip Vertical"]}
    ["Auto-Align Layers..." "Auto Align Layers"]
    ["Auto-Blend Layers..." "Auto Blend Layers"]
    ["Sky Replacement..." "replace sky"]
    "Define Brush Preset..."
    "Define Pattern..."
    "Define Custom Shape..."
    {:pre true
     "Purge"
     ["Clipboard"
      "Histories"
      "All"
      "Video Cache"]}
    "Adobe PDF Presets..."
    {"Presets"
     ["Preset Manager..."
      "Migrate Presets"
      ["Export/Import Presets..." "(Export | Import) Presets"]]}
    ["Remote Connections..." "Remote Connection settings"]
    ["Color Settings..." {:pre "[edit]"}]
    "Convert to Profile..."
    ["Keyboard Shortcuts..." "[go] [edit] [keyboard] shortcuts"]
    ["Menus..." {:pre "edit"}]
    ["Toolbar..." {:pre "edit"}]
    "Start Dictation"]})

(def image-menu
  {"Image"
   [{:pre "color mode"
     "Mode"
     ["Bitmap"
      "Grayscale"
      "Duotone"
      ["Indexed Color..." "Indexed"]
      ["RGB Color" "(red green blue | rgb)"]
      ["CMYK Color" "(cmyk | cyan magenta)"]
      ["Lab Color" "lab"]
      "Multichannel"
      ["8 Bits/Channel" "eight bits"]
      ["16 Bits Channel" "sixteen bits"]
      ["32 Bits/Channel" "thirty two bits"]
      ["Color Table..." {:pre ""}]]}
    {:pre "[adjust]"
     "Adjustments"
     [["Brightness/Contrast..." "(Brightness | Contrast)"]
      "Levels..."
      "Curves..."
      "Exposure..."
      "Vibrance..."
      ["Hue Saturation..." "(Hue | Saturation)"]
      "Color Balance..."
      ["Black & White..." "Black and White"]
      "Photo Filter..."
      "Channel Mixer..."
      ["Color Lookup..." "(Lookup color | Color Lookup)"]
      "Invert"
      "Posterize..."
      "Threshold..."
      "Gradient Map..."
      "Selective Color..."
      ["Shadows Highlights..." "(Shadows |  Highlights)"]
      "HDR Toning..." "(HDR | High Def range)"
      "Desaturate"
      "Match Color..."
      "Replace Color.."
      ["Equalize" {:post "[color]"}]]}
    "Auto Tone"
    "Auto Contrast"
    "Auto Color"
    "Image Size..."
    "Canvas Size..."
    {"Image Rotation"
     [["180°" "rotate image (one eighty [degrees] | half)"]
      ["90° Clockwise" "rotate image ninety [degrees] [clockwise]"]
      ["90° Counter Clockwise" "rotate image ninety [degrees] counter [clockwise]"]
      ["Arbitrary..." " rotate image [ arbitrary]"]
      "Flip Canvas Horizontal"
      "Flip Canvas Vertical"]}
    "Crop"
    "Trim..."
    "Reveal All"
    "Duplicate..."
    "Apply Image.."
    "Calculations..."
    {"Variables"
     [["Define..." "define variables"]
      ["Data Sets.." " [variable] data sets"]]}
    "Apply Data Set..."
    "Trap..."
    {"Analysis"
     ["Set Measurement Scale"
      "Select Data Points"
      "Record Measurements"
      "Ruler Tool"
      "Count Tool"
      "Place Scale Marker..."]}]})

(def plugins-menu
  {"Plugins"
     ["Plugins Panel"
     "Browse Plugins..."
     "Manage Plugins.."
     {"ProStacker" ["ProStacker"]}]})

(def window-menu
  {"Window"
   [{"Arrange"
     [
      (->> 
        [["Tile All Vertically" 
          "Tile (all | windows) (Vertical | vert)"]
         ["Tile All Horizontally" 
          "Tile (all | windows) (Horizontal | horz)"]
         ["2-up Horizontal" "2 up (Horizontal | horz)"]
         ["2-up Vertical" "2 up (Vertical | vert)"]
         ["3-up Horizontal" "3 up (Horizontal | horz)"]
         ["3-up Vertical" "3 up (Vertical | vert)"]
         ["3-up Stacked" "3 up Stacked"]
         ["4-uр" "[windows] 4 uр"]
         "6-up"]
        (map 
          #(add-text-to-menu-item 
             % {:pre "[(windows | tabs)]"} )))
      
      ["Consolidate All to Tabs" "(consolidate | windows) to Tabs"]
      ["Cascade" "cascade windows"]
      ["Tile" "Tile windows"]
      "Float in Window"
      "Float All in Windows"
      "Match Zoom"
      "Match Location"
      "Match Rotation"
      "Match All"
                ;"New Window for catfish build 3.psb"
      "Minimize [window]"
      ["Bring All to Front" "windows to Front"]]}
    {:pre true
     "Workspace"
     ["ryan1"
      "rvan2"
      "Essentials (Default)"
      "3D"
      "Motion"
      "Painting"
      "Photography"
      "Graphic and Web"
          ;"Reset ryan2"
      "New Workspace..."
      "Delete Workspace..."
      "Keyboard Shortcuts & Menus..."
      "Lock Workspace"]}
    (map 
      (fn [menu-item] 
        (add-text-to-menu-item menu-item {:pre "bar"}))
      [#_"3D"
       "Actions"
       "Adjustments"
       "Beta Feedback"
       "Brush Settings"
       "Brushes"
       "Channels"
       "Character"
       ["Character Styles" "(character | char) (styles | style)"] 
       ["Clone Source" "(clone source | clone | cloning)"] 
       "Color"
       "Comments"
       "Content Credentials (Beta)"
       "Glyphs"
       ["Gradients" "(gradients | grads)"]
       "Histogram"
       "History"
       "Info"
       ["Layer Comps" "Layer (Comps | compositions)"]
       ["Layers" "(layer | layers)"]
       "Libraries"
       "Materials"
       "Measurement Log"
       "Navigator"
       "Notes"
       "Paragraph"
       "Paragraph Styles"
       "Paths"
       "Patterns"
       ["Properties" "(properties | props)"]
       "Shapes"
       "Styles"
       "Swatches"
       "Timeline"
       ["Tool Presets" "[tool] presets"]
       "Version History"
       "Application Frame"
       "Options"
       "Tools"
       "Contextual Task Bar"])]})

(def menu-commands
  [layer-menu
   type-menu
   filter-menu
   file-menu
   select-menu
   view-menu
   edit-menu
   image-menu
   plugins-menu
   window-menu])

(defn parse-talon-token [t]
  (cond
    (keyword? t)
    (case t
      :toggle 
      "(toggle | show | hide)")
    :else t))

(do 
  (defn reformat-menu-item [command-str]
    (-> command-str
      (string/split #"\|")
      (->>
        (map
          #(-> %
             (string/lower-case)
             (string/replace "-" "_")
             (string/replace "..." "")
             (string/replace ".." "")
             (string/replace "." "_")
             (string/replace "°" "")
             (string/replace "" "")
             (string/replace "(" "")
             (string/replace ")" "")
             (string/replace "[" "")
             (string/replace "]" "")
             (string/replace "/" "_")
             (string/replace "&" "and")
             (string/split #"\s")
             (->>
               (interpose "_")
               (apply str))))
        (interpose "_")
        (apply str))))
  (reformat-menu-item "Window why"))

(defn generate-command-strings
  [{:keys
    [original-item-name
     top-menu menu-name
     pre command-item-name post]
    :as ctx}]
  (let
    [normalized-item-name
     (-> command-item-name
       (string/replace "..." ""))

     pre (cond (= pre true)
           menu-name :else pre)

     command
     (->>
       [#_#_menu-name ">"
        pre normalized-item-name post]
       (interpose " ")
       (apply str)
       (string/trim))

     menu-string
     (str
       (when top-menu
         (str top-menu "|"))
       menu-name "|" original-item-name)
     
     action
     (str
       "user.menu_select(\"" menu-string "\")")

     python-fn-name
     (str "ps_" (reformat-menu-item menu-string))

     
     tab "    "
     new-line "\n"
     triple-quotes "\"\"\""

     python-fn
     (str tab "def " python-fn-name "():" new-line  
       tab tab triple-quotes 
       (string/replace python-fn-name "_" " ")
       triple-quotes new-line
       tab tab "actions." action)]
     
    {:talon-command 
     (str command ":" new-line 
       tab "user." python-fn-name "()" )
     :python-fn python-fn}))



(defn flatten-only-lists [coll]
  (mapcat 
    (fn [x]
      (if (list? x)
        x [x]))
    coll))

(do
  (defn process-menu
    [{:keys [pre post top-menu]
      :as menu}]
    (let [menu
          (-> menu
            (dissoc :post :pre)
            first)
          [menu-name menu-items] menu
          [pre post] (mapv parse-talon-token [pre post])
          process-menu-item
          (fn [menu-item]
            (cond
              (vector? menu-item)
              (let [[item-name override] menu-item]
                (cond
                  (map? override)
                  (let
                    [{:keys [pre post]} override
                     [pre post] 
                     (mapv parse-talon-token [pre post])]
                    (generate-command-strings
                      {:top-menu           top-menu
                       :menu-name          menu-name
                       :original-item-name item-name
                       :command-item-name  item-name
                       :pre                pre
                       :post               post }))
                  
                  (string? override)
                  (generate-command-strings 
                    {:top-menu           top-menu
                     :menu-name          menu-name
                     :original-item-name item-name
                     :command-item-name  override
                     :pre                pre
                     :post               post})))
              
              (string? menu-item)
              (generate-command-strings 
                {:top-menu           top-menu
                 :menu-name          menu-name
                 :original-item-name menu-item
                 :command-item-name  menu-item
                 :pre                pre
                 :post               post} )
              
              (map? menu-item)
              (process-menu 
                (assoc menu-item :top-menu menu-name))))]
      (->> menu-items
        ;; flatten lists of menu items
        (mapcat
          (fn [x]
            (if (= (type x) clojure.lang.LazySeq)
              x [x])))
        (mapv process-menu-item))))
        
        
        (process-menu window-menu))



(comment 
  (->>  
    (list 
          {:menu [1 2 3]}
          ["2" {:a nil
                :b nil}]
          (list "3" "4")
          ["5" "5.5"])
    flatten-only-lists))


 
(def nl "\n")

(defn strs->lines [& line-strs]
  (apply str (interpose (str nl nl) line-strs)))

(defn strs->lines-padded [& line-strs]
  (str (apply strs->lines line-strs) nl))

(comment
  [(strs->lines "hello" "world")
   (->> (strs->lines-padded "hello" "world")
     #_(println))]
  )

(def ps-beta-app-name
  "Adobe Photoshop (Beta)")
(def ps-app-name
  "Adobe Photoshop 2025")

(def talon-header
  (strs->lines-padded
    (str "app.name: " ps-beta-app-name)
    (str "app.name: " ps-app-name)
    "-"))

(comment 
  (spit (str "../hello.txt") "hello" ))

(comment 
  (fs/update-file))
;; ryan/photoshop/ps_menu_commands.clj


(def target-dir 
  (fs/path (fs/parent root-path) "photoshop"))

(def talon-file-name "menu_actions.talon") 
(def python-file-name "actions.py")

(defn target-file-path [file-name]
  (fs/path target-dir file-name))

(defn write-ps-talon-files! [talon-text python-text]
  (spit (str (target-file-path talon-file-name)) talon-text)
  (spit (str (target-file-path python-file-name)) python-text)
  (println "wrote ps menu commands talon files")
  )

(defn compose-text [header line-strings]
  (let [body
        (apply strs->lines-padded line-strings)]
    (str header body)))

(def command-data
  (->> menu-commands
     (map process-menu)
     (flatten)))

(let 
  [talon-text
   (compose-text talon-header 
     (mapv :talon-command command-data))

   python-text
   (compose-text 
     "import os\n\nfrom talon import Module, actions\n\nmod = Module()\n\n@mod.action_class\n\n\nclass Actions:\n"
     (mapv :python-fn command-data))
   ]
  #_(println talon-text)
  #_(println python-text)
  #_(write-ps-talon-files! talon-text python-text))


;; How many commands !?
(comment
  (->> menu-commands
    (map process-menu)
    #_(repeat 5)
    flatten
    count)
  )
