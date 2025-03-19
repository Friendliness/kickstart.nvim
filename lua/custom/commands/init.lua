vim.api.nvim_create_user_command('Dump', function(x)
  vim.cmd(string.format("put =execute('%s')", x.args))
end, {
  nargs = '+',
  desc = 'Dump the output of a command at the cursor position',
})

vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*.py',
  callback = function()
    -- Makes the folds opened by default
    vim.opt_local.foldenable = true
    vim.opt_local.foldmethod = 'indent'
    vim.opt_local.foldlevel = 99
  end,
})
