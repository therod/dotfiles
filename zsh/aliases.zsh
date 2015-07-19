# edit this file
alias ealias='vim $ZSH/zsh/aliases.zsh'

# edit dotfiles
alias edot='vim $ZSH'
alias dotcd='cd $ZSH'

# edit vim stuff
alias evimrc='vim $ZSH/vim/vimrc.symlink'
alias vim='mvim -v'

# editors
alias m='mvim -v'

# change vim background color
alias darkvim="echo 'set background=dark' > ~/.vim/plugin/background-color.vim"
alias lightvim="echo 'set background=light' > ~/.vim/plugin/background-color.vim"

#ack madness!
alias ack='ack --pager="less -FRSX"'
alias aack="ack --all"
alias rack="ack --ruby --follow"
alias jack="ack --js"
alias pack="ack --python"
alias l="ls -lah"

# Push and pop it
alias d='dirs'
alias p='pushd'
alias o='popd'

#grep zsh history
alias hi="history 1 | grep $*"

# default ctags alias
alias ctags="ctags -R --exclude=.git --exclude=log *"

alias reload!='. ~/.zshrc'

# Tmuxinator
alias tx="tmuxinator"

# top
alias ttop="top -F -R -o cpu -s 2"

# kill it, kill it with fire
alias fixairplay="sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`"
