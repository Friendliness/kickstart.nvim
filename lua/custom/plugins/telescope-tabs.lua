return {
  'LukasPietzschmann/telescope-tabs.nvim',
  url = 'https://codeberg.org/LukasPietzschmann/telescope-tabs.git',
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension 'telescope-tabs'
    require('telescope-tabs').setup {}
  end,
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
}
