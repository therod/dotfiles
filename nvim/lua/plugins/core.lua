return {
  -- Core plugins
  { "junegunn/fzf", build = "./install --all" },
  { "tpope/vim-commentary" },
  { "tpope/vim-eunuch" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "mileszs/ack.vim" },

  -- Utility plugins
  { "benmills/vimux" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "mattn/gist-vim" },
  { "mattn/webapi-vim" },

  -- Ruby & Rails
  { "vim-ruby/vim-ruby" },
  { "tpope/vim-rails" },
  { "tpope/vim-endwise" },

  -- HTML, CSS & Others
  { "othree/html5.vim" },

  -- Javascript
  { "pangloss/vim-javascript" },
  { "leafgarland/typescript-vim" },

  -- Markdown
  { "tpope/vim-markdown" },
  { "duwanis/tomdoc.vim" },

  -- Experimental
  { "imsnif/kdl.vim" },
  { "neomake/neomake" },
  {
    "folke/tokyonight.nvim",
    lazy = false,  -- Keep this false to load immediately
    priority = 1000,
    config = function()
      -- Load and configure the colorscheme
      require("tokyonight").setup({
          -- your custom config here
      })
    end
  },
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {"tokyonight-storm", "tokyonight-day"},
        livePreview = true,
        defaultTheme = "tokyonight-storm"
      })
    end
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({})
      require("legendary").keymaps({
        {
          itemgroup = "fzf-lua",
          icon = "fzf",
          description = "Fuzzy Search",
          keymaps = {
            {
              '<C-p>',
              '<cmd>FzfLua files<cr>',
              description = 'Fuzzy search files',
              mode = { 'n' }
            }
          },
        },
      })
    end
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
  }
}
