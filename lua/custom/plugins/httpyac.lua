return {
  {
    'abidibo/nvim-httpyac',
    ft = 'http',
    opts = {
      output_view = 'vertical',
    },
    keys = {
      { '<leader>Ha', '<cmd>NvimHttpYacAll<CR>', desc = 'HTTPYac: run all requests', ft = 'http' },
      { '<leader>Hs', '<cmd>NvimHttpYac<CR>', desc = 'HTTPYac: run request', ft = 'http' },
      { '<leader>He', '<cmd>NvimHttpYacEnv<CR>', desc = 'HTTPYac: select environment', ft = 'http' },
    },
  },
}
