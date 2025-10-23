return {
  {
    'igorlfs/nvim-dap-view',
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = {
      auto_toggle = true,
      winbar = {
        base_sections = {

          breakpoints = {
            keymap = '<M-b>',
            label = 'Breakpoints [M-b]',
            short_label = ' [M-b]',
            action = function()
              require('dap-view.views').switch_to_view 'breakpoints'
            end,
          },
          scopes = {
            keymap = '<M-s>',
            label = 'Scopes [M-s]',
            short_label = '󰂥 [M-s]',
            action = function()
              require('dap-view.views').switch_to_view 'scopes'
            end,
          },
          exceptions = {
            keymap = '<M-e>',
            label = 'Exceptions [M-e]',
            short_label = '󰢃 [M-e]',
            action = function()
              require('dap-view.views').switch_to_view 'exceptions'
            end,
          },
          watches = {
            keymap = '<M-w>',
            label = 'Watches [M-w]',
            short_label = '󰛐 [M-w]',
            action = function()
              require('dap-view.views').switch_to_view 'watches'
            end,
          },
          threads = {
            keymap = '<M-t>',
            label = 'Threads [M-t]',
            short_label = '󱉯 [M-t]',
            action = function()
              require('dap-view.views').switch_to_view 'threads'
            end,
          },
          repl = {
            keymap = '<M-r>',
            label = 'REPL [M-r]',
            short_label = '󰯃 [M-r]',
            action = function()
              require('dap-view.repl').show()
            end,
          },
          sessions = {
            keymap = '<M-k>', -- I ran out of mnemonics
            label = 'Sessions [M-k]',
            short_label = ' [M-k]',
            action = function()
              require('dap-view.views').switch_to_view 'sessions'
            end,
          },
          console = {
            keymap = '<M-c>',
            label = 'Console [M-c]',
            short_label = '󰆍 [M-c]',
            action = function()
              require('dap-view.views').switch_to_view 'console'
            end,
          },
        },
      },
    },
  },
}
