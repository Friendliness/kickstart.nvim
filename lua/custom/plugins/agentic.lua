return {
  'carlos-algms/agentic.nvim',
  dependencies = { 'HakonHarnes/img-clip.nvim' },
  event = 'VeryLazy',
  opts = {
    provider = 'opencode-acp', -- or gemini-acp, codex-acp, opencode-acp
    -- provider = 'codex-acp', -- or gemini-acp, codex-acp, opencode-acp
  },

  keys = {
    {
      '<C-\\>',
      function()
        require('agentic').toggle()
      end,
      desc = 'Agentic Open',
      mode = { 'n', 'v', 'i' },
    },

    {
      "<M-'>",
      function()
        require('agentic').add_selection_or_file_to_context()
      end,
      desc = 'Agentic add selection or current file to context',
      mode = { 'n', 'v' },
    },
    {
      '<A-i>r', -- ai Restore
      function()
        require('agentic').restore_session()
      end,
      desc = 'Agentic Restore session',
      silent = true,
      mode = { 'n', 'v', 'i' },
    },
    {
      '<A-i>d', -- ai Diagnostics
      function()
        require('agentic').add_current_line_diagnostics()
      end,
      desc = 'Add current line diagnostic to Agentic',
      mode = { 'n' },
    },
    {
      '<A-i>D', -- ai all Diagnostics
      function()
        require('agentic').add_buffer_diagnostics()
      end,
      desc = 'Add all buffer diagnostics to Agentic',
      mode = { 'n' },
    },
  },
}
