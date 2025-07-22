#!/usr/bin/env bb
(ns rebelle-io
  (:require
   [babashka.http-client :as http]
   [babashka.http-client.websocket :as ws]
   [clojure.java.io :as io]
   [cheshire.core :as json]))




(do
  (def test-event
    (->>
      (slurp "test_event.json")
      (json/parse-string)
      #_(json/encode)))
  test-event)

;; Atoms to track received messages and logs for REPL visibility
(def received-messages (atom []))
(def log-messages (atom []))

(defn log-and-print [msg]
  (println msg)
  (swap! log-messages conj msg)
  msg)

(defn show-logs
  "Show all logged messages from WebSocket handlers"
  []
  (doseq [[i msg] (map-indexed vector @log-messages)]
    (println (str (inc i) ". " msg)))
  (count @log-messages))

(defn clear-logs
  "Clear all logged messages"
  []
  (reset! log-messages [])
  (reset! received-messages [])
  "Logs cleared")

(comment 
  (show-logs)
  (clear-logs))

(defn handle-message [_ws data _last]
  (let [msg-str (str data)]
    (log-and-print (str "📨 Received message: " msg-str))
    (swap! received-messages conj msg-str)
    (try
      (log-and-print (str "Parsed JSON message: " (json/parse-string msg-str)))
      (catch Exception _e
        (log-and-print (str "📄 error str: " msg-str))
        (log-and-print (str "Error: " _e))))))

(defn handle-error [ws err]
  (log-and-print (str "❌ WebSocket error: " err)))

(defn handle-close [ws status reason]
  (log-and-print (str "🔒 WebSocket closed with status: " status " reason: " reason)))

(defn handle-ping [ws data]
  (println "🏓 Received ping, sending pong..."))

(defn handle-pong [ws data]
  (println "🏓 Received pong"))

(defn handle-open [ws]
  (log-and-print "🔄 WebSocket connection sucessfull, waiting for stability!"))

;; :on-open - [ws], called when a WebSocket has been connected.
;; :on-message - [ws data last] A textual/binary data has been received.
;; :on-ping - [ws data] A Ping message has been received.
;; :on-pong - [ws data] A Pong message has been received.
;; :on-close - [ws status reason] Receives a Close message indicating the WebSocket's input has been closed.
;; :on-error - [ws err] An error has occurred.
(def callbacks
  {:on-open handle-open 
   :on-message handle-message
   :on-pong handle-pong
   :on-ping handle-ping
   :on-error handle-error
   :on-close handle-close})

(def connection-config
  "primary options for ws/websocket:
    :uri - the uri to request (required). May be a string or map of :scheme (required), :host (required), :port, :path and :query
    :headers - a map of headers for the initial handshake`
    :client - a client as produced by client. If not provided a default client will be used.
    :connect-timeout Sets a timeout for establishing a WebSocket connection (in millis).
    :subprotocols - sets a request for the given subprotocols.
    :async - return CompleteableFuture of websocket"
  {:uri "ws://172.20.10.7:8265"
   :headers {"Origin" "http://172.20.10.7:8265"}
   :connect-timeout 20000
   :async false})

;; Start java.net.http.Websocket client and connect to the WebSocket server
;; type: jdk.internal.net.http.websocket.WebSocketImpl
(println "starting client")
(def ws-client
  (try 
    (ws/websocket 
      (merge 
        callbacks
        connection-config))
    (catch Exception e
      (log-and-print (str "❌ WebSocket connection failed: " e)))))



;; send an event json to Rebelle
(comment 
  
 (ws/send! ws-client "{\"type\":\"ping\"}")

  (println "Sending rebelle event...")
  (let [result (ws/send! ws-client test-event)]
    (println "  ✅ Rebelle event sent, result:" result)))

;; (println "📝 All test messages sent! Waiting for responses...")

;; To keep the connection alive for a short period to observe messages
#_(Thread/sleep 4000)

;; ;; Show summary of received messages
;; (println "\n📊 Summary of received messages:")
;; (println "Total messages received:" (count @received-messages))
;; (doseq [[i msg] (map-indexed vector @received-messages)]
;;   (println (str "  " (inc i) ". ") (if (> (count msg) 100) 
;;                                       (str (subs msg 0 100) "...")
;;                                       msg)))

(Thread/sleep 4000)
(show-logs)

;; ;; Close the connection when done
#_(ws/close! ws-client)
