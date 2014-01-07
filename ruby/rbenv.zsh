export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"

# Ensure vim has same shell as Terminal
if [[ -a /etc/zshenv ]]; then
  sudo mv /etc/zshenv /etc/zprofile
fi
