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
        --   chat = {
        --     adapter = 'ollama',
        --     model = 'codellama:34b',
        --   },
        --   inline = {
        --     adapter = 'ollama',
        --     model = 'codellama:34b',
        --   },
        --   cmd = {
        --     adapter = 'ollama',
        --     model = 'codellama:34b',
        --   },
        --   workflow = {
        --     adapter = 'ollama',
        --     model = 'codellama:34b',
        --   },
        -- },
        chat = {
          adapter = 'openai',
          opts = {
            key = '', -- LM Studio doesn't require a key
            host = 'http://localhost:1234/v1', -- LM Studio default
            data = {
              model = 'qwen3.6-35b-a3b',
            },
          },
        },
        inline = {
          adapter = 'openai',
          opts = {
            key = '',
            host = 'http://localhost:1234/v1',
            data = {
              model = 'qwen3.6-35b-a3b',
            },
          },
        },
        cmd = {
          adapter = 'openai',
          opts = {
            key = '',
            host = 'http://localhost:1234/v1',
            data = {
              model = 'qwen3.6-35b-a3b',
            },
          },
        },
        workflow = {
          adapter = 'openai',
          opts = {
            key = '',
            host = 'http://localhost:1234/v1',
            data = {
              model = 'qwen3.6-35b-a3b',
            },
          },
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
