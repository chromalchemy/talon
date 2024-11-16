(ns uppercase 
  (:require [clojure.string :as string]
            #_[babashka.process :as p]))

(defn uppercase-string [s]
  (string/upper-case s))

(comment 
  (uppercase-string "hello"))

(println
  (uppercase-string (slurp *in*)))