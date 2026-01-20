local toggle_key = '<M-,>'
return {
  'coder/claudecode.nvim',
  dependencies = {
    'folke/snacks.nvim',
    keys = {
      { '<A-h>', '<cmd>TmuxNavigateLeft<cr>', mode = 't' },
      { '<A-l>', '<cmd>TmuxNavigateRight<cr>', mode = 't' },
    },
  },
  config = true,
  keys = {
    { '<C-,>', '<cmd>ClaudeCodeFocus<cr>', desc = 'Claude Code (Ctrl+,)', mode = { 'n', 'x' } },
    { toggle_key, '<cmd>ClaudeCodeFocus<cr>', desc = 'Claude Code (Alt+,)', mode = { 'n', 'x' } },
  },
  opts = {
    terminal = {
      snacks_win_opts = {
        keys = {
          claude_hide = {
            toggle_key,
            function(self)
              self:hide()
            end,
            mode = 't',
            desc = 'Hide',
          },

          -- Multiple ways to hide from terminal mode
          claude_hide_ctrl = {
            '<C-,>',
            function(self)
              self:hide()
            end,
            mode = 't',
            desc = 'Hide (Ctrl+,)',
          },
          claude_hide_esc = {
            '<C-\\><C-n>',
            function(self)
              self:hide()
            end,
            mode = 't',
            desc = 'Hide (Ctrl+\\)',
          },

          -- TmuxNavigate keybindings
          tmux_left_ctrl = {
            '<C-h>',
            function()
              vim.cmd('TmuxNavigateLeft')
            end,
            mode = 't',
            desc = 'Navigate Left (Ctrl+h)',
          },
          tmux_right_ctrl = {
            '<C-l>',
            function()
              vim.cmd('TmuxNavigateRight')
            end,
            mode = 't',
            desc = 'Navigate Right (Ctrl+l)',
          },
          tmux_down_ctrl = {
            '<C-j>',
            function()
              vim.cmd('TmuxNavigateDown')
            end,
            mode = 't',
            desc = 'Navigate Down (Ctrl+j)',
          },
          tmux_up_ctrl = {
            '<C-k>',
            function()
              vim.cmd('TmuxNavigateUp')
            end,
            mode = 't',
            desc = 'Navigate Up (Ctrl+k)',
          },
        },
      },
    },
  },
}
