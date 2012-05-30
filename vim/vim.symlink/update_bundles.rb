#!/usr/bin/env ruby

git_bundles = [ 
    "git://github.com/wincent/Command-T.git",                     # Fast file opener
    "git://github.com/tpope/vim-markdown.git",                    # Markdown Support
    "git://github.com/altercation/vim-colors-solarized.git",      # Solarized colorscheme for VIM
    "git://github.com/tpope/vim-commentary.git",                  # New commenting plugin by tpope
    "git://github.com/tpope/vim-eunuch.git",                      # Vim sugar for the UNIX shell
    "git://github.com/tpope/vim-fugitive.git",                    # Git wrapper
    "git://github.com/tpope/vim-rails.git",                       # Ruby on Rails power tools
    "git://github.com/vim-ruby/vim-ruby.git",                     # Edit and compile Ruby within Vim.
    "git://github.com/vim-scripts/taglist.vim.git",               # Source code browser
    "git://github.com/mileszs/ack.vim.git",                       # Vim plugin for the Perl module / CLI script "ack"
    "git://github.com/lepture/vim-velocity.git",                  # Velocity extensions
    "git://github.com/skalnik/vim-vroom.git",                     # Run tests from within vim
    "git://github.com/sunaku/vim-ruby-minitest.git",              # Minitest vor VIM
    "git://github.com/kchmck/vim-coffee-script.git"               # Coffeescript support for vim
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "Trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end
