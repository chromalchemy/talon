(ns cursorless-snippets
  (:require [cheshire.core :as json]
            [clojure.string :as string]
            [clojure.set :as set]
            [camel-snake-kebab.core :as csk]
            [separator.io :as s]
            [babashka.fs :as fs]
            ))
(def snippets-path "../../cursorless-snippets/")

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

(defn snippet-name
  [{:keys [spoken name]}]
  (cond
    (some? name) name
    (string? spoken)
    (csk/->kebab-case-string spoken)
    :else "bad-name"))


(defn snippet-bindings-csv [snippet-type snippets]
  (->> snippets
    (mapv 
      (fn [{snippet-types :type 
            :keys [spoken var] 
            :as snippet}]
        (let [name (snippet-name snippet)
              var (when 
                    (not= snippet-type :insert)
                    (str "." var))]
          (str spoken ", " name var "\n"))))
    (concat ["Spoken form, Cursorless identifier\n"])
    (apply str)
))


;; json snippet -> edn
(comment
  (->
    (slurp "/Users/ryan/.talon/user/cursorless-snippets/functionDeclaration.cursorless-snippets")
    (json/parse-string  csk/->kebab-case-keyword)
    (->> 
      (spit "edn/functionDeclaration.edn")))
  )

(comment
  (-> new
    (json/generate-string
      {:pretty true
       :key-fn csk/->camelCaseString})
    (->>
      (spit "/Users/ryan/.talon/user/cursorless-snippets/functionDeclaration2.cursorless-snippets"))))


(def example-snippet-file
  {:function-declaration
   {:description "Function declaration",
    :variables {:body {:wrapper-scope-type "statement"}},
    :insertion-scope-types ["namedFunction" "statement" "line"]

    :definitions
    [{:scope {:lang-ids ["typescript" "typescriptreact" "javascript" "javascriptreact"]},
      :body ["function $name($parameterList) {" "\t$body" "}"],
      :variables {:name {:formatter "camelCase"}}}

     {:scope {:lang-ids ["typescript" "typescriptreact" "javascript" "javascriptreact"],
              :scope-types ["class"],
              :exclude-descendant-scope-types ["namedFunction"]},
      :body ["$name($parameterList) {" "\t$body" "}"],
      :variables {:name {:formatter "camelCase"}}}

     {:scope {:lang-ids ["go"]},
      :body ["func $name($parameterList) {" "\t$body" "}"],
      :variables {:name {:formatter "camelCase"}}}

     {:scope {:lang-ids ["python"]},
      :body ["def $name($parameterList):" "\t$body"],
      :variables {:name {:formatter "snakeCase"}}}

     {:scope {:lang-ids ["python"],
              :scope-types ["class"],
              :exclude-descendant-scope-types ["namedFunction"]},
      :body ["def $name(self${parameterList:, }):" "\t$body"],
      :variables {:name {:formatter "snakeCase"}}}]}})

(defn snippet-config
  [{:keys [description scope template name spoken]
    :or 
    {scope
     {:lang-ids ["clojure"]}
     description "Clj snippet"}
    :as snippet}]
  (let [name
        (snippet-name snippet)]
    {name
     {:definitions
      [{:scope scope
        :body [template]
        #_#_
            :variables {:name {:formatter "kebabCase"}}}]
      :description description
      #_#_
          :variables {:body {:wrapper-scope-type "statement"}}
      #_#_
          :insertion-scope-types ["namedFunction" "statement" "line"]
      }}))

(def clj-snippets 
  [{:description "clj comment fn"
    :template "(comment \n$form)"
    :name "comment-form"
    :spoken  "comment form"
    :var  "form"
    :type
    #{:wrap :insert+phrase}}

   {:spoken  "def funk"
    :name "newFn"
    :var "fnName"
    :template "(defn $fnName [$params]\n  $body)"
    :type
    #{:wrap :insert+phrase}}

   {:spoken  "anonymous funk"
    :var "fnBody"
    :template "(fn [$params]\n  $fnBody)"
    :type
    #{:wrap :insert+phrase}}

   {:spoken  "anonymous threaded hash funk"
    :var "fnBody"
    :template "(#$fnBody)"
    :type
    #{:wrap}}

   {:spoken  "anonymous thread first"
    :var "fnBody"
    :template "#(-> %  \n$fnBody)"
    :type
    #{:wrap :insert+phrase}}

   {:spoken  "hash"
    :var "fnBody"
    :template "#$fnBody"
    :type
    #{:wrap :insert}}

   {:spoken  "hash funk"
    :var "fnName"
    :template "#($fnName %)"
    :type
    #{:wrap :insert+phrase}}
   +
   {:spoken  "comment"
    :var "form"
    :template "#_$form"
    :type
    #{:wrap}}])


(comment
  "(defn $fnName [$params]\n  $CURRENT_SECONDS_UNIX $body)"
  )

(defn clear-snippets-dir! []
  (->>
    (fs/list-dir snippets-path)
    (filter #(not (fs/directory? %)))
    (mapv fs/delete))
  (println "Cleared snippets dir."))


(def all-snippet-declarations
  (concat
    starter-wrapper-name-bindings
    clj-snippets))

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
  [{:keys [name] :as snippet}]
  (let [name
        (if name name
          (ffirst snippet))]
    (-> snippet
      (json/encode
        {:pretty true
         :key-fn csk/->camelCaseString})
      (->>
        (spit
          (str
            snippets-path
            name
            ".cursorless-snippets"))))))

;;;; mutate state

(clear-snippets-dir!)

(->> [:wrap :insert :insert+phrase]
  (mapv write-snippet-bindings-csv-file))

;; write custom snippets files
(->> clj-snippets
  (map snippet-config)
  (mapv write-cursorless-snippet-file!))
(println "Wrote Wrapper Snippet files")




