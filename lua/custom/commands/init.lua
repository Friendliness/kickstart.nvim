-- Custom command to dump the output of any command at the cursor position
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

-- Filter the quickfix list based on a pattern
vim.api.nvim_create_user_command('QfFilter', function(opts)
  local pattern = opts.args
  local qf = vim.fn.getqflist()
  local filtered = vim.tbl_filter(function(item)
    return string.match(item.text, pattern) ~= nil
  end, qf)
  vim.fn.setqflist(filtered, 'r')
end, { nargs = 1, desc = 'Filter quickfix list by pattern' })
