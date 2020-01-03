# This part speeds up zsh initialization
__nodenv_started=0

__nodenv_init() {
  test $__nodenv_started = 0 && {
    eval "$(command nodenv init -)"
    __nodenv_started=1
  }
}

nodenv() {
  __nodenv_init
  command nodenv "$@"
}

node() {
  __nodenv_init
  command node "$@"
}

npm() {
  __nodenv_init
  command npm "$@"
}
