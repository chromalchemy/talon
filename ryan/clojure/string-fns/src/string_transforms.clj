(ns string-transforms
  (:require [clojure.string :as string]))

(+ 1 1)

(defn stdin []
  (slurp *in*))

(defn run-on-stdin [f]
  (println
    (f (stdin))))

(def uppercase string/upper-case)

(defn uppercase! [x]
  (run-on-stdin uppercase))

(def url-w-params* "https://getbitoutdoors.com/slab-sniper-76/?showHidden=true&ctk=d59bf5f4-44ae-418b-acbb-6ce04dc8990d")

(comment 
  (uppercase "kdjfoefji"))

(defn remove-url-params [s]
  (-> s
    #_(string/replace "?" "")
    (string/split #"\?")
    (first)))

(defn remove-url-params! [x]
  (run-on-stdin remove-url-params))

(comment 
  (remove-url-params url-w-params*))

(def multiline-block-string
  "kdjfoie
  zxczxzxczx       
  xzcz
  dxcx
  (str/trim)c
  dfdfhefe
  
  
  
  
  ")

(defn trim-block [s]
  (str "hello")
  #_(string/trim s))

(trim-block "skdjfoei \n")