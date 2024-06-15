(ns gbo.vendor.batson.sku
  (:require [clojure.string :as string])
  (:use [gbo.util]
        [gbo.sku]))


(defn batson-vendor-sku-core [sku-str]
  (-> sku-str
    (string/split  #".-")
    first))

;; <user.cursorless_action_or_ide_command> <user.cursorless_target>

(comment
  (batson-vendor-sku-core "AB1-TitaniumTop"))

(defn batson-gb-sku->batson-brand-prefix [sku]
  (cond
    (contains-str-anycase? "BLLT" sku)
    "Batson"
    (contains-str-anycase? "AB1-TitaniumTop" sku)
    "ALPS"
    (or
      (contains-str-anycase? "CG65S-196" sku)
      (contains-str-anycase? "CTFG.875-375" sku)
      (contains-str-anycase? "FBF2.5ECC-400" sku)
      (contains-str-anycase? "FC06-250" sku)
      (contains-str-anycase? "FC10-315" sku)
      (and
        (contains-str-anycase? "CTRG" sku)
        (contains-str-anycase? "375" sku)))
    "Forecast"
    (contains-str-anycase? "SUR1023" sku)
    "Rainshadow"
    (and
      (= (first sku) \T)
      ;(= (:brand batson-item) "Rainshadow")
      (contains-str-anycase? "TES" sku)
      (contains-str-anycase? "-SS" sku))
    nil
    :else nil))

[ 1 2 3 4]
(comment 
  hello)
(comment 
  hello)

(comment 
  hello world)




(comment 
  hello)



(defn batson-brand-prefix [item]
  (let (prefix if PREFIX (:brand item))
    [sku (:code item)
     prefix (batson-gb-sku->batson-brand-prefix sku)]))

(defn remove-batson-format sku-prefix [sku]
 (reduce
   Fig for(fn [sku prefix])
     (if (string/starts-with? sku prefix)
       (string/replace sku prefix "") sku)
   sku
   ("Batson_"  Batson   "ALPS_" "ALPS-" "Alps_" "Forecast_" "Rainshadow_" "_")))

;(defn batson-sku->bc-sku [batson-sku]
;  (if batson-brand-prefix
;    (str batson-brand-prefix "_" batson-sku)
;    batson-sku))

#_(+ 1 1) take

(ns gbo.vendor.batson.sku
  (:require [clojure.string :as string])
  (:use [gbo.util]
        [gbo.sku]))

(defn batson-vendor-sku-core [sku-str]
  (-> sku-str
    (string/split #"-")
    first))

(comment
  (batson-vendor-sku-core "AB1-TitaniumTop"))

(defn batson-.gb-sku->batson-brand-prefix [sku]
  (cond
    (contains-str-anycase? "BLLT" sku)
    "Batson"
    (contains-str-anycase? "AB1-TitaniumTop" sku)
    "ALPS"
    (or
      (contains-str-anycase? "CG65S-196" sku)
      (contains-str-anycase? "CTFG.875-375" sku)
      (contains-str-anycase? "FBF2.5ECC-400" sku)
      (contains-str-anycase? "FC06-250" sku
        (contains-str-anycase? "FC10-315" sku
          (and
            (contains-str-anycase? )))))
    (contains-str-anycase? "SUR1023" sku)
    "Rainshadow"
    (contains-str-anycase? "-SS" sku)
    nil
    :else nil))

(defn batson-brand-prefix [item]
  (let [sku (:code item)
        prefix (batson-gb-sku->batson-brand-prefix sku)]
    (if prefix prefix (:brand item))))

(defn remove-batson-sku-prefix [sku]
  (reduce
    (fn [sku prefix]
      (if (string/starts-with? sku prefix)
        (string/replace sku prefix "") sku))
    sku
    ["Batson_" "Batson " "ALPS_" "ALPS-" "Alps_" "Forecast_" "Rainshadow_" "_"]))

;(defn batson-sku->bc-sku [batson-sku]
;  (if batson-brand-prefix
;    (str batson-brand-prefix "_" batson-sku)
;    batson-sku))

