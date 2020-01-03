## Installation
Dotfile symlinking is handled via [dotbot](https://github.com/anishathalye/dotbot). After cloning the repository have a look at `install.conf.yaml` and run `./install` to generate the symlinks.

- `git clone git://github.com/therod/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `./install`
- `rake install_brew` to install homebrew programs defined in `progs.csv`

## Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.

## What to do if zsh feels slow / sluggish?
Read this blog post: https://htr3n.github.io/2018/07/faster-zsh/
