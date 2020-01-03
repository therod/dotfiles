# Learn more about this at https://github.com/basecamp/sub
# This part speeds up zsh initialization
__cg_started=0

__cg_init() {
  test $__cg_started = 0 && {
    eval "$(command $HOME/.cg/bin/cg init -)"
    __cg_started=1
  }
}

cg() {
  __cg_init
  command cg "$@"
}
