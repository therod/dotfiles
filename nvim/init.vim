" This is Rodrigo Haenggi's .vimrc file
set nocompatible
filetype off                  " required

" ----------------------------------------------------------------------------
" PLUG (https://github.com/junegunn/vim-plug)
" ----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" CORE
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-commentary' " Do commenting with `gc`
Plug 'tpope/vim-eunuch' " Unix sugar for vim
Plug 'mileszs/ack.vim'  " Ack
Plug 'bronson/vim-trailing-whitespace' " Delete trailing whitespace with ,s
Plug 'szw/vim-tags' " ctags for vim
Plug 'tpope/vim-surround' " surround support
Plug 'ervandew/supertab' " Super tabs
Plug 'scrooloose/nerdtree' " Filetree explorer

" GIT
Plug 'mattn/webapi-vim' " used by gist-vim
Plug 'mattn/gist-vim' " Ability to edit gists with :Gist -l
Plug 'tpope/vim-fugitive' " Git addon for vim
Plug 'tpope/vim-rhubarb' " GitHub extension for fugitive
Plug 'junegunn/gv.vim' " use :GV to open commit browser. :GV! only for this file

" VISUAL
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'bling/vim-bufferline' " list vim buffers
Plug 'ap/vim-buftabline'
Plug 'mattn/emmet-vim' " Autocomplete for HTML / CSS
Plug 'chriskempson/base16-vim' " Base16 colorscheme system

" RAILS / RUBY
Plug 'vim-ruby/vim-ruby' " Ruby helpers
Plug 'skalnik/vim-vroom' " Run tests depending on environment
Plug 'tpope/vim-endwise' " Autocomplete Ruby statements.
Plug 'sunaku/vim-ruby-minitest' " Minitest helpers
Plug 'tpope/vim-rails' " Rails Helpers
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler' "Bundler Helpers (ctags)

" HTML / CSS / JS
Plug 'othree/html5.vim' " HTML 5 Support
Plug 'hail2u/vim-css3-syntax' " CSS3 Support
Plug 'cakebaker/scss-syntax.vim' "SCSS Support
Plug 'pangloss/vim-javascript' " Javascript Support
Plug 'kchmck/vim-coffee-script' "Coffeescript Support

" OTHER SYNTAX
Plug 'chase/vim-ansible-yaml' " YAML Support
Plug 'tpope/vim-markdown' " Markdown Support
Plug 'neomake/neomake'
Plug 'benmills/vimux'

" Snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Other
Plug 'christianrondeau/vim-base64'
" Plug 'vimwiki/vimwiki'
" Plug 'junegunn/goyo.vim'

call plug#end()
filetype plugin indent on    " required

" ----------------------------------------------------------------------------
" BASIC CONFIGURATION
" ----------------------------------------------------------------------------
filetype plugin indent on
syntax on

set mouse=""
set foldlevelstart=20
set autoindent
set backspace=indent,eol,start
set cmdheight=1
set expandtab
set formatoptions+=n
set hidden
set hlsearch
set ignorecase smartcase
set incsearch
set laststatus=2
set history=2000
set noshowcmd
set nosmarttab
set nostartofline
set nowrap
set number
set report=0
set scrolloff=3
set scrolljump=8
set shell=zsh
set shiftwidth=2
set shortmess=filtIoOA
set showtabline=1
set smartindent
set softtabstop=2
set switchbuf=useopen
set tabstop=2
set virtualedit=block
set whichwrap+=<,>,h,l,[,]
set wildmenu
set wildmode=longest,list
set colorcolumn=80

" Performance stuff
set nocursorcolumn
set nocursorline
set lazyredraw
let loaded_matchparen=1
let html_no_rendering=1
set noshowmatch

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let mapleader = ','

" ----------------------------------------------------------------------------
" ALIASES / SHORTCUTS
" ----------------------------------------------------------------------------
" Save Current File using ctrl-s
nnoremap <c-s> :w!<cr>

" Commands to remap paragraphs
nnoremap Q gqap
vnoremap Q gq

" Insert a => rocket with <c-l>
imap <c-l> <space>=><space>

" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Search for open Todos inside the directory structure
map <leader>N :Ag --ignore-dir=log 'TODO\|FIXME\|CHANGED\|NOTE' *<CR>

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" Shortcut to rapidly toggle `set list
nmap <leader>l :set list!<cr>

" Atom style line moving
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" ----------------------------------------------------------------------------
" COLOR STUFF
" ----------------------------------------------------------------------------
" gui colors if running iTerm
if has("nvim")
  set termguicolors
