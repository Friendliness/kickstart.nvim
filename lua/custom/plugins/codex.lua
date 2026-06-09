return {
  'coalio/codex.nvim',
  cmd = {
    'Codex',
    'CodexToggle',
    'CodexResume',
    'CodexSession',
    'CodexFocus',
    'CodexSend',
    'CodexSession',
    'CodexYolo',
    'CodexAdd',
    'CodexMcp',
    'CodexApps',
    'CodexSkills',
  },
  keys = {
    {
      '<leader>co',
      function()
        require('codex').toggle()
      end,
      desc = 'Toggle Codex',
      mode = { 'n', 't' },
    },
    {
      '<leader>cs',
      function()
        vim.cmd 'CodexSend'
      end,
      desc = 'Send selection to Codex',
      mode = { 'n', 'v' },
    },
  },
  opts = {
    backend = 'app_server',
    panel = true,
    width = 0.25,
    track_selection = true,
    app_server = {
      ui = 'terminal',
      auto_start = true,
      open_terminal = true,
      experimental = true,
      dynamic_tools = true,
      enable_features = { 'apps' },
    },
  },
}
