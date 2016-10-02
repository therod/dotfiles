" This is Rodrigo Haenggi's .vimrc file
set nocompatible
filetype off                  " required

" ----------------------------------------------------------------------------
" PLUG (https://github.com/junegunn/vim-plug)
" ----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Core
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'szw/vim-tags'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'

" Colorschemes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'

" Writing & ORG
Plug 'vimwiki/vimwiki'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'

" Ruby
Plug 'skalnik/vim-vroom'
Plug 'vim-ruby/vim-ruby'
Plug 'sunaku/vim-ruby-minitest'
Plug 'tpope/vim-rails'

" Other Syntax
Plug 'keith/swift.vim'
Plug 'tpope/vim-markdown'
Plug 'duwanis/tomdoc.vim'
Plug 'digitaltoad/vim-jade'
Plug 'fatih/vim-go'
Plug 'othree/html5.vim'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'

" Evaluating
Plug 'godlygeek/tabular'
Plug 'ap/vim-css-color'

" Experimental
Plug 'junegunn/gv.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" All of your Plugs must be added before the following line
call plug#end()
filetype plugin indent on    " required

" ----------------------------------------------------------------------------
" BASIC CONFIGURATION
" ----------------------------------------------------------------------------
filetype plugin indent on
syntax on

set mouse=""
set foldmethod=syntax
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
set tabstop=4
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

" ----------------------------------------------------------------------------
" COLOR STUFF
" ----------------------------------------------------------------------------
" gui colors if running iTerm
if has("nvim")
  set termguicolors
end

if filereadable(expand("~/.vimrc_background"))
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
  let g:vroom_map_keys = 0 "Disable Vroom
  let g:vroom_use_colors = 1

  " Ruby
  autocmd Filetype ruby map <leader>r :VroomRunTestFile<CR>
  autocmd Filetype ruby map <leader>R :VroomRunNearestTest<CR>

  " Go
  autocmd Filetype go map <leader>r :! go run %<CR>

augroup END

" VIMIWKI
augroup vimwiki_settings
  autocmd!
  autocmd FileType vimwiki setlocal wrap linebreak nolist textwidth=0 wrapmargin=0
  let g:vimwiki_folding='syntax'
" ugroup END

" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ----------------------------------------------------------------------------
" REMAPPING
" ----------------------------------------------------------------------------
let mapleader = ","
map WW :w!<CR>

" nvim terminal mode
noremap <esc><esc> <C-\><C-n>

nnoremap Q gqap
vnoremap Q gq
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

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Shortcut to rapidly toggle `set list
nmap <leader>l :set list!<cr>

" ----------------------------------------------------------------------------
" BUFFERS N SHIT, BECAUSE FUCK TABS
" ----------------------------------------------------------------------------
map <C-t> :enew<CR>
map <C-l> :bnext<CR>
map <C-h> :bprevious<CR>
map <leader>x :bp <BAR> bd #<CR>
map <leader>bl :ls<CR>

" ----------------------------------------------------------------------------
" PLUGIN CONFIGURATIONS
" ----------------------------------------------------------------------------
" Airline
let g:airline_powerline_fonts=1
let g:bufferline_echo = 1
let g:airline_section_c = ''
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_mode_map = {'c': 'C', '^S': 'S', 'R': 'R', 's': 'S', 't': 'T', 'V': 'VL', '^V': 'VB', 'i': 'I', '__': '------', 'S': 'SL', 'v': 'V', 'n': 'N'}
let g:airline_section_z = ''
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''

" Commentary
map // :Commentary<CR>

" FZF
" Ignore rules can be changed in .zshrc. Read more here:
" https://github.com/junegunn/fzf#respecting-gitignore-hgignore-and-svnignore
nnoremap <C-p> :FZF<cr>

" NERDTree
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" GO
let g:go_disable_autoinstall = 0

" Trailing Whitespace
function! StripWhitespace ()
  exec ':FixWhitespace'
endfunction
map <leader>s :call StripWhitespace ()<CR>

" CTAGS
map <leader>ta :exec("tag ".expand("<cword>"))<CR>
map <leader>ts :vsp <CR>:exec("tag " .expand("<cword>"))<CR>
map <Leader>TT :TagsGenerate!<CR>
map <Leader>tt :TagsGenerate<CR>
set tags+=./tags;
let g:vim_tags_auto_generate = 0

" Goyo & Pencil
map <F10> :Goyo <bar> :TogglePencil <CR>
map <F9> :setlocal spell! spelllang=en_us<CR>

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init({'wrap': 'hard'})
  autocmd FileType text         call pencil#init({'wrap': 'soft'})
augroup END

" ---------------------------------------------------------------------------
" VARIOUS
" ---------------------------------------------------------------------------
"  No idea what this does
let g:netrw_home = $HOME

" OS X STUFF
" Open the file using Marked.app => Good for previewing MARKDOWN files
map <leader>p :!open -a /Applications/Marked\ 2.app '%'<cr>
