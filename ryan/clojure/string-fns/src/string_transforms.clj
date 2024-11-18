(ns string-transforms
  (:require [clojure.string :as string]))

(defn stdin []
  (slurp *in*))

(defn uppercase [x]
  (println 
    (string/upper-case (stdin))))
