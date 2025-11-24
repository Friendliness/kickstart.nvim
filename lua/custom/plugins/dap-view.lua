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
          },
          scopes = {
            keymap = '<M-s>',
            label = 'Scopes [M-s]',
            short_label = '󰂥 [M-s]',
          },
          exceptions = {
            keymap = '<M-e>',
            label = 'Exceptions [M-e]',
            short_label = '󰢃 [M-e]',
          },
          watches = {
            keymap = '<M-w>',
            label = 'Watches [M-w]',
            short_label = '󰛐 [M-w]',
          },
          threads = {
            keymap = '<M-t>',
            label = 'Threads [M-t]',
            short_label = '󱉯 [M-t]',
          },
          repl = {
            keymap = '<M-r>',
            label = 'REPL [M-r]',
            short_label = '󰯃 [M-r]',
          },
          sessions = {
            keymap = '<M-k>', -- I ran out of mnemonics
            label = 'Sessions [M-k]',
            short_label = ' [M-k]',
          },
          console = {
            keymap = '<M-c>',
            label = 'Console [M-c]',
            short_label = '󰆍 [M-c]',
          },
        },
      },
    },
  },
}
