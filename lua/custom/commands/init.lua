vim.api.nvim_create_user_command('Dump', function(x)
  vim.cmd(string.format("put =execute('%s')", x.args))
end, {
  nargs = '+',
  desc = 'Dump the output of a command at the cursor position',
})

-- Automatically toggle relative line numbers based on mode
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*',
  callback = function(ev)
    if string.match(ev.match, '.*:i') then
      vim.opt.relativenumber = false
    elseif string.match(ev.match, '.*:n') then
      vim.opt.relativenumber = true
    end
  end,
})
