-- Make all folds use treesitter
vim.opt.foldenable = true
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 999

-- CSV tables do not need syntax folds, which can be costly on large buffers.
vim.api.nvim_create_autocmd({ 'FileType', 'BufWinEnter' }, {
  group = vim.api.nvim_create_augroup('csv-manual-folds', { clear = true }),
  callback = function(args)
    if vim.bo[args.buf].filetype == 'csv' then
      vim.wo.foldmethod = 'manual'
    end
  end,
})
