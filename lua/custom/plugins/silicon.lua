return {
  'michaelrommel/nvim-silicon',
  lazy = true,
  cmd = 'Silicon',
  config = function()
    require('nvim-silicon').setup {
      -- Configuration here, or leave empty to use defaults
      font = 'Hack=34',
      theme = 'Dracula',
      no_window_controls = true,
      to_clipboard = true,
      window_title = function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ':t')
      end,
      output = function()
        return '~/Pictures/code-screenshots/' .. os.date '!%Y-%m-%dT%H-%M-%S' .. '_code.png'
      end,
    }
  end,
}
