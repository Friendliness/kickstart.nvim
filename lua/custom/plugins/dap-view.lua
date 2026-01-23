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
            label = ' Breakpoints',
          },
          scopes = {
            keymap = '<M-s>',
            label = '󰂥 Scopes',
          },
          exceptions = {
            keymap = '<M-e>',
            label = '󰢃  Exceptions',
          },
          watches = {
            keymap = '<M-w>',
            label = '󰛐 Watches',
          },
          threads = {
            keymap = '<M-t>',
            label = '󱉯 Threads',
          },
          repl = {
            keymap = '<M-r>',
            label = '󰯃 REPL',
          },
          sessions = {
            keymap = '<M-k>', -- I ran out of mnemonics
            label = ' Sessions',
          },
          console = {
            keymap = '<M-c>',
            label = '󰆍 Console',
          },
        },
      },
    },
  },
}
