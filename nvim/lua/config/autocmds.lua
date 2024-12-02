-- Set up autocommands
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text" },
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
  pattern = { "ruby", "haml", "eruby", "yaml", "html", "javascript", "sass", "cucumber" },
  callback = function()
    vim.opt_local.ai = true
    vim.opt_local.sw = 2
    vim.opt_local.sts = 2
    vim.opt_local.expandtab = true
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.opt_local.sw = 4
    vim.opt_local.sts = 4
    vim.opt_local.expandtab = true
  end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.sass" },
  command = "setfiletype sass"
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = { "*.md", "*.markdown", "*.md.erb" },
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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.md.erb" },
  command = "set filetype=eruby.markdown"
})

-- Neomake setup
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*",
--   command = "Neomake",
-- })
