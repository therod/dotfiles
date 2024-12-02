-- Basic Neovim settings
vim.g.mapleader = ","

vim.cmd('filetype off')
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

vim.opt.compatible = false
vim.opt.autoindent = true
vim.opt.cursorcolumn = false
vim.opt.cursorline = false
vim.opt.backspace = 'indent,eol,start'
vim.opt.cmdheight = 1
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.formatoptions:append('n')
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.history = 1000
vim.opt.lazyredraw = false
vim.opt.showcmd = false
vim.opt.smarttab = false
vim.opt.startofline = false
vim.opt.wrap = false
vim.opt.number = true
vim.opt.report = 0
vim.opt.scrolloff = 3
vim.opt.shell = 'zsh'
vim.opt.shiftwidth = 2
vim.opt.shortmess = 'filtIoOA'
vim.opt.showmatch = true
vim.opt.showtabline = 1
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.switchbuf = 'useopen'
vim.opt.tabstop = 4
vim.opt.virtualedit = 'block'
vim.opt.whichwrap:append('<,>,h,l,[,]')
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest,list'
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevelstart = 20

-- Reopen files on the same line as last time
vim.cmd([[
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif
]])

-- Store temporary files in a central spot
vim.opt.backupdir = '~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp'
vim.opt.directory = '~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp'

-- Fugitive
vim.opt.tags:prepend('./.git/tags;')

-- VIM-MARKDOWN
vim.g.markdown_fenced_languages = {'html', 'sql', 'ruby', 'python', 'bash=sh'}
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_new_list_item_indent = 0
vim.g.vim_markdown_auto_insert_bullets = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_no_extensions_in_markdown = 1
vim.g.vim_markdown_follow_anchor = 1
vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_autowrite = 1

vim.cmd([[
  autocmd FileType markdown setlocal linebreak
  autocmd FileType markdown set wrap
]])

-- ACKGrep
vim.g.ackprg = 'ag --vimgrep --smart-case'
vim.cmd([[
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
]])

-- Use tab for trigger completion with characters ahead and navigate
local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- Always show the signcolumn
if vim.fn.has("patch-8.1.1564") == 1 then
  vim.opt.signcolumn = "number"
else
  vim.opt.signcolumn = "yes"
end
