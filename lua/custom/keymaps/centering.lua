-- Always center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center after moving down half a page' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center after moving up half a page' })
vim.keymap.set('n', 'G', 'Gzz', { desc = 'Center after moving to the bottom of a page' })
