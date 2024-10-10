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
vim.opt.backupdir = '~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp'
vim.opt.directory = '~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp'

vim.cmd('filetype off')
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

-- Setup lazy.nvim
require("lazy").setup({
  timeout = 600,
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = false, notify = false },
})

-- Setup lualine
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

-- Setup Copilot
require("copilot").setup {
  filetypes = {
    markdown = true, -- overrides default
    terraform = false, -- disallow specific filetype
    sh = function ()
      if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
        -- disable for .env files
        return false
      end
      return true
    end,
  },
}

-- Neotree
require('neo-tree').setup({
  window = {
    position = "right",
    width = 40,
    mappings = {
      ["o"] = "reveal_in_finder",
    }
  },
  commands = {
    reveal_in_finder = function(state)
      local node = state.tree:get_node()
      local path = node:get_id()
      vim.fn.system("open -R '" .. path .. "'")
    end,
  }
})

vim.api.nvim_set_keymap('n', '<leader>n', ':lua ToggleNeotree()<CR>', { noremap = true, silent = true })

function ToggleNeotree()
    local neotree_wins = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "neo-tree" then
            table.insert(neotree_wins, win)
        end
    end

    if #neotree_wins > 0 then
        vim.cmd("Neotree close")
    else
        vim.cmd("Neotree")
    end
end

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

vim.keymap.set('n', '<leader>R', function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { noremap = true, buffer = 0 })

vim.keymap.set('n', '<leader>r', function()
  require("neotest").run.run()
end, { noremap = true, buffer = 0 })

-- GUI settings
if vim.fn.has("gui_running") == 1 then
  vim.opt.guifont = "Inconsolata:h14"
  vim.opt.wrap = true
  vim.opt.linebreak = true
end

-- COLOR STUFF
require('mini.colors').setup()
vim.cmd('colorscheme base16-gruvbox-light-hard')

if vim.fn.filereadable(vim.fn.expand("~/.vimrc_background")) == 1 then
  vim.g.base16colorspace = 256
  -- vim.env.BAT_THEME = 'Solarized (dark)'
  -- vim.cmd('source ~/.vimrc_background')
end

-- Always show the signcolumn
if vim.fn.has("patch-8.1.1564") == 1 then
  vim.opt.signcolumn = "number"
else
  vim.opt.signcolumn = "yes"
end

-- Mappings
vim.api.nvim_set_keymap('', 'WW', ':w!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true })

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

-- BUFFERS N SHIT, BECAUSE FUCK TABS
vim.api.nvim_set_keymap('n', '<C-l>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':bprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':bp <BAR> bd #<CR>', { noremap = true })

-- CTAGS
vim.api.nvim_set_keymap('n', '<leader>ta', ':exec("tag ".expand("<cword>"))<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ts', ':vsp <CR>:exec("tag " .expand("<cword>"))<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>TT', ':Ctags<CR>', { noremap = true })

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

-- FZF
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>FzfLua files<cr>', { noremap = true })

-- Urlview
vim.api.nvim_set_keymap('n', '<leader>u', ':w | startinsert | term urlview %<cr>', { noremap = true })

-- Spell Check
vim.api.nvim_set_keymap('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>', { noremap = true })
