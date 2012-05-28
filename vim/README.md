# Vim notes

## Plugin Management
I am using Tim Popes [pathogen](https://github.com/tpope/vim-pathogen) extension for plugin managmenet.
This keeps my vim directory very lightweight since I can just add functionality via git clone URLs.

### Adding new plugins
Edit the file `./update_bundles.rb` and add pathogen supported plugins as git url to the `git_bundles` array.

### Updating / installing plugins
Just run `~/.dotfiles/vim/vim.symlink/update_bundles.rb` from the command line. This will fetch the latest
plugin version from GitHub and add it to your vim envirionment.


**Important:** Make sure that you don't add plugins manually to the `./vim.symlink/bundle` directory. The 
script will purge this directory EVERY TIME you run it.

