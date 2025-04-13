(ns cursorless-snippets
  (:require [cheshire.core :as json]
            [clojure.string :as string]
            [clojure.set :as set]
            [camel-snake-kebab.core :as csk]
            [separator.io :as s]
            [babashka.fs :as fs]
            [snitch.core :refer [defn* defmethod* *fn *let]]
            )
  (:use [selmer.parser :as selmer]))


(def snippets-path "../../community/core/snippets/snippets/")

(def csv-header-str->kw
  {"Spoken form" :spoken
   "Cursorless identifier" :id})

;; read and parse bindings csv
(comment
  (->
    (slurp "../cursorless-settings/experimental/wrapper_snippets.csv")
    (s/read-records)
    (->>
      (map
        #(->> %
           vals
           (mapv string/trim)))
      (filter #(not= % [""]))
      (mapv
        (fn [[spoken snippet-id]]
          (let [[snippet-name substitution-var]
                (string/split snippet-id #"\.")]
            {:spoken spoken
             :snippet snippet-name
             :var substitution-var})))))
  )

(defn snippet-bindings-csv [snippet-type snippets]
  (->> snippets
    (mapv 
      (fn [{snippet-types :type
            snippet-name :name
            :keys [spoken var ] 
            :as snippet}]
        (let [var (when 
                    (not= snippet-type :insert)
                    (str "." var))]
          (str spoken ", " snippet-name var "\n"))))
    (concat ["Spoken form, Cursorless identifier\n"])
    (apply str)
))


(defn snippet-config-text
  [{:keys [description scope template name spoken]
    :or 
    {scope "clojure"
     description "Clj snippet"}
    :as snippet}]
  (-> snippet
    (merge 
      {:scope scope
       :description description})
    (->>
      (render 
        "name: {{name}}
description: {{description}}
phrase: {{spoken}}

${{var}}.wrapperPhrase: {{spoken}}
---

language: {{scope}}

${{var}}.insertionFormatter: NOOP
-
{{template|safe}}
---
"))))

(comment
  (->
    (snippet-config-text 
      (nth clj-snippets 0 ))
    (println)))

(def starter-wrapper-name-bindings
  [{:spoken  "else"
    :name "ifElseStatement"
    :var     "alternative"
    :type
    #{:wrap}}
   {:spoken  "if"
    :name "ifStatement"
    :var     "consequence"
    :type
    #{:wrap :insert}}
   {:spoken  "if else"
    :name "ifElseStatement"
    :var     "consequence"
    :type #{:wrap :insert}}
   {:spoken  "link"
    :name "link"
    :var     "text"
    :type
    #{:wrap :insert+phrase}}
   {:spoken  "try"
    :name "tryCatchStatement"
    :var     "body"
    :type
    #{:wrap :insert}}
   #_{:spoken  "funk"
      :name "newFn"
      :var     "fnName"}
   {:spoken  "general funk"
    :name "functionDeclaration"
    :var     "body"
    :type
    #{:wrap :insert+phrase}}
   #_{:spoken  "comment"
      :name "comment-form"
      :var     "form"}])

(def clj-snippets 
  [{:description "clj comment fn"
    :template "(comment \n\t$form)"
    :name "comment-form"
    :spoken  "comment form"
    :var  "form"
    :type
    #{:wrap :insert+phrase :insert}}

   {:spoken  "def funk"
    :name "newFn"
    :var "fnName"
    :template "(defn $fnName [$params]\n  $body)"
    :type
    #{:wrap :insert+phrase :insert}}
   
   {:spoken  "funk"
    :name "use fn"
    :var "fnName"
    :template "($fnName $body)"
    :type
    #{:wrap :insert+phrase :insert}}

   {:spoken  "lambda funk"
    :var "fnBody"
    :template "(fn [$params]\n\t$fnBody)"
    :type
    #{:wrap :insert+phrase}}

   {:spoken  "hash funk threaded"
    :var "fnBody"
    :template "(#($fnBody $1 % $2))"
    :type
    #{:wrap :insert+phrase :insert}}

   {:spoken  "hash thread first"
    :var "fnBody"
    :template "#(-> % \n$fnBody)"
    :type
    #{:wrap :insert+phrase :insert}}
   
   {:spoken  "hash thread last"
    :var "fnBody"
    :template "#(->> % \n$fnBody)"
    :type
    #{:wrap :insert+phrase}}

   {:spoken  "hash"
    :var "fnBody"
    :template "#$fnBody"
    :type
    #{:wrap :insert}}

   {:spoken  "hash funk"
    :var "fnName"
    :template "#($fnName $1 % $2)"
    :type
    #{:wrap :insert+phrase}}
   
   {:spoken  "comment"
    :var "form"
    :template "#_$form"
    :type
    #{:wrap}} 
   
   {:spoken  "thread first"
    :var "form"
    :template "(-> $form$1)"
    :type
    #{:wrap  :insert :insert+phrase}} 
   
   {:spoken  "thread last"
    :var "form"
    :template "(->> $form$1)"
    :type
    #{:wrap  :insert :insert+phrase}} 
   
   {:spoken  "set"
    :var "form"
    :template "#{$form}"
    :type
    #{:wrap  :insert :insert+phrase}} 
   
   {:spoken  "debug"
    :var "form"
    :template "(dbg $form)"
    :type
    #{:wrap :insert :insert+phrase}} 
   
   {:spoken  "debug nest"
    :var "form"
    :template "(dbgn $form)"
    :type
    #{:wrap :insert :insert+phrase}}
   
   {:spoken  "map destructure"
    :var "mapName"
    :template "{:keys [$1] :as $mapName$2}"
    :type
    #{:wrap :insert :insert+phrase}} 
   
   {:spoken  "map destructure no keys"
    :var "mapName"
    :template "{$1 :as $mapName}"
    :type
    #{:wrap :insert :insert+phrase}}])

(defn normalize-snippet [{:keys [name spoken] :as snippet}]
  (-> snippet
    (cond->
      (and (nil? name)
        (string? spoken))
      (assoc :name
        (csk/->kebab-case-string spoken)))))


(def all-snippet-declarations
  (concat
    starter-wrapper-name-bindings
    (->> clj-snippets
      (mapv normalize-snippet))))

(defn delete-old-snippets! []
  (->>
    (fs/list-dir snippets-path)
    (filter #(not (fs/directory? %)))
    #_(mapv fs/delete))
  #_(println "Cleared snippets dir."))


(def cursorless-experimental-settings-path 
  "../../cursorless-settings/experimental/")

(defn write-snippet-bindings-csv-file [snippet-type]
  (->> all-snippet-declarations
    (filter
      (fn [{:keys [type] :as snippet}]
        (contains? type snippet-type)))
    (snippet-bindings-csv snippet-type)
    (spit 
      (str cursorless-experimental-settings-path
        (case snippet-type
          :wrap "wrapper_snippets"
          :insert "insertion_snippets"
          :insert+phrase "insertion_snippets_single_phrase")
        ".csv")))
  (println (str "Wrote " (name snippet-type) " Snippets Bindings cvs file!")))


(defn write-cursorless-snippet-file! 
  [{snippet-name :name :as snippet}]
  (let [file-path
        (str snippets-path snippet-name ".snippet")]
    (spit
      file-path
      (snippet-config-text snippet))
    (println (str "Wrote " snippet-name " snippet"))))

;;;; mutate state

#_(delete-old-snippets!)

#_(->> [:wrap :insert :insert+phrase]
  (mapv write-snippet-bindings-csv-file))

(def snippet*
  (normalize-snippet (first clj-snippets)))

(comment 
  (->> snippet*
    (write-cursorless-snippet-file!)))

;; write custom snippets files
(comment 
  (->> clj-snippets
    (map normalize-snippet)
    (mapv write-cursorless-snippet-file!)))
#_(println "Wrote Wrapper Snippet files")




