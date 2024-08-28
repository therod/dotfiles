return {
  -- Core plugins
  { "junegunn/fzf", build = "./install --all" },
  "tpope/vim-commentary",
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "mileszs/ack.vim",

  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
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

  -- Writing
  "junegunn/goyo.vim",
  "reedes/vim-pencil",

  -- Experimental
  "bling/vim-bufferline",
  "scrooloose/nerdtree",
  { "yetone/avante.nvim", branch = "main" },

  "godlygeek/tabular",
  "neomake/neomake",

  { "neoclide/coc.nvim", branch = "release" },
  -- { "rodrigore/coc-tailwind-intellisense", build = "npm install" },

  "ngmy/vim-rubocop",

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
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    opts = {
      -- add any opts here
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      {
        "grapp-dev/nui-components.nvim",
        dependencies = {
          "MunifTanjim/nui.nvim"
        }
      },
      --- The below is optional, make sure to setup it properly if you have lazy=true
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}
