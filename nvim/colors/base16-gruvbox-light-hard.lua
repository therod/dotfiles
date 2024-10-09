require('mini.base16').setup({
  palette = {
    base00 = '#f9f5d7', -- Light background
    base01 = '#ebdbb2', -- Light selection
    base02 = '#d5c4a1', -- Light comments
    base03 = '#bdae93', -- Dark foreground
    base04 = '#665c54', -- Medium foreground
    base05 = '#504945', -- Default foreground
    base06 = '#3c3836', -- Light foreground
    base07 = '#282828', -- Dark background (not used in light theme)
    base08 = '#9d0006', -- Red
    base09 = '#af3a03', -- Orange
    base0A = '#b57614', -- Yellow
    base0B = '#79740e', -- Green
    base0C = '#427b58', -- Aqua/Cyan
    base0D = '#076678', -- Blue
    base0E = '#8f3f71', -- Purple
    base0F = '#d65d0e', -- Brown
  },
  use_cterm = true,
  plugins = {
    default = false,
    ['echasnovski/mini.nvim'] = true,
  },
})
