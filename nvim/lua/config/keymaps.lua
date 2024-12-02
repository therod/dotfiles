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

-- BUFFERS N SHIT, BECAUSE FUCK TABS
vim.api.nvim_set_keymap('n', '<C-l>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':bprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':bp <BAR> bd #<CR>', { noremap = true })

-- CTAGS
vim.api.nvim_set_keymap('n', '<leader>ta', ':exec("tag ".expand("<cword>"))<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ts', ':vsp <CR>:exec("tag " .expand("<cword>"))<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>TT', ':Ctags<CR>', { noremap = true })

-- Urlview
vim.api.nvim_set_keymap('n', '<leader>u', ':w | startinsert | term urlview %<cr>', { noremap = true })

-- Spell Check
vim.api.nvim_set_keymap('n', '<leader>o', ':setlocal spell! spelllang=en_us<CR>', { noremap = true })
