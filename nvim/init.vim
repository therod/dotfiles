" This is Rodrigo Haenggi's .vimrc file
set nocompatible
filetype off                  " required

" ----------------------------------------------------------------------------
" PLUG (https://github.com/junegunn/vim-plug)
" ----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Core
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'

" Utils
" Plug 'vim-scripts/taglist.vim'
Plug 'szw/vim-tags'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'

" Ruby & Rails
Plug 'skalnik/vim-vroom'
Plug 'vim-ruby/vim-ruby'
Plug 'sunaku/vim-ruby-minitest'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rbenv'

" HTML & CSS & Others
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'

" Swift & Cocoa
Plug 'keith/swift.vim'

" Go
Plug 'fatih/vim-go'

" Node / Jade
Plug 'digitaltoad/vim-jade'
Plug 'KabbAmine/gulp-vim'

" Markdown etc.
Plug 'tpope/vim-markdown'
Plug 'duwanis/tomdoc.vim'
Plug 'kylef/apiblueprint.vim'

" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

" Experimental
Plug 'bling/vim-bufferline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/goyo.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'airblade/vim-gitgutter'

" All of your Plugs must be added before the following line
call plug#end()
filetype plugin indent on    " required

" ----------------------------------------------------------------------------
" COLOR
" ----------------------------------------------------------------------------
set t_Co=256
let g:solarized_termcolor=256
colorscheme gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:airline_theme='solarized'
let g:lightline = { 'colorscheme': 'solarized' }
call togglebg#map("<F5>")
so ~/.config/nvim/plugin/background-color.vim

" ----------------------------------------------------------------------------
" BASIC CONFIGURATION
" ----------------------------------------------------------------------------
filetype plugin indent on
syntax on

set autoindent
set backspace=indent,eol,start
set cmdheight=1
set encoding=utf-8
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
set tabstop=4
set virtualedit=block
set whichwrap+=<,>,h,l,[,]
set wildmenu
set wildmode=longest,list
set colorcolumn=80
" let &colorcolumn=join(range(81,999),",")
" highlight ColorColumn ctermbg=235 guibg=#2c2d27

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

" ----------------------------------------------------------------------------
" CUSTOM AUTOCMDS
" ----------------------------------------------------------------------------
augroup vimrcEx

  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  "leader-r mappings for different languages
  let g:vroom_map_keys = 0 "Disable Vroom
  let g:vroom_use_colors = 1

  " Ruby
  autocmd Filetype ruby map <leader>r :VroomRunTestFile<CR>
  autocmd Filetype ruby map <leader>R :VroomRunNearestTest<CR>

  " Go
  autocmd Filetype go map <leader>r :! go run %<CR>

augroup END

" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ----------------------------------------------------------------------------
" REMAPPING
" ----------------------------------------------------------------------------
let mapleader = ","
map WW :w!<CR>

nnoremap Q gqap
vnoremap Q gq
"sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk



" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>V :view %%

" Search for open Todos inside the directory structure
map <leader>N :Ag --ignore-dir=log 'TODO\|FIXME\|CHANGED\|NOTE' *<CR>

" ----------------------------------------------------------------------------
" BUFFERS N SHIT, BECAUSE FUCK TABS
" ----------------------------------------------------------------------------
map <C-t> :enew<CR>
map <C-l> :bnext<CR>
map <C-h> :bprevious<CR>
map <leader>x :bp <BAR> bd #<CR>
map <leader>bl :ls<CR>

" ----------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------
" set noshowmode
let g:airline_powerline_fonts=1

let g:bufferline_echo = 1

let g:airline_section_c = ''
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_mode_map = {'c': 'C', '^S': 'S', 'R': 'R', 's': 'S', 't': 'T', 'V': 'VL', '^V': 'VB', 'i': 'I', '__': '------', 'S': 'SL', 'v': 'V', 'n': 'N'}

" ----------------------------------------------------------------------------
" Commentary
" ----------------------------------------------------------------------------

map // :Commentary<CR>
" ----------------------------------------------------------------------------
" Control P
" ----------------------------------------------------------------------------
set wildignore+=*/web/*
set wildignore+=*/public/assets/*
set wildignore+=*/vendor/rails/*
set wildignore+=*/public/system/*
set wildignore+=*/vendor/rails/*
set wildignore+=*/.bundle/*
set wildignore+=*/tmp/*
set wildignore+=*/build/*
set wildignore+=*/node_modules/*
" set wildignore+=*/public/*
let g:ctrlp_match_window = 'bottom'
let g:ctrlp_use_caching = 0 "Use caching
let g:ctrlp_max_height = 20 "Display 20 results
let g:ctrlp_show_hidden = 0 "Do not scan for dotfiles and dotdirs

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"

" ----------------------------------------------------------------------------
" GO
" ----------------------------------------------------------------------------
let g:go_disable_autoinstall = 0

" ----------------------------------------------------------------------------
" MISC KEY MAPS
" ----------------------------------------------------------------------------
" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Shortcut to rapidly toggle `set list
nmap <leader>l :set list!<cr>

" ---------------------------------------------------------------------------
" STRIP ALL TRAILING WHITESPACE
" ---------------------------------------------------------------------------
function! StripWhitespace ()
  exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>

" ---------------------------------------------------------------------------
" CUSTOM HIGHLIGHTS
" ---------------------------------------------------------------------------
" Erb highlight
if &background == 'light'
  highlight erbLines ctermbg=7
else
  highlight erbLines ctermbg=0
endif

match erbLines /<%.*%>/

" ---------------------------------------------------------------------------
" MULTIPURPOSE TAB KEY
" ---------------------------------------------------------------------------
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
      return "\<tab>"
  else
      return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" ---------------------------------------------------------------------------
" CTAGS / DASH
" ---------------------------------------------------------------------------
map <leader>ta :exec("tag ".expand("<cword>"))<CR>
map <leader>ts :vsp <CR>:exec("tag " .expand("<cword>"))<CR>
map <Leader>TT :TagsGenerate!<CR>
map <Leader>tt :TagsGenerate<CR>
set tags+=./tags;
let g:vim_tags_auto_generate = 0

map <leader>da :Dash<CR>

" ---------------------------------------------------------------------------
" OS X Specific
" ---------------------------------------------------------------------------
" Open the file using Marked.app => Good for previewing MARKDOWN files
map <leader>p :!open -a /Applications/Marked\ 2.app '%'<cr>

" ---------------------------------------------------------------------------
" VARIOUS
" ---------------------------------------------------------------------------
let g:netrw_home = $HOME
