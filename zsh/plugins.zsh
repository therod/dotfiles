# rbenv
export PATH="$PATH:$HOME/.rbenv/bin"

if which rbenv &>/dev/null 2>&1; then
  eval "$(rbenv init --no-rehash -)"
  (rbenv rehash &) 2> /dev/null
fi

# FZF Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set ignore
export FZF_DEFAULT_COMMAND='ag --hidden --ignore /tmp/ --ignore /.bundle/ --ignore /.git/ -g ""'

# Base 16 colors
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
