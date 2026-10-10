return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
  config = function()
    local npairs = require 'nvim-autopairs'
    npairs.setup {}
    local Rule = require 'nvim-autopairs.rule'
    npairs.add_rules {
      Rule('{', '};', 'nix'),
    }
  end,
}
