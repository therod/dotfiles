set nocompatible
filetype off

" ----------------------------------------------------------------------------
" PLUG (https://github.com/junegunn/vim-plug)
" ----------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" CORE
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary' " Do commenting with `gc`
Plug 'chriskempson/base16-vim' " Base16 colorscheme system
Plug 'mileszs/ack.vim'  " Ack
Plug 'ap/vim-buftabline' " Buffer as tabs
Plug 'tpope/vim-eunuch' " Unix sugar for vim

" SYNTAX
Plug 'tpope/vim-endwise' " Autocomplete Ruby statements.
Plug 'tpope/vim-rails' " Rails Helpers
Plug 'vim-ruby/vim-ruby' " Ruby helpers
Plug 'hail2u/vim-css3-syntax' " CSS3 Support
Plug 'cakebaker/scss-syntax.vim' "SCSS Support
Plug 'MaxMEllon/vim-jsx-pretty' " New Javascript Plugin
Plug 'sunaku/vim-ruby-minitest' " Minitest helpers
Plug 'chase/vim-ansible-yaml' " YAML Support
Plug 'tpope/vim-markdown' " Markdown Support

" OTHER
Plug 'benmills/vimux' " Send command from vim to tmux
Plug 'skalnik/vim-vroom' " Run tests depending on environment
Plug 'mattn/webapi-vim' " used by gist-vim
Plug 'mattn/gist-vim' " Ability to edit gists with :Gist -l
Plug 'tpope/vim-fugitive' " Git addon for vim
Plug 'neomake/neomake' " Used for Rubocop
Plug 'scrooloose/nerdtree' " File Navigation
Plug 'ervandew/supertab' " Super tabs
Plug 'junegunn/goyo.vim' " Writing
Plug 'lervag/vimtex' " LaTeX

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
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set nobackup

let mapleader = ','

" ----------------------------------------------------------------------------
" COLOR STUFF
" ----------------------------------------------------------------------------
if has("nvim")
  set termguicolors
end

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" ----------------------------------------------------------------------------
" ALIASES / SHORTCUTS
" ----------------------------------------------------------------------------
" Save Current File using ctrl-s
nnoremap <c-s> :w!<cr>
cnoreabbrev W w!

" Commands to remap paragraphs
nnoremap Q gqap
vnoremap Q gq

" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" Strip Whitespace
map <leader>s :%s/\s\+$//e<CR>

" Shortcut to rapidly toggle `set list
nmap <leader>l :set list!<cr>

" Atom style line moving
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" Reopen files on the same line as last time
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ----------------------------------------------------------------------------
" CUSTOM AUTOCMDS
" ----------------------------------------------------------------------------
augroup vimrcEx
  autocmd!
  autocmd FileType text setlocal textwidth=80
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
augroup END

augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup END

" ----------------------------------------------------------------------------
" VROOM SETTINGS
" ----------------------------------------------------------------------------
let g:vroom_map_keys = 1 "Disable Vroom
let g:vroom_use_colors = 1
let g:vroom_use_vimux = 1
let g:vroom_test_unit_command = 'bin/rails test'
let g:vroom_use_bundle_exec = 0

autocmd Filetype ruby map <leader>r :VroomRunTestFile<CR>
autocmd Filetype ruby map <leader>R :VroomRunNearestTest<CR>

" ----------------------------------------------------------------------------
" BUFFERS N SHIT, BECAUSE FUCK TABS
" ----------------------------------------------------------------------------
map <C-l> :bnext<CR>
map <C-h> :bprevious<CR>
map <leader>x :bp <BAR> bd #<CR>

" ----------------------------------------------------------------------------
" FZF
" ----------------------------------------------------------------------------
" Ignore rules can be changed in .zshrc. Read more here:
" https://github.com/junegunn/fzf#respecting-gitignore-hgignore-and-svnignore
nnoremap <C-p> :FZF<cr>
nnoremap <leader>f :Files<CR>

" ----------------------------------------------------------------------------
" CTAGS
" ----------------------------------------------------------------------------
map <leader>ta :exec("tag ".expand("<cword>"))<CR>
map <leader>ts :vsp <CR>:exec("tag " .expand("<cword>"))<CR>
map <Leader>TT :Ctags<CR>

" ---------------------------------------------------------------------------
" Fugitive
" ---------------------------------------------------------------------------
set tags^=./.git/tags;

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
" Neomake
" ---------------------------------------------------------------------------
autocmd! BufWritePost * Neomake

" ---------------------------------------------------------------------------
" ACKGrep
" ---------------------------------------------------------------------------
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" Search for open Todos inside the directory structure
map <leader>N :Ag --ignore-dir=log --ignore-dir=node_modules --ignore-dir=public --ignore-dir=tmp 'TODO\|FIXME\|CHANGED\|NOTE' *<CR>

" ---------------------------------------------------------------------------
" Goyo
" ---------------------------------------------------------------------------
map <leader>g :Goyo \| set linebreak<CR>
let g:goyo_height = 100
let g:goyo_linenr = 0

" ---------------------------------------------------------------------------
" Compilation
" ---------------------------------------------------------------------------
" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler "%"<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout "%"<CR>

" ---------------------------------------------------------------------------
" VARIOUS
" ---------------------------------------------------------------------------
" Urlview
noremap <leader>u :w \| startinsert \| term urlview %<cr>

" Spell Check
map <leader>o :setlocal spell! spelllang=en_us<CR>
