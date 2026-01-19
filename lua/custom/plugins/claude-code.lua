return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  config = true,
  keys = {
    { '<C-,>', '<cmd>ClaudeCodeFocus<cr>', desc = 'Claude Code (Ctrl+,)', mode = { 'n', 'x' } },
    { '<M-,>', '<cmd>ClaudeCodeFocus<cr>', desc = 'Claude Code (Alt+,)', mode = { 'n', 'x' } },
  },
  opts = {
    terminal = {
      snacks_win_opts = {
        keys = {

          -- Multiple ways to hide from terminal mode
          claude_hide_ctrl = {
            '<C-,>',
            function(self)
              self:hide()
            end,
            mode = 't',
            desc = 'Hide (Ctrl+,)',
          },
          claude_hide_alt = {
            '<M-,>',
            function(self)
              self:hide()
            end,
            mode = 't',
            desc = 'Hide (Alt+,)',
          },
          claude_hide_esc = {
            '<C-\\><C-n>',
            function(self)
              self:hide()
            end,
            mode = 't',
            desc = 'Hide (Ctrl+\\)',
          },
        },
      },
    },
  },
}
