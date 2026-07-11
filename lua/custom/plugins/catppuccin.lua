return {
  'catppuccin/nvim',
  name = 'catppuccin',
  enabled = true,
  priority = 2,

  config = function()
    require('catppuccin').setup {
      transparent_background = true,
      auto_integrations = true,
      custom_highlights = function(colors)
        return {
          MinuetVirtualText = { fg = colors.overlay0 },
        }
      end,
    }
    vim.cmd.colorscheme 'catppuccin-mocha' -- macchiato
    vim.cmd.hi 'Comment gui=none'
  end,
}
