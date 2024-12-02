return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>n",
        function()
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
        end,
        desc = "Toggle Neotree",
      },
    },
    config = function()
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
    end
  }
}
