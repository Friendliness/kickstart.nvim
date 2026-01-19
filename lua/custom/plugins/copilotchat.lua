return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      -- See Configuration section for options
    },
    config = function(_, opts)
      require('CopilotChat').setup {
        mappings = {
          reset = {
            normal = '<C-L>',
            insert = '<C-L>',
            callback = function()
              require('CopilotChat').reset()
            end,
          },
        },
      }
    end,
  },
}
