return {
  'github/copilot.vim',
  enabled = false,
  init = function()
    vim.api.nvim_set_keymap('i', '<M-l>', 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '<C-M-l>', 'copilot#AcceptLine()', { expr = true, noremap = true, silent = true })
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_filetypes = {
      AgenticInput = true,
      dotenv = false,
    }
  end,
}
