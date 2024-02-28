return {
  'Mofiqul/dracula.nvim',
  name = 'dracula',
  priority = 1,
  config = function()
    require('dracula').setup {
      transparent_bg = true,
    }
    vim.cmd.colorscheme 'dracula'
    vim.cmd.hi 'Comment gui=none'
  end,
}
