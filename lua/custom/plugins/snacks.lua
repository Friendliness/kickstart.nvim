return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    debug = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = false },
    scope = { enabled = true },
    util = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = false },
    toggle = { enabled = true },
    zen = { enabled = true },
  },
  keys = {
    {
      '<leader>gb',
      function()
        Snacks.gitbrowse()
      end,
      desc = '[G]it [B]rowse, open current file in browser',
    },
    {
      '<leader>zt',
      function()
        Snacks.zen()
      end,
      desc = '[Z]en [T]oggle, toggle Zen mode',
    },
    {
      '<leader>db',
      function()
        Snacks.bufdelete()
      end,
      desc = '[D]elete [B]uffer, delete current buffer',
    },
    {
      '<C-o>',
      function()
        vim.cmd 'wincmd h'
      end,
      mode = 't',
    },
  },
}
