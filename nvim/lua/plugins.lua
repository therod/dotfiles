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
  { "skalnik/vim-vroom" },
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
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({})
    end
  },
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
        once = true,
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
    version = false,
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
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
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  }
}
