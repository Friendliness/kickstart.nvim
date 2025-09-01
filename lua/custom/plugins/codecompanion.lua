return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      ft = { 'markdown', 'codecompanion' },
    },
    'ravitemer/mcphub.nvim',
  },
  config = function()
    require('codecompanion').setup {

      show_defaults = false,
      strategies = {
        -- Change the default chat adapter and model
        chat = {
          adapter = 'ollama',
          model = 'codellama:34b',
        },
        inline = {
          adapter = 'ollama',
          model = 'codellama:34b',
        },
        cmd = {
          adapter = 'ollama',
          model = 'codellama:34b',
        },
        workflow = {
          adapter = 'ollama',
          model = 'codellama:34b',
        },
      },
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    }
  end,
}
