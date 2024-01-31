-- Substitute from register
vim.keymap.set('n', '<leader>z', '%s/<C-R><C-W>/<C-R>0/g<CR>', { desc = 'Substitue all from register' })
