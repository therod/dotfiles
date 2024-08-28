-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox-light-hard" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

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

-- Store temporary files in a central spot
vim.opt.directory = '/home/yourusername/.vim-tmp,/home/yourusername/.tmp,/home/yourusername/tmp,/var/tmp,/tmp'
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- DEFAULT MAPPINGS
vim.api.nvim_set_keymap('', 'WW', ':w!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true })

-- COLOR STUFF
if vim.fn.has("nvim") == 1 then
  vim.opt.termguicolors = true
end

if vim.fn.filereadable(vim.fn.expand("~/.vimrc_background")) == 1 then
  vim.g.base16colorspace = 256
  vim.env.BAT_THEME = 'Solarized (dark)'
  vim.cmd('source ~/.vimrc_background')
end

vim.cmd([[
  hi! Normal ctermbg=NONE guibg=NONE
  hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
]])

-- Remap paragraphs
vim.api.nvim_set_keymap('n', 'Q', 'gqap', { noremap = true })
vim.api.nvim_set_keymap('v', 'Q', 'gq', { noremap = true })

-- ALIASES / SHORTCUTS
-- Save Current File using ctrl-s
vim.api.nvim_set_keymap('n', '<c-s>', ':w!<cr>', { noremap = true })
vim.cmd('cnoreabbrev W w!')

-- Copy full (escaped) path to the system clipboard
vim.api.nvim_set_keymap('n', '<leader>y', ':let @* = fnameescape(expand("%:p"))<cr>', { noremap = true })

-- Map ,e and ,v to open files in the same directory as the current file
vim.cmd([[
  cnoremap %% <C-R>=expand('%:h').'/'<cr>
  map <leader>e :edit %%
  map <leader>v :view %%
]])

-- clear the search buffer when hitting return
vim.api.nvim_set_keymap('n', '<CR>', ':nohlsearch<cr>', { noremap = true })

-- Strip Whitespace
vim.api.nvim_set_keymap('n', '<leader>s', ':%s/\\s\\+$//e<CR>', { noremap = true })

-- Shortcut to rapidly toggle `set list`
vim.api.nvim_set_keymap('n', '<leader>l', ':set list!<cr>', { noremap = true })

-- Reopen files on the same line as last time
vim.cmd([[
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif
]])

-- ----------------------------------------------------------------------------
-- BUFFERS N SHIT, BECAUSE FUCK TABS
-- ----------------------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<C-l>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':bprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':bp <BAR> bd #<CR>', { noremap = true })

-- ----------------------------------------------------------------------------
-- CTAGS
-- ----------------------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>ta', ':exec("tag ".expand("<cword>"))<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ts', ':vsp <CR>:exec("tag " .expand("<cword>"))<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>TT', ':Ctags<CR>', { noremap = true })

-- ---------------------------------------------------------------------------
-- Fugitive
-- ---------------------------------------------------------------------------
vim.opt.tags:prepend('./.git/tags;')

-- ---------------------------------------------------------------------------
-- NERDTree
-- ---------------------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>N', ':NERDTreeFind<CR>', { noremap = true })
vim.g.NERDTreeWinPos = "right"
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeAutoDeleteBuffer = 1

-- ---------------------------------------------------------------------------
-- ACKGrep
-- ---------------------------------------------------------------------------
vim.g.ackprg = 'ag --vimgrep --smart-case'
vim.cmd([[
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
]])

-- ---------------------------------------------------------------------------
-- Goyo
-- ---------------------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>G', ':Goyo | set linebreak | set wrap<CR>', { noremap = true })
vim.g.goyo_height = 100
vim.g.goyo_linenr = 0

-- Open marked app
vim.api.nvim_set_keymap('n', '<leader>p', ':!open -a /Applications/Marked\\ 2.app "%"<CR>', { noremap = true })

-- ----------------------------------------------------------------------------
-- VIM-VROOM
-- ----------------------------------------------------------------------------
vim.g.vroom_map_keys = 1
vim.g.vroom_use_colors = 1
vim.g.vroom_use_vimux = 1
vim.g.vroom_use_terminal = 0
vim.g.vroom_clear_screen = 0
vim.g.vroom_test_unit_command = 'bin/rails test'
vim.g.vroom_use_bundle_exec = 0

vim.cmd([[
  autocmd Filetype ruby map <leader>r :VroomRunTestFile<CR>
  autocmd Filetype ruby map <leader>R :VroomRunNearestTest<CR>
]])

-- ----------------------------------------------------------------------------
-- VIM-MARKDOWN
-- ----------------------------------------------------------------------------
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

-- ----------------------------------------------------------------------------
-- Airline
-- ----------------------------------------------------------------------------
vim.g.airline_theme = 'solarized'
vim.g.airline_solarized_bg = 'dark'
vim.g.airline_powerline_fonts = 1
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'
--
vim.g.airline_symbols = vim.g.airline_symbols or {}
-- vim.g.airline_symbols.space = '\ua0'

-- FZF
-- ----------------------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Files<cr>', { noremap = true })

-- Status line
vim.opt.statusline = "%<%f\\ (%{&ft})\\ %-4(%m%)%=%-19(%3l,%02c%03V%)"


-- ---------------------------------------------------------------------------
-- VARIOUS
-- ---------------------------------------------------------------------------
-- Urlview
vim.api.nvim_set_keymap('n', '<leader>u', ':w | startinsert | term urlview %<cr>', { noremap = true })

-- Spell Check
vim.api.nvim_set_keymap('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>', { noremap = true })
