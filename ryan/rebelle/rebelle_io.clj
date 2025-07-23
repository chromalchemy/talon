#!/usr/bin/env bb
(ns rebelle-io
  (:require
   [babashka.process :as p]
   [clojure.java.io :as io]
   [cheshire.core :as json]))

(defn get-test-event
  "Reads and parses the test_event.json file."
  []
  (-> (slurp "test_event.json")
      (json/parse-string true)))

(defn send-rebelle-command
  "Sends a command to the Rebelle WebSocket server using websocat and babashka.process."
  [command-map]
  (let [command-json (str (json/encode command-map) "\n")]
    (try
      (let [process (p/process ["websocat" "ws://localhost:8265"]
                               {:in command-json :out :stream :err :stream})
            out (slurp (:out process))
            err (slurp (:err process))]
        (p/check process)
        (println "✅ Command sent successfully. Response:" out)
        (when-not (empty? err)
          (println "Stderr:" err)))
      (catch Exception e
        (println "❌ Error sending command:" (ex-message e))))))

(comment
  (send-rebelle-command (get-test-event)))
