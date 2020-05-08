# CORE
export EDITOR="nvim"
export PATH="./bin:/usr/local/sbin:$HOME/.bin:$PATH" # /usr/local/bin included in macos
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
export WORK="$HOME/work"

# Setup the environment (needs to be on top)
export PROJECTS=$HOME/code
export ZK_PATH=$ZETTELKASTEN
export JOURNAL=$WORK/journal
export ESSAYS=$WORK/essays

### Fix SSH Locales error
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Colored man pages: http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# ~/ cleanup:
export LESSHISTFILE="-"
