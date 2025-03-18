vim.api.nvim_create_user_command('Dump', function(x)
  vim.cmd(string.format("put =execute('%s')", x.args))
end, {
  nargs = '+',
  desc = 'Dump the output of a command at the cursor position',
})
