return {
  -- Core plugins
  { "junegunn/fzf", build = "./install --all" },
  "tpope/vim-commentary",
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "mileszs/ack.vim",

  -- Utility plugins
  "benmills/vimux",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "mattn/gist-vim",
  "mattn/webapi-vim",

  -- Ruby & Rails
  "skalnik/vim-vroom",
  "vim-ruby/vim-ruby",
  "tpope/vim-rails",
  "tpope/vim-endwise",

  -- HTML, CSS & Others
  "kchmck/vim-coffee-script",
  "othree/html5.vim",
  "digitaltoad/vim-jade",

  -- Javascript
  "pangloss/vim-javascript",
  "leafgarland/typescript-vim",

  -- Markdown
  "tpope/vim-markdown",
  "duwanis/tomdoc.vim",

  -- Experimental
  "scrooloose/nerdtree",
  "neomake/neomake",

  { "aduros/ai.vim", branch = "main" },
  { 'echasnovski/mini.base16', version = false },
  { 'echasnovski/mini.colors', version = false },
  { "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },
  { "github/copilot.vim",
    branch = "release",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      vim.api.nvim_create_autocmd("InsertEnter", {
        callback = function()
          vim.cmd("Copilot auth")
        end,
        once = true, -- to ensure it runs only once
      })
    end,
  },
  { 'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  { "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  { "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  }
}
