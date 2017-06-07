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

# Postgres
alias pg-up='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-down='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Ruby
# switch the current shell to jruby
alias r='rbenv local'
alias b='bundle exec'

# Tmux
alias tlist="tmux list-sessions"
alias tmux="env TERM=xterm-256color tmux"
alias tkill="tmux kill-session -t $*"
alias tnew="tmux new-session -s $*"
alias tatt="tmux attach -t $*"

# git
alias git=hub

# redis
alias redis-up='redis-server /usr/local/etc/redis.conf > /dev/null &'
alias redis-down='killall redis-server'
