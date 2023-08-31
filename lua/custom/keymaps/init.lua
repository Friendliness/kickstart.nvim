local keymap = vim.keymap.set
-- Keymap for toggling the tree - Neo-Tree
keymap('n', '<C-n>', ':Neotree <CR>', { desc = 'Toggle neotree' })

-- Switch between windows

keymap('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Window up' })

-- Buffers Tab
keymap('n', '<Tab>', ':BufferNext<CR>', { desc = 'Next buffer' })
keymap('n', '<S-Tab>', ':BufferPrevious<CR>', { desc = 'Previous buffer' })
keymap('n', '<leader>x', ':BufferClose<CR>', { desc = 'Close buffer' })

-- Lazygit
keymap('n', '<leader>gs', ':LazyGit<CR>', { desc = 'LazyGit' })


-- Move lines
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
