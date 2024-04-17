(ns cheatsheet.cheatsheet
  (:require [clojure.string :as string]
            [garden.selectors :as gs]
            [reaver :refer [parse extract-from text attr]]
            [hickory.core :as h]
            [hickory.select :as s]
            [clojure.walk :as walk]
            [instaparse.core :as insta]
            
            [clojure.zip :as zip])
  (:use [lambdaisland.ornament]
        [com.rpl.specter]
        [com.rpl.specter.zipper]))

(def generated-cheatsheet-html-file
  (slurp "cheatsheet.html"))

(def talon-command
  "( hello [world] | here) world |  really nothing that [{user.my.fn} nonce bet (fiasco | charles)] | my third thing")
  
(defn parse-talon [s]
  ((insta/parser
     "command = elems | separated 
    multi = <'('> separated <')'> 
    <separated> = elems (<separator> elems)*
    optional = <'['> elems <']'> 
    elems = elem-phrase 
          | <whitespace> elem-phrase
          | <whitespace> elem-phrase <whitespace>
          | elem-phrase <whitespace>
    <elem-phrase> = elem (<whitespace> elem)*
    <elem> = token | optional | multi
    <token> = word | number | fn | capture 
    fn = <'<'> (word | dotted-word) <'>'>
    capture = <'{'> (word | dotted-word) <'}'>
    <dotted-word> = word (<dot> word)*
    dot = #'\\.'
    <word> = #'[a-zA-Z]+'
    <number> = #'[0-9]+'
    <whitespace> = #'\\s+'
    <separator> = ' | '"
    ;;  :output-format :enlive   
     )
     s))

(defn h=? [k x]
  (and
    (vector? x)
    (= (first x)
      k)))

