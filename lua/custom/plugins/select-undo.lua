return {
  'SunnyTamang/select-undo.nvim',
  opts = {},
  config = function()
    require('select-undo').setup {
      line_mapping = 'zu', -- Step a undo mapping (frees gu for lowercasing)
      sweep_mapping = 'zU', -- Sweep b undo mapping (frees gU for uppercasing)
      partial_mapping = 'zcu', -- Partial d undo mapping
    }
  end,
}
