return {
  {
    'igorlfs/nvim-dap-view',
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = {
      auto_toggle = true,
      winbar = {
        base_sections = {

          threads = {
            keymap = '<M-t>',
            label = 'Threads [T]',
            short_label = '󱉯 [T]',
            action = function()
              require('dap-view.views').switch_to_view 'threads'
            end,
          },
        },
      },
    },
  },
}
