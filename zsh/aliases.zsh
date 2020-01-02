alias zsh_benchmark='for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done'
alias zsh_debug='zsh -i -c -x exit'
alias reload!='. ~/.zshrc'

# edit this file
alias ealias='vim ~/.dotfiles/zsh/aliases.zsh'

# edit dotfiles
alias edot='vim ~/.dotfiles'
alias dotcd='cd ~/.dotfiles'

# edit vim stuff
alias vim='nvim'
alias evimrc='vim ~/.dotfiles/nvim/init.vim'
alias skhvim='vim ~/.skhdrc'

alias l="ls -lah"

# Push and pop it
alias d='dirs'
alias p='pushd'
alias o='popd'

#grep zsh history
alias hi="history 1 | grep $*"

# default ctags alias
alias ctags="ctags -R --exclude=.git --exclude=log *"

# top
alias ttop="top -F -R -o cpu -s 2"

# Postgres
alias pg-up='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-down='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Ruby
alias r='rbenv local'
alias b='bundle exec'

# Rails
alias rs='bundle exec bin/rails server'
alias rc='bundle exec bin/rails console'
alias rdm='bundle exec bin/rails db:migrate'
alias wds='bundle exec bin/webpack-dev-server'

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

# Pipe my public key to my clipboard. Fuck you, pay me.
alias pubkey="more ~/.ssh/id_rsa.pub| pbcopy | echo '=> Public key copied to pasteboard.'"

# Commands
oa() { ls -d /Applications/* | awk -v q="'" '{print q $0 q}' | fzf | xargs open -a ;}
to() { ls -d $HOME/Torrents/*/* | awk -v q="'" '{print q $0 q}' | fzf | xargs open ;}
zk() { cd $ZETTELKASTEN && nvim -c ":NV" }
