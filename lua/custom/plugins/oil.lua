return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      keymaps = {
        ['<C-h>'] = false,
        ['<M-h>'] = 'actions.select_split',
        ['<C-l>'] = false,
        ['<M-l>'] = 'actions.refresh',
      },
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
    }
  end,
}
