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

# change vim background color
alias darkvim="echo 'set background=dark' > ~/.vim/plugin/background-color.vim"
alias lightvim="echo 'set background=light' > ~/.vim/plugin/background-color.vim"

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

# Tmuxinator
alias t="tmuxinator"

# Search engine:
alias s="sr google -l $*"
