return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1001,

  config = function()
    require('catppuccin').setup {
      transparent_background = true,
      auto_integrations = true,
    }
    vim.cmd.colorscheme 'catppuccin-mocha' -- macchiato
    vim.cmd.hi 'Comment gui=none'
  end,
}
