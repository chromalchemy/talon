(ns reverse-csv-vals
  (:require [clojure.string :as string]))

(->
  "ad, add
aline, align
arrange, a range
blue tack, blu tack
bullion, boolean
bullions, booleans
cereal, serial
checkbooks, checkbox
classname, class name
curse les, cursorless
de, the
dick, deck
dis, this
ed it, edit
egis, aegis
els, else
ess, yes
falls, false
fire fox, firefox
flatmap, flat map
I tracker, eye tracker
Isabel, Izabel
jabba, java
Jason, json
jess, yes
juicer, user
juicers, users
juicing, using
marino, merino
noll, null
organization, organisation
organizations, organisations
poll request, pull request
pool request, pull request
pours, parse
rapper, wrapper
read me, readme
ripple, repl
seen tax, syntax
sharm, charm
shat, chat
sin tax, syntax
sniped, snippet
snipped, snippet
soon tax, syntax
te shirt, tshirt
to day, today
too, to
up date, update
white space, whitespace
wicky, wiki
you sir, user
hinter, enter"
(string/split "\n" )
(->> 
  (map
    #(-> %
       (string/split #",")
       (->> 
         (mapv string/trim)
         ((fn [[a b]]
            (str b ", " a)))
       )))
  (interpose "\n")
  (apply str)
  (println)
  )

)

