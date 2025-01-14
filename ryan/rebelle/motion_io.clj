#!/usr/bin/env bb

(ns motion-io
  (:require [babashka.process :refer [process]]
            [clojure.java.io :as io]
            [cheshire.core :as json]
            [clojure.string :as string]
            ))


(defn write-json [filepath data]
  (with-open [writer (io/writer filepath)]
    (.write writer (json/generate-string data))))

;; Define paths
(def rebelle-bin-path "/Applications/Rebelle 7 Motion IO.app/Contents/MacOS/Rebelle 7 Motion IO")

(def brush-settings-map
  {:event-type "SET_BRUSH"
   :tool "WATERCOLOR"
   :preset "Gouache/Gouache Filbert"
   :size 40
   :water 55
   :opacity 10
   :paint-type "PAINT"
   :glaze-mode "OPAQUE"
   :color {:r 64 :g 127 :b 200}})

(def json-output-path "/Users/ryan/.talon/user/ryan/rebelle/output/output.json") ; JSON output file
(def output-folder-path "/Users/ryan/.talon/user/ryan/rebelle/output") ; Output folder for the images

;; Write the EDN data as JSON
(write-json json-output-path brush-settings-map)

;; Run Rebelle Motion IO
(defn run-motion-io [rebelle-path json-output-path output-folder-path]
  (let [command [rebelle-path
                 "-batch-json" json-output-path
                 "-batch-out-rgba" (str output-folder-path  "/myfile.png")]]
    (println "Running Rebelle 7 Motion IO with the following command:")
    (println (string/join " " command))
    (let [result 
          (process command 
            {:inherit true})]
      @result)))

;; Execute the Rebelle process
(+ 1 1)

(comment
  (run-motion-io rebelle-bin-path json-output-path output-folder-path)

  (try
    (run-motion-io rebelle-bin-path json-output-path output-folder-path)
    (println "Rebelle 7 Motion IO automation has finished.")
    (catch Exception e
      (println "Error running Rebelle 7 Motion IO:" (.getMessage e))))
  )