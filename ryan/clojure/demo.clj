(ns demo
  (:require [clojure.string :as string]))

(defn foo [a b]
  (let [c (inc a)]
    (+ c b)))