(defn path-str [[left-brack right-brack] x]
  (->> x
    (interpose ".")
    (apply str)
    (#(string/replace % "user." ""))
    (#(str left-brack % right-brack))))

(defn only-of-type? [type-pred x]
  (and
    (= (count x) 1)
    (type-pred
      (first x))))

(defn normalize-command [command]
  (->> command
    (walk/postwalk
      (fn [x]
        (let [r
              (when (vector? x)
                (rest x))]
          (cond
            (string? x) x
  
            (h=? :fn x)
            (path-str
              ["<" ">"]
              r)
  
            (h=? :capture x)
            (path-str
              ["{" "}"]
              r)
  
            (h=? :elems x)
            (cond
              (only-of-type? string? r)
              (first r)
              :else
              (vec r))
  
            (h=? :optional x)
            (cond
              (only-of-type? vector? r)
              (into '() (first r))
              :else
              (into '() r))
  
            (or
              (h=? :multi x)
              (h=? :command x))
            (into #{} r)
            :else
            x))))))

(comment 
  (let 
    [original talon-command
     parsed (parse-talon original)
     normalized (normalize-command parsed)
     x (println original)
     x (println " ")
    ;;  y (println normalized)
     ]
    (->> normalized 
      (map 
        (fn [subcommand]
          (let [a (atom [])]
            (println with it)
            (println (walk/prewalk-demo subcommand)))))))

)

;; failed normalization code
(comment 
  (select
    [VECTOR-ZIP
     (find-first
       #(= % :multi))
     UP NODE]
  
    #_(recursive-path [] p
        (if-path
          [vector? FIRST (pred= :multi)]
          STAY
          [(view rest) p])
  
        #_[(cond-path
             [map? :tag (pred= :multi)]
             STAY
             #_(stay-then-continue :content p)
             [:content]
             [:content ALL p])
           #_(view type)])
    #_identity
    #_(fn [multi]
        (->> multi
          #_:content
          #_(into #{})))))



(-> generated-cheatsheet-html-file
  (h/parse)
  (h/as-hickory)
  (->> 
    (s/select
      (s/or
        (s/tag :h1)
        (s/tag :ul)))
    (drop 9)
    (partition 2)
    first
    last
    (s/select
      (s/tag :strong))
    (map
      (fn [e]
        (let 
          [first-content (:content e )
           command-str
           (cond
             (string? first-content) first-content
             (vector? first-content)
             (->> first-content
               (select [ALL
                        (recursive-path [] p
                          (cond-path
                            map?
                            [:content p]
                            vector?
                            [ALL
                             (if-path
                               map?
                               [:content p]
                               STAY)]
                            string?
                            STAY))])
               (apply str)
               #_(interpose " ")))
           ]
           (string/replace command-str "\n" " "))))
    (map 
      (fn [s]
        (let [test-cmd 
              "[toggle] clippy [(show | [now] (hide | real) | toggle)]"
              bracket-match #"\[(.*?)\]"
              paren-match #"\(([^\)]+)\)"
              myparse
              (insta/parser
                "word = #'[a-zA-Z]+'")]
          [test-cmd
           "------------------------------------------------------------------------"
           (-> test-cmd 
             myparse
             #_(string/split bracket-match )
             #_(->> 
               #_(re-find paren-match)
               (setval (regex-nav paren-match) "!!!")
               (#(string/split % #"!!!"))
               (interpose 
                 (->> test-cmd
                   (re-find paren-match)
                   last
                   (#(string/split % #"\|"))
                   (map string/trim)
                   (into #{})))
               #_(transform []))
             #_(->> 
               (setval [ALL (pred= "")] NONE)
               (transform [FIRST]
                 #(vector %)))
              
             #_(->>
                 (map
                   (fn [e]
                     (cond
                       (string/starts-with? e "[")
                       (->> e
                         (drop-last)
                         (drop 1)
                         (apply str))))))
             )])))
    first
    ))


;; ___________________________________ .

(def dev-file-names
  ["cursorless"
   "cursorless global"
   "cursorless snippets"
   "gb"
   "general"
   "chrome"
   "apple terminal"
   "finder"
   "vscode"
   "edit"
   "edit settings"
   "file extension"
   "keys"
   "text"
   "edit vocabulary"
   "websites and search engines"
   "css"
   "comment block"
   "comment documentation"
   "comment line"
   "functions"
   "functions common"
   "functions common gui active"
   "imperative"
   "keywords"
   "libraries"
   "library gui open"
   "data bool"
   "data null"
   "operators lambda"
   "operators array"
   "operators assignment"
   "cancel"
   "draft editor"
   "draft editor open"
   "mac macro"
   "dropdown"
   #_"text navigation"
   "browser"
   "file manager"
   "find and replace"
   "line commands"
   "snippets"
   "snippets open"
   "splits"
   "terminal"
   "unix utilities"
   "gaze ocr"
   "gaze ocr disambiguation"
   "menu"
   #_"notification"
   "vscode"
   "debugger"
   "symbols"
   "repeater"
   #_"github web"
   "gdb active"
   "gdb global"
   "dictation mode"
   "markdown"
   "object oriented"
   "operators bitwise"
   "operators math"
   "operators pointer"
   "command history"
   "datetimeinsert"
   "desktops"])
   
(def file-names
  ["user.letter"
   "user.number_key"
   "user.modifier_key"
   "user.special_key"
   "user.symbol_key"
   "user.arrow_key"
   "user.punctuation"
   "user.function_key"
   "formatters"
   "intellij"
   "1password"
   "1password global"
   "amethyst"
   "anaconda"
   "apple notes"
   "discord"
   "dunst"
   "eclipse"
   "mac emacs"
   "firefox"
   "git"
   "git add patch"
   "gitlab"
   "i3wm"
   "jetbrains"
   "linux keepassx linux"
   "kubectl"
   "orion"
   "outlook web"
   "win outlook win"
   "protonmail"
   "mac rstudio mac"
   "linux signal linux"
   "mac slack mac"
   "win slack win"
   "talon repl"
   "linux taskwarrior linux"
   "teams"
   "mac teams mac"
   "termite"
   "terraform"
   "thunderbird"
   "thunderbird calendar"
   "thunderbird composer"
   "thunderbird contacts"
   "thunderbird inbox"
   "thunderbird tasks"
   "tmux"
   "linux tmux linux"
   "vivaldi"
   "win windbg"
   "win windows explorer"
   "win windows terminal"
   "wsl"
   "abbreviate"
   "help"
   "help open"
   "help scope open"
   "homophones"
   "homophones open"
   "dragon mode"
   "language modes"
   "modes"
   "sleep mode wav2letter"
   "wake and sleep"
   "wake and sleep wav2letter"
   "mouse grid"
   "mouse grid always"
   "mouse grid open"
   "numbers"
   "screens"
   "win tabs"
   "win window management"
   "batch"
   "c"
   "go"
   "java"
   "javascript"
   "lua"
   "stylua"
   "php"
   "proto"
   "python"
   "r"
   "ruby"
   "rust"
   "scala"
   "sql"
   "talon"
   "terraform"
   "vimscript"
   "media"
   "microphone selection"
   "mouse"
   "mouse cursor"
   "screenshot"
   "win draft global"
   "win draft window"
   "win draft window open"
   "talon helpers"
   "chapters"
   "emoji"
   "messaging"
   "multiple cursors"
   "pages"
   "photoshop"
   "ps-menus"
   "rango"
   "rango direct clicking"
   "roam"
   "win window action"
   "win window doc"
   "hud content focus"
   "hud content toolkit"
   "hud content walkthrough"
   "hud choice commands"
   "hud commands"
   "hud widget quick choices"
   "cheatsheet"])

(def class-names 
  (->> dev-file-names
    (mapv #(string/replace % " " "-"))))

(def show-rules
  (->> class-names
    (mapv
      (fn [class-str]
        (let [id-selector (keyword (str "#" class-str))]
          [[id-selector :block]
           [(gs/+ id-selector :ul)  :block]])))
    (apply concat)
    vec))

(defstyled dev-cheatsheet :body
  [:ul :hidden]
  [:h1 :hidden]
  [:blockquote :hidden]
  show-rules)

(def my-hiccup
  [dev-cheatsheet])

(spit "dev-cheatsheet.css"
  (defined-styles))

(defined-styles)