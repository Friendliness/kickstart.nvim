return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    require('treesitter-context').setup {
      enable = true,
      multiwindow = true,
      separator = '─',
    }
  end,
}
