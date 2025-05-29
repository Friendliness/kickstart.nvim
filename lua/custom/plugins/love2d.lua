return {
  'S1M0N38/love2d.nvim',
  event = 'VeryLazy',
  opts = { path_to_love_bin = '~/Appimages/love-11.5-x86_64.AppImage' },
  keys = {
    { '<leader>v', ft = 'lua', desc = 'LÖVE' },
    { '<leader>vv', '<cmd>LoveRun<cr>', ft = 'lua', desc = 'Run LÖVE' },
    { '<leader>vs', '<cmd>LoveStop<cr>', ft = 'lua', desc = 'Stop LÖVE' },
  },
}
