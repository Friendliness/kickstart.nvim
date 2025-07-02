vim.api.nvim_set_keymap('i', '<M-l>', 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
vim.g.copilot_no_tab_map = true
vim.cmd [[autocmd! BufRead,BufNewFile *.env,*.env.*,*.env-* set filetype=dotenv]]
return {
  'github/copilot.vim',
}
