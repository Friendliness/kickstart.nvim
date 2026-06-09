return {
  'Cannon07/code-preview.nvim',

  config = function()
    require('code-preview').setup {
      diff = {
        layout = 'tab', -- or "vsplit" / "inline"
      },
      neo_tree = {
        reveal = false,
      },
    }
  end,
}