end

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" ----------------------------------------------------------------------------
" CUSTOM AUTOCMDS
" ----------------------------------------------------------------------------
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=80

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  "leader-r mappings for different languages
  let g:vroom_map_keys = 1 "Disable Vroom
  let g:vroom_use_colors = 1
  let g:vroom_use_vimux = 1
  let g:vroom_test_unit_command = 'bin/rails test'
  let g:vroom_use_bundle_exec = 0
  " let g:vroom_use_spring = 1
  " let g:vroom_test_unit_command = 'rake test'
  " let g:vroom_command_prefix = 'bin/rails test'

  " Ruby
  autocmd Filetype ruby map <leader>r :VroomRunTestFile<CR>
  autocmd Filetype ruby map <leader>R :VroomRunNearestTest<CR>
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

augroup END

" ----------------------------------------------------------------------------
" VIMIWKI
" ----------------------------------------------------------------------------
augroup vimwiki_settings
  autocmd!
  autocmd FileType vimwiki setlocal wrap linebreak nolist textwidth=0 wrapmargin=0
  let g:vimwiki_folding='syntax'
  let g:vimwiki_list = [{'syntax': 'markdown', 'custom_wiki2html': 'vimwiki_markdown', 'ext': '.md'}]
  " let g:vimwiki_table_mappings = 0
augroup END

" ----------------------------------------------------------------------------
" REOPEN FILE ON SAME LINE AS LAST TIME
" ----------------------------------------------------------------------------
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ----------------------------------------------------------------------------
" BUFFERS N SHIT, BECAUSE FUCK TABS
" ----------------------------------------------------------------------------
map <C-l> :bnext<CR>
map <C-h> :bprevious<CR>
map <leader>x :bp <BAR> bd #<CR>

" ----------------------------------------------------------------------------
" COMMENTARY
" ----------------------------------------------------------------------------
map // :Commentary<CR>

" ----------------------------------------------------------------------------
" FZF
" ----------------------------------------------------------------------------
" Ignore rules can be changed in .zshrc. Read more here:
" https://github.com/junegunn/fzf#respecting-gitignore-hgignore-and-svnignore
nnoremap <C-p> :FZF<cr>

" ----------------------------------------------------------------------------
" TRAILING WHITESPACE
" ----------------------------------------------------------------------------
function! StripWhitespace ()
  exec ':FixWhitespace'
endfunction
map <leader>s :call StripWhitespace ()<CR>

" ----------------------------------------------------------------------------
" CTAGS
" ----------------------------------------------------------------------------
map <leader>ta :exec("tag ".expand("<cword>"))<CR>
map <leader>ts :vsp <CR>:exec("tag " .expand("<cword>"))<CR>
map <Leader>TT :TagsGenerate!<CR>
map <Leader>tt :TagsGenerate<CR>
set tags+=./tags;
let g:vim_tags_auto_generate = 0

" ---------------------------------------------------------------------------
" Neomake
" ---------------------------------------------------------------------------

" Run NeoMake on read and write operations
" autocmd! BufReadPost,BufWritePost * Neomake
autocmd! BufWritePost * Neomake
" call neomake#configure#automake('w')
" let g:neomake_open_list = 2
" let g:neomake_ruby_enabled_makers = ['rubocop']

" Enable seeing-is-believing mappings only for Ruby
" augroup seeingIsBelievingSettings
"   autocmd!

"   autocmd FileType ruby nmap <buffer> <C-\> <Plug>(seeing-is-believing-mark-and-run)
"   autocmd FileType ruby xmap <buffer> <C-\> <Plug>(seeing-is-believing-mark-and-run)

" augroup END

" ---------------------------------------------------------------------------
" Airline
" ---------------------------------------------------------------------------
" let g:airline_powerline_fonts=1
" let g:bufferline_echo = 1
" let g:airline_section_c = ''
" let g:airline#extensions#tabline#show_buffers = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_mode_map = {'c': 'C', '^S': 'S', 'R': 'R', 's': 'S', 't': 'T', 'V': 'VL', '^V': 'VB', 'i': 'I', '__': '------', 'S': 'SL', 'v': 'V', 'n': 'N'}
" let g:airline_section_z = ''
" let g:airline_right_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_left_sep = ''
" let g:airline#extensions#tabline#show_close_button = 0
" let g:airline#extensions#tabline#show_tab_type = 0
" let g:airline#extensions#tabline#show_tabs = 0
" let g:airline#extensions#tabline#show_splits = 1
" let g:airline#extensions#tabline#show_buffers = 1

" ---------------------------------------------------------------------------
" NERDTree
" ---------------------------------------------------------------------------
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

" ---------------------------------------------------------------------------
" ACKGrep
" ---------------------------------------------------------------------------
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" ---------------------------------------------------------------------------
" Open preview in marked 2
" ---------------------------------------------------------------------------
map <leader>p :! open -a '/Applications/Marked 2.app' '%'<cr>
