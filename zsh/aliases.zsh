# edit this file
alias ealias='vim $ZSH/zsh/aliases.zsh'

# edit dotfiles
alias edot='vim $ZSH'
alias dotcd='cd $ZSH'

# edit vim stuff
alias vim='nvim'
alias evimrc='vim $ZSH/nvim/init.vim'

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

# top
alias ttop="top -F -R -o cpu -s 2"

# kill it, kill it with fire
alias fixairplay="sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`"

alias mutt='cd ~/Desktop && mutt'
alias ww='cd ~/vimwiki && vim ./index.wiki'

alias searchsploit='/opt/exploit-database/searchsploit'
alias beer='brew update && brew upgrade && brew cleanup'
