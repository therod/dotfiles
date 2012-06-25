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

# Lists
alias books='vim ~/DropBox/Lists/Personal/books.md'
alias learning='vim ~/DropBox/Lists/Personal/learning.md'
alias future='vim ~/DropBox/Lists/Personal/future.md'
alias movies='vim ~/DropBox/Lists/Personal/movies.md'
alias anime='vim ~/DropBox/Lists/Personal/anime.md'
alias habits='vim ~/DropBox/Lists/Personal/habits.md'
alias projects='vim ~/DropBox/Lists/Personal/projects.md'

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

