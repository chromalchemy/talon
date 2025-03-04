(ns paredit
  (:require [cheshire.core :as json]
            [clojure.string :as string]
            [clojure.set :as set]
            [camel-snake-kebab.core :as csk]
            [separator.io :as s]
            [babashka.fs :as fs]
            ))

;; read and parse old bindings csv
(comment
  (->
    (slurp "actions_custom.csv")
    (s/read-records)
    (->>
      (map 
        #(set/rename-keys % 
           {" VSCode command" :fn 
            "Spoken form" :name } ))
      (filter 
        #(not= % {:name ""}))
      (map 
        #(update % :fn string/trim))
      vec
      ))
  )


(def commands 
  {:editing
   [{:fn   "paredit.splitSexp"
     :name "split"}
    {:fn   "paredit.joinSexp"
     :name "join expressions"}]
   :eval 
   [{:fn   "calva.evaluateTopLevelFormAsComment"
     :name "evaluate top comment"}
    {:fn   "calva.evaluateEnclosingForm"
     :name "evaluate parent"}
    {:fn   "calva.evaluateSelectionAsComment"
     :name "evaluate comment"}
    {:fn   "calva.evaluateStartOfFileToCursor"
     :name "evaluate from file start to"}
    {:fn   "calva.evaluateToCursor"
     :name "evaluate from start to"}
    {:fn   "calva.evaluateTopLevelFormToCursor"
     :name "evaluate from top to"}]
   :deleting
   [
    {:name "force delete back"
     :fn   "paredit.forceDeleteBackward"}
    {:name "force delete forward"
     :fn   "paredit.forceDeleteForward"}
    {:name "delete back"
     :fn   "paredit.deleteBackward"}
    {:name "delete forward"
     :fn   "paredit.deleteForward"}
    {:name "(kill | chuck) [form] right"
     :fn   "paredit.killRight"}
    {:name "(kill | chuck) [form] left"
     :fn   "paredit.killLeft"}
    {:name "(kill | chuck) [form] forward"
     :fn   "paredit.killSexpForward"}
    {:name "(kill | chuck) [form] back"
     :fn   "paredit.killSexpBackward"}
    {:name "(kill | chuck) (list | collection | seq | seek | sequence) (forward | end | next)"
     :fn   "paredit.killListForward"}
    {:name "(kill | chuck) (list | collection | seq | seek | sequence) (back | start | last)"
     :fn   "paredit.killListBackward"}
    {:name "splice | unwrap"
     :fn   "paredit.spliceSexp"} 
    {:name "(splice | unwrap) [and] kill back"
     :fn   "paredit.spliceSexpKillBackward"}
    {:name "(splice | unwrap) [and] kill forward"
     :fn   "paredit.spliceSexpKillForward"}
    {:name "raise form"
     :fn   "paredit.raiseSexp"} ]
   :moving
   [{:name "(indent | push) [(form | line)]"
     :fn   "calva-fmt.tabIndent"}
    {:name "(dedent | pull) [(form | line)]"
     :fn   "calva-fmt.tabDedent"}
    {:name "move [form] (up | back | left)"
     :fn   "paredit.dragSexprBackward"}
    {:name "move back down"
     :fn   "paredit.dragSexprBackwardDown"}
    {:name "move back up"
     :fn   "paredit.dragSexprBackwardUp"}
    {:name "move [form] (down | forward | right)"
     :fn   "paredit.dragSexprForward"}
    {:name "move forward up"
     :fn   "paredit.dragSexprForwardUp"}
    {:name "move forward down"
     :fn   "paredit.dragSexprForwardDown"}
    {:fn   "paredit.slurpSexpForward"
     :name "(slurp | slip) [(forward | for it)]"}
    {:fn   "paredit.slurpSexpBackward"
     :name "(slurp | slip) (backward | back)"}
    {:fn   "paredit.barfSexpBackward"
     :name "barf (backward | back)"}
    {:fn   "paredit.barfSexpForward"
     :name "barf [forward]"} 
    {:fn   "paredit.transpose"
     :name "(transpose | swap) (forms | expressions)"}
    {:fn   "paredit.convolute"
     :name "convolute"} ]
   :wrapping
   [{:fn   "paredit.wrapAroundQuote"
     :name "quad lisp wrap"}
    {:fn   "paredit.wrapAroundParens"
     :name "round lisp wrap"}
    {:fn   "paredit.wrapAroundSquare"
     :name "box lisp wrap"}
    {:fn   "paredit.wrapAroundCurly"
     :name "curly lisp wrap"}
    {:fn   "paredit.rewrapQuote"
     :name "quad lisp repack"}
    {:fn   "paredit.rewrapParens"
     :name "round lisp repack"}
    {:fn   "paredit.rewrapSquare"
     :name "box lisp repack"}
    {:fn   "paredit.rewrapCurly"
     :name "curly lisp repack"}
    {:fn   "paredit.rewrapSet"
     :name "set repack"} ]})

(def sample-command
  {:fn   "paredit.splitSexp"
   :name "split"})

(def empty-line "\n\n")

(defn separate-w-newlines-str [c]
  (->> c
    (interpose empty-line)
    (apply str)))

(def new-indented-line "\n\t")

(defn subcommands->str [& subcommands]
  (->> subcommands
    (interpose new-indented-line )
    (concat [new-indented-line])
    (apply str)))

(defn dub-quotes [s]
  (str "\"" s "\"")) 

(defn talon-fn [c v]
  (str c "(" (dub-quotes v) ")")) 

(defn talon-double-fn [c v1 v2]
  (str c "(" (dub-quotes v1) ", " v2 ")"))

(defn code-action [s]
  (talon-fn "user.vscode" s ))

(subcommands->str
  "hello"
  (code-action (:fn sample-command)))

(defn render-set-of-commands [{:keys [fn name]}]
  (let 
    [normal-command
     (str name " here:"
       new-indented-line
       (code-action fn))
     point-command
     (str name " point:" 
       (subcommands->str 
         "mouse_click(0)"
         (code-action fn)))
     cursorless-command
     (str name " <user.cursorless_target>:" 
       (subcommands->str
         (talon-double-fn "user.cursorless_ide_command" fn "cursorless_target") )) ]
    (->> [normal-command
         point-command
         cursorless-command]
      (separate-w-newlines-str)))
  )

#_(->> sample-command
  render-set-of-commands
  println)


(def file-header
  "app.name: Code\napp.name: Cursor\napp.name: Windsurf\ncode.language: clojure\n-\n")

(-> commands
  (dissoc :eval :wrapping)
  (->>
    (map 
      (fn [[category commands]]
        (str 
          "#------------------" category
          empty-line
          (->> commands
            (map render-set-of-commands)
            (separate-w-newlines-str))
          empty-line
          )))
    (apply str)
    (str file-header)
    (spit "calva/paredit/paredit-gen.talon")))
