(ns snitch-demo
  (:require [clojure.string :as string]))

(defn foo [a b]
  (let [c (inc a)]
    (+ c b)
    nil))

(comment 
  ;; calling foo with random integers
  (foo (rand-int 100) (rand-int 100)) ; nil

  ;; we can evaluate the value of a and b
  a 
  b 

  ;; we can get the return value of foo by appending a < to foo
  
  foo<

  foo>
  ;; foo1> returns a list that can be evaluated
  ;; snitch is smart that way and only constructs the arguments absolutely necessary
;; for the function call.
  
  this<
  ;; will consider the name of the lambda function as this if not provided. for (fn)

  
  
  
)