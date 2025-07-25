return {
  {
    "stevearc/oil.nvim", -- File manager
    opts = {
      default_file_explorer = false,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      float = {
        border = "none",
      },
      is_always_hidden = function(name, bufnr)
        return name == ".."
      end,
      keymaps = {
        ["<C-c>"] = false,
        ["q"] = "actions.close",
        [">"] = "actions.toggle_hidden",
        ["<C-y>"] = "actions.copy_entry_path",
        ["gd"] = {
          desc = "Toggle detail view",
          callback = function()
            local oil = require("oil")
            local config = require("oil.config")
            if #config.columns == 1 then
              oil.set_columns({ "icon", "permissions", "size", "mtime" })
            else
              oil.set_columns({ "icon" })
            end
          end,
        },
      },
      buf_options = {
        buflisted = false,
      },
    },
    keys = {
      {
        "_",
        function()
          -- Stop me being dumb and opening a file explorer in openai.nvim
          if vim.bo.buftype ~= "acwrite" then
            require("oil").toggle_float(vim.fn.getcwd())
          end
        end,
        desc = "Oil.nvim: Open File Explorer",
      },
      {
        "-",
        function()
          -- Stop me being dumb and opening a file explorer in openai.nvim
          if vim.bo.buftype ~= "acwrite" then
            require("oil").toggle_float()
          end
        end,
        desc = "Oil.nvim: Open File Explorer to current file",
      },
    },
  },
  {
    "stevearc/aerial.nvim", -- Toggled list of classes, methods etc in current file
    opts = {
      attach_mode = "global",
      close_on_select = true,
      layout = {
        min_width = 30,
        default_direction = "prefer_left",
      },
      -- Use nvim-navic icons
      icons = {
        File = "󰈙 ",
        Module = " ",
        Namespace = "󰌗 ",
        Package = " ",
        Class = "󰌗 ",
        Method = "󰆧 ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = "󰕘",
        Interface = "󰕘",
        Function = "󰊕 ",
        Variable = "󰆧 ",
        Constant = "󰏿 ",
        String = "󰀬 ",
        Number = "󰎠 ",
        Boolean = "◩ ",
        Array = "󰅪 ",
        Object = "󰅩 ",
        Key = "󰌋 ",
        Null = "󰟢 ",
        EnumMember = " ",
        Struct = "󰌗 ",
        Event = " ",
        Operator = "󰆕 ",
        TypeParameter = "󰊄 ",
      },
    },
    keys = {
      { "<leader>i", "<cmd>AerialToggle<CR>", mode = { "n", "x", "o" }, desc = "Aerial Toggle" },
    },
  },
  {
    "folke/todo-comments.nvim", -- Highlight and search for todo comments within the codebase
    event = "BufEnter",
    keys = {
      { "<Leader>t", "<cmd>TodoTelescope<CR>", desc = "Todo comments" },
    },
    opts = {
      signs = false,
      highlight = {
        keyword = "bg",
      },
      keywords = {
        FIX = { icon = " " }, -- Custom fix icon
      },
    },
  },
}
