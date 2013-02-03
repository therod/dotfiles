export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Add rbenv init to your shell to enable shims and autocompletion
if [[ -d ~/.rbenv ]]; then
  eval "$(rbenv init -)"
fi

# @see http://vim.1045645.n5.nabble.com/MacVim-and-PATH-tt3388705.html#a3392363
# Ensure vim has same shell as Terminal
if [[ -a /etc/zshenv ]]; then
  sudo mv /etc/zshenv /etc/zprofile
fi
