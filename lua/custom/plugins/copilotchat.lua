return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      mappings = {
        reset = {
          normal = '<C-L>',
          insert = '<C-L>',
          callback = function()
            require('CopilotChat').reset()
          end,
        },
      },
      -- See Configuration section for options
    },
  },
}
