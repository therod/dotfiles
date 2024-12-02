-- Set the global namespace
_G.rod = {}

---Check if a certain feature/version/commit exists in nvim
---@param feature string
---@return boolean
function rod.has(feature)
  return vim.fn.has(feature) > 0
end

rod.nightly = rod.has("nvim-0.11")

local terminals = {}

---Determine if you're on an external monitor
---@return boolean
function rod.on_big_screen()
  return vim.o.columns > 150 and vim.o.lines >= 40
end
