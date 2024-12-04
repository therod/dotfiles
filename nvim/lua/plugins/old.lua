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
  {
    "tpope/vim-markdown",
    init = function()
      vim.g.markdown_fenced_languages = {'html', 'sql', 'ruby', 'python', 'bash=sh'}
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_new_list_item_indent = 0
      vim.g.vim_markdown_auto_insert_bullets = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_no_extensions_in_markdown = 1
      vim.g.vim_markdown_follow_anchor = 1
      vim.g.vim_markdown_strikethrough = 1
      vim.g.vim_markdown_autowrite = 1
      vim.cmd([[
        autocmd FileType markdown setlocal linebreak
        autocmd FileType markdown set wrap
      ]])
    end,
  },

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
          icon = "",
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
