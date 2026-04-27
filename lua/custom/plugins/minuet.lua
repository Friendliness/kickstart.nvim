return {
  'milanglacier/minuet-ai.nvim',
  dependencies = {
    'Saghen/blink.cmp',
  },
  config = function()
    require('minuet').setup {
      virtualtext = {
        auto_trigger_ft = { '*' },
        show_on_completion_menu = true,
        keymap = {
          accept = '<M-l>',
          accept_line = '<M-C-l>',
          prev = '<M-[>',
          next = '<M-]>',
          dismiss = '<C-]>',
        },
      },
      provider = 'openai_fim_compatible',
      n_completions = 3,
      -- I recommend beginning with a small context window size and incrementally
      -- expanding it, depending on your local computing power. A context window
      -- of 512, serves as an good starting point to estimate your computing
      -- power. Once you have a reliable estimate of your local computing power,
      -- you should adjust the context window to a larger value.
      context_window = 512,
      provider_options = {
        openai_fim_compatible = {
          -- For Windows users, TERM may not be present in environment variables.
          -- Consider using APPDATA instead.
          api_key = 'TERM',
          name = 'Ollama',
          end_point = 'http://localhost:11434/v1/completions',
          model = 'qwen2.5-coder:1.5b',
          optional = {
            max_tokens = 128,
            top_p = 0.9,
          },
        },
      },
    }
  end,
}
