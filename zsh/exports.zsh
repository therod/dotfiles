# CORE
export EDITOR="nvim"
export PATH="/usr/local/bin:./bin:/usr/local/sbin:$ZSH/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# GOLANG
export GOPATH=$HOME/.golang
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# NODE
export NODE_PATH="/usr/local/lib/node"
export NODE_BIN="/usr/local/share/npm/bin"
export PATH="/usr/local/share/npm/bin:$PATH"

# YARN SLOW!!!!
# export PATH="$PATH:`yarn global bin`"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Fix SSH Locales error
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Include ~/.bin in the path
export PATH="$HOME/.bin:/usr/local/bin:$PATH"

# Include dotfile scripts
export PATH="$HOME/.dotfiles/bin:$PATH"

# Point perl to local modules
export PERL_LOCAL_LIB_ROOT="$HOME/perl5"
export PERL5LIB="$PERL_LOCAL_LIB_ROOT/lib/perl5"
export PERL_MB_OPT="--install_base \"$PERL_LOCAL_LIB_ROOT\""
export PERL_MM_OPT="INSTALL_BASE=$PERL_LOCAL_LIB_ROOT"
export PATH="$PERL_LOCAL_LIB_ROOT/bin:$PATH";

# Colored man pages: http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
