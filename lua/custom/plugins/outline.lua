return {
  'hedyhli/outline.nvim',
  lazy = true,
  cmd = { 'Outline', 'OutlineOpen' },
  keys = { -- Example mapping to toggle outline
    { '<leader>oo', '<cmd>Outline<CR>', desc = 'Toggle outline' },
  },
  opts = {
    outline_window = {
      position = 'left',
    },
  },
}
