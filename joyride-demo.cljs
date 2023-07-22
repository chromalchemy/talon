(ns joyride-demo
  (:require ["vscode" :as vscode]
            [promesa.core :as p]
            ["fs" :as fs]))


(comment
  (fs/writeFileSync "/Users/ryan/.talon/user/.calva/output-window/output.calva-repl" "")
  (+ 1 2 3 4 5 6 7 8 6)


  
  (p/let 
   [dir (vscode/workspace.fs.readDirectory "file:///Users/")]
   (print dir)) 
  (vscode/workspace.fs.readDirectory "~/.talon/user/.calva/output-window/")
  (fs/update-file "~/.talon/user/.calva/output-window/output.calva-repl" "")
  (-> (vscode/window.showInformationMessage
       "Come on, Join the Joyride!"
       "Be a Joyrider")
      (p/then
       (fn [choice]
         (println "You choose to:" choice)))))
  
  
  
  
  
  
  
