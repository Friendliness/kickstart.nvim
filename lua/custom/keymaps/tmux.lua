-- Switch between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })

-- Tmux Navigator Support
vim.keymap.set('n', '<C-h>', vim.cmd.TmuxNavigateLeft, { desc = 'Window left' })
vim.keymap.set('n', '<C-l>', vim.cmd.TmuxNavigateRight, { desc = 'Window right' })
vim.keymap.set('n', '<C-j>', vim.cmd.TmuxNavigateDown, { desc = 'Window down' })
vim.keymap.set('n', '<C-k>', vim.cmd.TmuxNavigateUp, { desc = 'Window up' })
