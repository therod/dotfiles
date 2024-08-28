-- Set up autocommands
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"text"},
  callback = function()
    vim.opt_local.textwidth = 78
  end
})

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"ruby", "haml", "eruby", "yaml", "html", "javascript", "sass", "cucumber"},
  callback = function()
    vim.opt_local.ai = true
    vim.opt_local.sw = 2
    vim.opt_local.sts = 2
    vim.opt_local.expandtab = true
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"python"},
  callback = function()
    vim.opt_local.sw = 4
    vim.opt_local.sts = 4
    vim.opt_local.expandtab = true
  end
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.sass"},
  command = "setfiletype sass"
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = {"*.md", "*.markdown", "*.md.erb"},
  callback = function()
    vim.opt_local.ai = true
    vim.opt_local.formatoptions = "tcroqn2"
    vim.opt_local.comments = "n:>"
    vim.opt_local.number = true
    vim.opt_local.textwidth = 80
    vim.opt_local.wrapmargin = 0
    vim.opt_local.linebreak = true
    vim.opt_local.wrap = true
  end
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.md.erb"},
  command = "set filetype=eruby.markdown"
})

vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg = "red" })
vim.cmd([[
  au ColorScheme * highlight ExtraWhitespace guibg=red
  au BufEnter * match ExtraWhitespace /\s\+$/
  au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertLeave * match ExtraWhiteSpace /\s\+$/
]])

-- Key mappings
vim.keymap.set('n', 'WW', ':w!<CR>', { noremap = true })
vim.keymap.set('n', 'Q', 'gqap', { noremap = true })
vim.keymap.set('v', 'Q', 'gq', { noremap = true })
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
vim.keymap.set('v', 'j', 'gj', { noremap = true })
vim.keymap.set('v', 'k', 'gk', { noremap = true })
vim.keymap.set('n', '<Down>', 'gj', { noremap = true })
vim.keymap.set('n', '<Up>', 'gk', { noremap = true })
vim.keymap.set('v', '<Down>', 'gj', { noremap = true })
vim.keymap.set('v', '<Up>', 'gk', { noremap = true })
vim.keymap.set('i', '<Down>', '<C-o>gj', { noremap = true })
vim.keymap.set('i', '<Up>', '<C-o>gk', { noremap = true })

vim.keymap.set('c', '%%', "<C-R>=expand('%:h').'/'<cr>", { noremap = true })
vim.keymap.set('n', '<leader>e', ':edit %%', { noremap = true })
vim.keymap.set('n', '<leader>V', ':view %%', { noremap = true })

vim.keymap.set('n', '<leader>N', ":Ag --ignore-dir=log 'TODO\\|FIXME\\|CHANGED\\|NOTE' *<CR>", { noremap = true })

-- Buffer management
vim.keymap.set('n', '<C-t>', ':enew<CR>', { noremap = true })
vim.keymap.set('n', '<C-l>', ':bnext<CR>', { noremap = true })
vim.keymap.set('n', '<C-h>', ':bprevious<CR>', { noremap = true })
vim.keymap.set('n', '<leader>x', ':bp <BAR> bd #<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bl', ':ls<CR>', { noremap = true })

-- Commentary
vim.keymap.set('n', '\\\\', ':Commentary<CR>', { noremap = true })
vim.keymap.set('v', '\\\\', ':Commentary<CR>', { noremap = true })

-- RI Documentation lookup
vim.keymap.set('n', ',di', ':call ri#OpenSearchPrompt(0)<cr>', { noremap = true })
vim.keymap.set('n', ',DI', ':call ri#OpenSearchPrompt(1)<cr>', { noremap = true })
vim.keymap.set('n', ',DK', ':call ri#LookupNameUnderCursor()<cr>', { noremap = true })

-- Clear search buffer
vim.keymap.set('n', '<CR>', ':nohlsearch<cr>', { noremap = true })

-- Toggle 'set list'
vim.keymap.set('n', '<leader>l', ':set list!<cr>', { noremap = true })

-- Goyo & Pencil
vim.keymap.set('n', '<F10>', ':Goyo <bar> :TogglePencil <CR>', { noremap = true })
vim.keymap.set('n', '<F9>', ':setlocal spell! spelllang=en_us<CR>', { noremap = true })

-- FZF
vim.keymap.set('n', '<C-p>', ':FZF<CR>')

-- NERDTree
vim.g.NERDTreeMinimalMenu = 1
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>')

-- Functions
vim.keymap.set('n', '<leader>.', ':lua require("utils").open_test_alternate()<CR>')
vim.keymap.set('n', '<leader>s', ':lua require("utils").strip_whitespace()<CR>')
vim.keymap.set('n', '<leader>n', ':lua require("utils").rename_file()<CR>')

-- Plugin configurations
vim.g.vroom_use_colors = 1
vim.g.vroom_use_vimux = 1
vim.g.vroom_map_keys = 0
vim.g.vroom_clear_screen = 0
vim.g.vroom_use_bundle_exec = 0
vim.g.vroom_test_unit_command = 'bin/rails test'

vim.g.NERDTreeMinimalMenu = 1

vim.g.ackprg = 'ag --vimgrep --smart-case'

-- Neomake setup
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  command = "Neomake",
})

-- CoC setup
require('coc-config')

-- Color configuration
if vim.fn.has("nvim") == 1 then
  vim.opt.termguicolors = true
end

-- Load colorscheme
vim.g.base16colorspace = 256
local colors_name = vim.g.colors_name or ''
if colors_name ~= 'base16-eighties' then
  vim.cmd('colorscheme base16-eighties')
end
-- vim.cmd([[colorscheme base16-default-dark]])
