return {
  'michaelrommel/nvim-silicon',
  lazy = true,
  cmd = 'Silicon',
  config = function()
    require('silicon').setup {
      -- Configuration here, or leave empty to use defaults
      font = 'Hack=34',
      to_clipboard = true,
      output = function()
        return '~/Pictures/code-screenshots/' .. os.date '!%Y-%m-%dT%H-%M-%S' .. '_code.png'
      end,
    }
  end,
}
