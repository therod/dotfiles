return {
  -- Core plugins
  { "junegunn/fzf", build = "./install --all" },
  "junegunn/fzf.vim",
  "tpope/vim-commentary",
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "mileszs/ack.vim",
  -- "vim-airline/vim-airline",
  -- "vim-airline/vim-airline-themes",
  "ryanoasis/vim-devicons",

  -- Utility plugins
  "benmills/vimux",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "mattn/gist-vim",
  "mattn/webapi-vim",

  -- PULLE
  "rizzatti/funcoo.vim",
  "rizzatti/dash.vim",
  "t9md/vim-ruby-xmpfilter",
  "AndrewRadev/splitjoin.vim",

  -- Ruby & Rails
  "skalnik/vim-vroom",
  "vim-ruby/vim-ruby",
  "tpope/vim-rails",
  "danchoi/ri.vim",
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

  -- Colorscheme
  "chriskempson/base16-vim",

  -- Experimental
  "scrooloose/nerdtree",

  -- "godlygeek/tabular",
  "neomake/neomake",

  -- { "neoclide/coc.nvim", branch = "release" },
  -- { "rodrigore/coc-tailwind-intellisense", build = "NODE_OPTIONS=--openssl-legacy-provider npm install" },

  -- "ngmy/vim-rubocop",

  { "aduros/ai.vim", branch = "main" },
  {
    "github/copilot.vim",
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
  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      -- suggested keymap
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  }
}
