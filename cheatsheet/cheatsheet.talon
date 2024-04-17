generate (talon | talent) cheatsheet markdown: user.cheatsheet()

create (talon | talent) cheatsheet webpage:
    user.system_command_nb("cd '/Users/ryan/.talon/user/cheatsheet'; pandoc -s cheatsheet.md -c cheatsheet.css -f markdown -t html -o cheatsheet.html ")
  


