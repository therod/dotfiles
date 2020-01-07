# This part speeds up zsh initialization
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

# Check if puma-dev has initialized the shell and instantly run rbenv
if [ "$(basename $(ps -o comm= $PPID))" = "puma-dev" ]; then
  rbenv rehash
fi
