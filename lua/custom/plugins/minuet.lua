return {
  'milanglacier/minuet-ai.nvim',
  init = function()
    vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
      group = vim.api.nvim_create_augroup('minuet-dotenv', { clear = true }),
      pattern = { '*.env', '*.env.*', '*.env-*', '.env*', '*.env*' },
      callback = function(args)
        vim.bo[args.buf].filetype = 'dotenv'
      end,
    })
  end,
  config = function()
    require('minuet').setup {
      virtualtext = {
        auto_trigger_ft = { '*' },
        auto_trigger_ignore_ft = { 'dotenv' },
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
      -- One request per completion keeps local inference responsive.
      n_completions = 1,
      -- Minuet measures context in characters, not tokens.
      context_window = 2048,
      provider_options = {
        openai_fim_compatible = {
          -- Ollama needs no authentication; Minuet requires a nonempty placeholder.
          api_key = function()
            return 'ollama'
          end,
          name = 'Ollama',
          end_point = 'http://127.0.0.1:11434/v1/completions',
          model = 'qwen2.5-coder:7b-base',
          optional = {
            max_tokens = 128,
            top_p = 0.9,
          },
        },
      },
    }
  end,
}
