local M = {}

function M.open_test_alternate()
  local current_file = vim.fn.expand("%")
  local new_file = current_file
  local in_spec = string.match(current_file, "^spec/") ~= nil
  local going_to_spec = not in_spec
  local in_app = string.match(current_file, "controllers") or string.match(current_file, "models") or string.match(current_file, "views")

  if going_to_spec then
    if in_app then
      new_file = new_file:gsub("^app/", "")
    end
    new_file = new_file:gsub(".rb$", "_spec.rb")
    new_file = "spec/" .. new_file
  else
    new_file = new_file:gsub("_spec%.rb$", ".rb")
    new_file = new_file:gsub("^spec/", "")
    if in_app then
      new_file = "app/" .. new_file
    end
  end

  vim.cmd("e " .. new_file)
end

function M.strip_whitespace()
  vim.cmd([[%s/\s\+$//gc]])
end

function M.rename_file()
  local old_name = vim.fn.expand('%')
  local new_name = vim.fn.input('New file name: ', vim.fn.expand('%'), 'file')
  if new_name ~= '' and new_name ~= old_name then
    vim.cmd('saveas ' .. new_name)
    vim.cmd('silent !rm ' .. old_name)
    vim.cmd('redraw!')
  end
end

return M
