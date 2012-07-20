# edit this file
alias ealias='vim $ZSH/zsh/aliases.zsh'

# edit dotfiles
alias edot='vim $ZSH'
alias dotcd='cd $ZSH'

# edit vim stuff
alias evimrc='vim $ZSH/vim/vimrc.symlink'

# editors
alias m='vim'
alias vi='vim'

# Task Lists
alias planning='tmuxinator planning'
alias todo='vim ~/DropBox/Notes/Taskpaper/todo.taskpaper'
alias books='vim ~/DropBox/Notes/Taskpaper/books.taskpaper'
alias learning='vim ~/DropBox/Notes/Taskpaper/learning.taskpaper'
alias future='vim ~/DropBox/Notes/Taskpaper/future.taskpaper'
alias movies='vim ~/DropBox/Notes/Taskpaper/movies.taskpaper'
alias anime='vim ~/DropBox/Notes/Taskpaper/anime.taskpaper'
alias habits='vim ~/DropBox/Notes/Taskpaper/habits.taskpaper'
alias projects='vim ~/DropBox/Notes/Taskpaper/projects.taskpaper'
alias screencasts='vim ~/DropBox/Notes/Taskpaper/screencasts.taskpaper'
alias blog='vim ~/DropBox/Notes/Taskpaper/blog.taskpaper'

#ack madness!
alias aack="ack --all"
alias rack="ack --ruby --follow"
alias jack="ack --js"
alias pack="ack --python"
alias l="ls -lah"

#grep zsh history
alias hi="history 1 | grep $*"

# default ctags alias
alias ctags="ctags -R --exclude=.git --exclude=log *"

alias reload!='. ~/.zshrc'

