# set colorscheme for tmux
alias tlist="tmux list-sessions"
# alias tmux="TERM=screen-256color-bce tmux -u"
alias tmux="env TERM=xterm-256color tmux"
alias tkill="tmux kill-session -t $*"
alias tnew="tmux new-session -s $*"
alias tatt="tmux attach -t $*"
