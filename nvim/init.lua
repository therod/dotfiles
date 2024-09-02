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
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

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

-- Status line
-- vim.opt.statusline = "%<%f\\ (%{&ft})\\ %-4(%m%)%=%-19(%3l,%02c%03V%)"

-- Store temporary files in a central spot
vim.opt.backupdir = '~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp'
vim.opt.directory = '~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp'

-- Vroom Configuration
vim.g.vroom_map_keys = 1
vim.g.vroom_use_colors = 1
vim.g.vroom_use_vimux = 1
vim.g.vroom_use_terminal = 0
vim.g.vroom_clear_screen = 0
vim.g.vroom_test_unit_command = 'bin/rails test'
vim.g.vroom_use_bundle_exec = 0

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"ruby"},
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', ':VroomRunTestFile<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>R', ':VroomRunNearestTest<CR>', { noremap = true })
  end
})

-- ACKGrep
vim.g.ackprg = 'ag --vimgrep --smart-case'
vim.cmd([[
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
]])

-- GUI settings
if vim.fn.has("gui_running") == 1 then
  vim.opt.guifont = "Inconsolata:h14"
  vim.opt.wrap = true
  vim.opt.linebreak = true
end

-- Neomake
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"*"},
  command = "Neomake"
})

-- CoC (Conquer of Completion) configuration
vim.opt.updatetime = 300
vim.opt.shortmess:append("c")

-- Always show the signcolumn
if vim.fn.has("patch-8.1.1564") == 1 then
  vim.opt.signcolumn = "number"
else
  vim.opt.signcolumn = "yes"
end

-- Use tab for trigger completion with characters ahead and navigate
local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-space> to trigger completion
vim.keymap.set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- -- Highlight the symbol and its references when holding the cursor
-- vim.api.nvim_create_augroup("CocGroup", {})
-- vim.api.nvim_create_autocmd("CursorHold", {
--     group = "CocGroup",
--     command = "silent call CocActionAsync('highlight')",
--     desc = "Highlight symbol under cursor on CursorHold"
-- })

-- Symbol renaming
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting selected code
vim.keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
vim.keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

-- -- Setup formatexpr specified filetype(s)
-- vim.api.nvim_create_autocmd("FileType", {
--   group = "CocGroup",
--   pattern = "typescript,json",
--   command = "setl formatexpr=CocAction('formatSelected')",
--   desc = "Setup formatexpr specified filetype(s)."
-- })

-- -- Update signature help on jump placeholder
-- vim.api.nvim_create_autocmd("User", {
--   group = "CocGroup",
--   pattern = "CocJumpPlaceholder",
--   command = "call CocActionAsync('showSignatureHelp')",
--   desc = "Update signature help on jump placeholder"
-- })

-- Apply codeAction to the selected region
vim.keymap.set("x", "<leader>a", "<Plug>(coc-codeaction-selected)", {silent = true})
vim.keymap.set("n", "<leader>a", "<Plug>(coc-codeaction-selected)", {silent = true})

-- Remap keys for applying codeActions to the current buffer
vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction)", {silent = true})

-- Apply AutoFix to problem on the current line
vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)", {silent = true})

-- Map function and class text objects
vim.keymap.set("x", "if", "<Plug>(coc-funcobj-i)", {silent = true})
vim.keymap.set("o", "if", "<Plug>(coc-funcobj-i)", {silent = true})
vim.keymap.set("x", "af", "<Plug>(coc-funcobj-a)", {silent = true})
vim.keymap.set("o", "af", "<Plug>(coc-funcobj-a)", {silent = true})
vim.keymap.set("x", "ic", "<Plug>(coc-classobj-i)", {silent = true})
vim.keymap.set("o", "ic", "<Plug>(coc-classobj-i)", {silent = true})
vim.keymap.set("x", "ac", "<Plug>(coc-classobj-a)", {silent = true})
vim.keymap.set("o", "ac", "<Plug>(coc-classobj-a)", {silent = true})

-- Use CTRL-S for selections ranges
vim.keymap.set("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
vim.keymap.set("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})

-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- DEFAULT MAPPINGS
vim.api.nvim_set_keymap('', 'WW', ':w!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true })

if vim.fn.filereadable(vim.fn.expand("~/.vimrc_background")) == 1 then
  vim.g.base16colorspace = 256
  -- vim.env.BAT_THEME = 'Solarized (dark)'
  vim.cmd('source ~/.vimrc_background')
end

-- vim.cmd([[
--   hi! Normal ctermbg=NONE guibg=NONE
--   hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
-- ]])

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

-- FZF
-- ----------------------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Files<cr>', { noremap = true })

-- ---------------------------------------------------------------------------
-- VARIOUS
-- ---------------------------------------------------------------------------
-- Urlview
vim.api.nvim_set_keymap('n', '<leader>u', ':w | startinsert | term urlview %<cr>', { noremap = true })

-- Spell Check
vim.api.nvim_set_keymap('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>', { noremap = true })
