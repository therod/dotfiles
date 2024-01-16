" PLUG (https://github.com/junegunn/vim-plug)
" ----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" CORE
Plug '/usr/local/opt/fzf' " Fuzzy Search
Plug 'junegunn/fzf.vim' " Fuzzy Search vim plugins

Plug 'vim-airline/vim-airline' " Status Bar
Plug 'vim-airline/vim-airline-themes' " Status Bar Themes
Plug 'ryanoasis/vim-devicons' " Icons for vim
Plug 'tpope/vim-commentary' " Do commenting with `gc`
Plug 'therod/base16-vim' " Base16 colorscheme system

Plug 'mileszs/ack.vim'  " Ack
Plug 'tpope/vim-eunuch' " Unix sugar for vim
Plug 'skalnik/vim-vroom' " Run tests depending on environment

" SYNTAX
Plug 'tpope/vim-endwise' " Autocomplete Ruby statements.
Plug 'tpope/vim-rails' " Rails Helpers
Plug 'vim-ruby/vim-ruby' " Ruby helpers
Plug 'hail2u/vim-css3-syntax' " CSS3 Support
Plug 'cakebaker/scss-syntax.vim' "SCSS Support
Plug 'MaxMEllon/vim-jsx-pretty' " New Javascript Plugin
Plug 'sunaku/vim-ruby-minitest' " Minitest helpers
Plug 'chase/vim-ansible-yaml' " YAML Support
Plug 'tpope/vim-markdown'

" OTHER
Plug 'benmills/vimux' " Send command from vim to tmux
Plug 'mattn/webapi-vim' " used by gist-vim
Plug 'mattn/gist-vim' " Ability to edit gists with :Gist -l
Plug 'tpope/vim-fugitive' " Git addon for vim
Plug 'tpope/vim-rhubarb' "If fugitive.vim is the Git, rhubarb.vim is the Hub
Plug 'neomake/neomake' " Used for Rubocop
Plug 'scrooloose/nerdtree' " File Navigation
Plug 'junegunn/goyo.vim' " Writing
Plug 'ledger/vim-ledger' " Vim Extension for Ledger

" Test
Plug 'github/copilot.vim'
Plug 'keith/swift.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'

call plug#end()
