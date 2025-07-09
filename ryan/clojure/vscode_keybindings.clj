(ns vscode-keybindings
  (:require [clojure.string :as string]
            [cheshire.core :as json]))

(defn strip-comments
  "Remove comments from JSON string"
  [json-str]
  (string/replace json-str #"//.*" ""))

(defn read-json-file
  "Read JSON file from absolute path and parse it into Clojure data structures"
  [file-path]
  (-> file-path
      slurp
      strip-comments
      (json/parse-string true)))

(defn get-keybinding-by-command
  "Filter keybindings by command name"
  [keybindings command-name]
  (filter #(= command-name (:command %)) keybindings))

(defn get-keybinding-by-key
  "Filter keybindings by key combination"
  [keybindings key-combo]
  (filter #(= key-combo (:key %)) keybindings))

(defn transform-keybinding
  "Transform a keybinding from JSON format to a more idiomatic Clojure map"
  [keybinding]
  (let [base {:key (:key keybinding)
              :command (:command keybinding)
              :when (:when keybinding)}]
    (if (:args keybinding)
      (assoc base :args (:args keybinding))
      base)))

(defn transform-keybindings
  "Transform all keybindings to a more idiomatic format"
  [keybindings]
  (mapv transform-keybinding keybindings))

;; Main function to read the keybindings file
(defn read-keybindings-file [file-path]
  (-> file-path
      read-json-file
      transform-keybindings))

;; Example usage
(comment
  (def keybindings-file "/Users/ryan/.talon/user/ryan/cpt-keybindings.json")
  (def keybindings (read-keybindings-file keybindings-file))
  
  ;; Get bindings for a specific command
  (get-keybinding-by-command keybindings "editor.action.formatDocument")
  
  ;; Get bindings for a specific key
  (get-keybinding-by-key keybindings "cmd+/")
  
  ;; Count total keybindings
  (count keybindings))

;; Execute this to read the keybindings
(def keybindings (read-keybindings-file "/Users/ryan/.talon/user/ryan/clojure/vscode-keybindings-snapshot.json"))


(comment 
  (->> keybindings
    (filter 
      #(string/starts-with? (:command %) "cpt"))
    #_(map :command)
    (distinct)

       ))

;; calva power tools commands
(comment 
  ["cpt.showCommands" "cpt.clay.makeFile" "cpt.clay.makeFileQuarto" "cpt.clay.makeFileRevealJs" "cpt.clay.makeCurrentForm" "cpt.clay.makeCurrentFormQuarto" "cpt.clay.makeTopLevelForm" "cpt.clay.makeTopLevelFormQuarto" "cpt.clay.browse" "cpt.clay.watch" "cpt.deps.loadDependencies" "cpt.deps.loadSelectedDependencies" "cpt.deps.syncDeps" "cpt.snitch.loadSnitchDependency" "cpt.snitch.instrumentTopLevelForm" "cpt.snitch.instrumentCurrentForm" "cpt.snitch.getSnitchedDefnResults" "cpt.snitch.reconstructLastDefnCallToClipboard" "cpt.performance.loadDecompilerDependency" "cpt.performance.decompileTopLevelForm" "cpt.performance.decompileTopLevelFormWithUncheckedMath" "cpt.performance.decompileSelection" "cpt.performance.disassembleTopLevelForm" "cpt.performance.loadCriteriumDependency" "cpt.performance.quickBenchTopLevelForm" "cpt.performance.quickBenchCurrentForm" "cpt.performance.timeTopLevelForm" "cpt.performance.timeCurrentForm" "cpt.performance.loadProfilerDependency" "cpt.performance.profileTopLevelForm" "cpt.performance.profileCurrentForm" "cpt.performance.startProfilerUI" "cpt.dataspex.loadDataspexDependency" "cpt.dataspex.inspectTopLevelForm" "cpt.dataspex.inspectCurrentForm" "cpt.dataspex.openInspectorInEditorView" "cpt.dataspex.openInspectorPanelView" "cpt.dataspex.connectRemoteInspector" "cpt.dataspex.inspectRemote"])
