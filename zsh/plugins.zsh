# rbenv
export PATH="$PATH:$HOME/.rbenv/bin"

__rbenv_started=0

__rbenv_init() {
  test $__rbenv_started = 0 && {
    eval "$(command rbenv init -)"
    __rbenv_started=1
  }
}

rbenv() {
  __rbenv_init
  command rbenv "$@"
}

ruby() {
  __rbenv_init
  command ruby "$@"
}

rake() {
  __rbenv_init
  command rake "$@"
}

bundle() {
  __rbenv_init
  command bundle "$@"
}

# FZF Config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set ignore
export FZF_DEFAULT_COMMAND='ag --hidden --ignore /tmp/ --ignore /.bundle/ --ignore /.git/ -g ""'

# Base 16 colors
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
