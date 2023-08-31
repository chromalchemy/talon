(ns snippets
  (:require [cheshire.core :as json]
            [clojure.string :as string]
            [camel-snake-kebab.core :as csk]))

(->

  (slurp "/Users/ryan/.talon/user/cursorless-snippets/functionDeclaration.cursorless-snippets")

  (json/parse-string  csk/->kebab-case-keyword)
  (->> 
    (spit "edn/functionDeclaration.edn")))


(def original
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

(def new
  {:function-declaration
   {:description "Function declaration",
    :variables {:body {:wrapper-scope-type "statement"}},
    :insertion-scope-types ["namedFunction" "statement" "line"]

    :definitions
    [{:scope {:lang-ids ["clojure" "clojurescript"],
              #_#_ :scope-types ["class"],
              #_#_ :exclude-descendant-scope-types ["namedFunction"]},
      :body ["($name $parameterList " "\n\t$body" ")"],
      :variables {:name {:formatter "kebabCase"}}}

     ]}})


(comment
  (-> new 
    (json/generate-string 
      {:pretty true
       :key-fn csk/->camelCaseString})
    (->>
      (spit "functionDeclaration.cursorless-snippets")))
  )
