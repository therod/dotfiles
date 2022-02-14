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
Plug 'therod/base16-vim' " Base16 colorscheme system
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
Plug 'tpope/vim-markdown'

" OTHER
Plug 'benmills/vimux' " Send command from vim to tmux
Plug 'skalnik/vim-vroom' " Run tests depending on environment
Plug 'mattn/webapi-vim' " used by gist-vim
Plug 'mattn/gist-vim' " Ability to edit gists with :Gist -l
Plug 'tpope/vim-fugitive' " Git addon for vim
Plug 'tpope/vim-rhubarb' "If fugitive.vim is the Git, rhubarb.vim is the Hub
Plug 'neomake/neomake' " Used for Rubocop
Plug 'scrooloose/nerdtree' " File Navigation
Plug 'junegunn/goyo.vim' " Writing
Plug 'ledger/vim-ledger' " Vim Extension for Ledger

" Test
Plug 'keith/swift.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'neoclide/coc.nvim', {'branch': 'release' }
" Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
" Plug 'Yggdroot/indentLine'
" Plug 'tomasiser/vim-code-dark'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'ervandew/supertab' " Super tabs

call plug#end()
filetype plugin indent on    " required

" ----------------------------------------------------------------------------
" BASIC CONFIGURATION
" ----------------------------------------------------------------------------
filetype plugin indent on
syntax on

set mouse=""
" set foldlevelstart=20
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
set scrolloff=5
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

" ----------------------------------------------------------------------------
" DEFAUT MAPPINGS
" ----------------------------------------------------------------------------
let mapleader = ','

nnoremap <leader>1 :source ~/.dotfiles/nvim/init.vim<CR>

map WW :w!<CR>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Commands to remap paragraphs
nnoremap Q gqap
vnoremap Q gq

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

" Color Settings
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

" ----------------------------------------------------------------------------
" ALIASES / SHORTCUTS
" ----------------------------------------------------------------------------
" Save Current File using ctrl-s
nnoremap <c-s> :w!<cr>
cnoreabbrev W w!

" Copy full (escaped) path to the system clipboard
map <leader>y :let @* = fnameescape(expand('%:p'))<cr>

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
" nnoremap <C-j> :m+<CR>==
" nnoremap <C-k> :m-2<CR>==
" inoremap <C-j> <Esc>:m+<CR>==gi
" inoremap <C-k> <Esc>:m-2<CR>==gi
" vnoremap <C-j> :m'>+<CR>gv=gv
" vnoremap <C-k> :m-2<CR>gv=gv

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

  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
augroup END

let g:markdown_fenced_languages = ['html', 'sql', 'ruby', 'python', 'bash=sh']
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1

autocmd FileType markdown setlocal linebreak " wrap on words, not characters
autocmd FileType markdown set wrap

augroup my_spelling_colors
  " Underline, don't do intrusive red things.
  autocmd!
  " autocmd ColorScheme * hi clear SpellBad
  autocmd ColorScheme * hi SpellBad cterm=underline ctermfg=NONE ctermbg=NONE term=Reverse
  autocmd ColorScheme * hi SpellCap cterm=underline ctermfg=NONE ctermbg=NONE term=Reverse
  autocmd ColorScheme * hi SpellLocal cterm=underline ctermfg=NONE ctermbg=NONE term=Reverse
  autocmd ColorScheme * hi SpellRare cterm=underline ctermfg=NONE ctermbg=NONE term=Reverse
augroup END
set spelllang=en_us

" ----------------------------------------------------------------------------
" VROOM SETTINGS
" ----------------------------------------------------------------------------
let g:vroom_map_keys = 1 "Disable Vroom
let g:vroom_use_colors = 1
let g:vroom_use_vimux = 1
let g:vroom_use_terminal = 0
let g:vroom_clear_screen = 0
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
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

" ---------------------------------------------------------------------------
" Neomake
" ---------------------------------------------------------------------------
" autocmd! BufWritePost * Neomake

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
map <leader>G :Goyo \| set linebreak \| set wrap<CR>
let g:goyo_height = 100
let g:goyo_linenr = 0

" Open marked app
map <leader>p :!open -a /Applications/Marked\ 2.app "%"<CR>

" ---------------------------------------------------------------------------
" VARIOUS
" ---------------------------------------------------------------------------
" Urlview
noremap <leader>u :w \| startinsert \| term urlview %<cr>

" Spell Check
map <leader>o :setlocal spell! spelllang=en_us<CR>

nnoremap <Space> za

function! SNote(...)
  let path = strftime("%Y%m%d%H%M")." ".trim(join(a:000)).".md"
  execute ":sp " . fnameescape(path)
endfunction
command! -nargs=* SNote call SNote(<f-args>)

function! Note(...)
  let path = strftime("%Y%m%d%H%M")." ".trim(join(a:000)).".md"
  execute ":e " . fnameescape(path)
endfunction
command! -nargs=* Note call Note(<f-args>)

function! ZettelkastenSetup()
  syntax region mkdFootnotes matchgroup=mkdDelimiter start="\[\["    end="\]\]"
  highlight mkdFootnotes ctermfg=DarkRed guifg=#cc6666

  " TODO: Call zks instead of FZF
  " https://github.com/junegunn/fzf.vim#example-advanced-ripgrep-integration
  nnoremap <silent><leader>gf :FZF -q <C-R>=expand("<cword>")<CR><CR>

  if expand("%:t") !~ '^[0-9]\+'
    return
  endif

  inoremap <expr> <plug>(fzf-complete-path-custom) fzf#vim#complete#path("rg --files -t md \| sed 's/^/[[/g' \| sed 's/$/]]/'")
  imap <buffer> [[ <plug>(fzf-complete-path-custom)

  function! s:CompleteTagsReducer(lines)
    if len(a:lines) == 1
      return "#" . a:lines[0]
    else
      return split(a:lines[1], '\t ')[1]
    end
  endfunction

  inoremap <expr> <plug>(fzf-complete-tags) fzf#vim#complete(fzf#wrap({
        \ 'source': 'zsh -lc "zktr"',
        \ 'options': '--multi --ansi --nth 2 --print-query --exact --header "Enter without a selection creates new tag"',
        \ 'reducer': function('<sid>CompleteTagsReducer')
        \ }))
  imap <buffer> # <plug>(fzf-complete-tags)
endfunction

autocmd BufNew,BufNewFile,BufRead ~/work/zettelkasten/*.md call ZettelkastenSetup()

" let ruby_fold = 1
" let ruby_foldable_groups = 'def'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
