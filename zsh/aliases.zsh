# Functions
to() { ls -d $HOME/Torrents/**/* | awk -v q="'" '{print q $0 q}' | fzf | xargs open ;}
journal() { cd $JOURNAL && nvim $(date '+%Y-%m-%d.md') -c ":Goyo | set linebreak"  }
essays() { cd $ESSAYS && nvim -c ":Files" }
accounting() { cd $WORK/accounting && nvim -c ":Files" }

refreshsystem() {
  nvim +PlugUpdate +qall
  brew update
  brew upgrade fzf neovim zsh tmux ripgrep git ctags fd curl
  brew cleanup --prune=1
}

tldr() { curl "cheat.sh/$@" }

alias zsh_benchmark='for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done'
alias zsh_debug='zsh -i -c -x exit'
alias reload!='. ~/.zshrc'

#core
alias cp='cp -iv'
alias grep='grep --color=auto'

# edit this file
alias ealias='vim ~/.dotfiles/zsh/aliases.zsh'

# edit dotfiles
alias edot='vim ~/.dotfiles'
alias dotcd='cd ~/.dotfiles'

# edit vim stuff
alias vim='nvim'
alias evimrc='vim ~/.dotfiles/nvim/init.lua'
alias skhvim='vim ~/.skhdrc'

# edit espanso config
alias eespanso='vim ~/Library/Application\ Support/espanso/match/base.yml'

alias l="ls -lah"

# default ctags alias
alias ctags="ctags -R --exclude=.git --exclude=log *"

# top
alias ttop="top -F -R -o cpu -s 2"

# Postgres
alias pg-up='brew services start postgresql@17'
alias pg-down='brew services stop postgresql@17'
alias pg-restart='brew services restart postgresql@17'

# Ruby
alias r='rbenv local'
alias b='bundle exec'

# Rails
alias rs='bundle exec bin/rails server'
alias rc='bundle exec bin/rails console'
alias rdm='bundle exec bin/rails db:migrate'
alias wds='bundle exec bin/webpack-dev-server'

# Tmux
alias tls="tmux list-sessions"
alias tmux="tmux -2"
alias tkill="tmux kill-session -t $*"
alias tnew="tmux new-session -s $*"
alias tatt="tmux attach -t $*"
alias ts="tmux switch-client -t $*"

# Zellij
alias z="zellij -l welcome"
alias znew="zellij"
alias zls="zellij list-sessions"
alias zkill="zellij kill-session $*"
alias zkillall="zellij kill-all-sessions"
alias znew="zellij -s $*"
alias zatt="zellij attach $*"
alias zedit='vim ~/.dotfiles/zellij/config.kdl'

# Alacritty
alias aedit='vim ~/.dotfiles/alacritty/alacritty.toml'

# git
alias git=hub

# redis
alias redis-up='redis-server /usr/local/etc/redis.conf > /dev/null &'
alias redis-down='killall redis-server'

# Pipe my public key to my clipboard
alias pubkey="more ~/.ssh/id_rsa.pub| pbcopy | echo '=> Public key copied to pasteboard.'"

# Various
alias ss="open -a ScreenSaverEngine.app"
alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'
#alias obs='open -a obs && sudo renice -20 $(grep obs)'

# Theme
alias day="sed -i -e 's/gruvbox_dark/gruvbox_light/g' ~/.config/alacritty/alacritty.toml"
alias night="sed -i -e 's/gruvbox_light/gruvbox_dark/g' ~/.config/alacritty/alacritty.toml"
