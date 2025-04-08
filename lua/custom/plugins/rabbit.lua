return {
  'voxelprismatic/rabbit.nvim',
  config = function()
    require('rabbit').setup {
      default_keys = {
        open = { '<leader>R' },
      },
    }
  end,
}
