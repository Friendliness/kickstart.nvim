-- Buffers Tab
vim.keymap.set('n', '<Tab>', vim.cmd.BufferNext, { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', vim.cmd.BufferPrevious, { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>x', vim.cmd.BufferClose, { desc = 'Close buffer' })
