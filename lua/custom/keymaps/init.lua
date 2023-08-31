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

-- Undotree
keymap('n', '<leader>u', ':UndotreeToggle<CR>', { desc = 'Undotree' })

-- Move lines
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move Line Down' })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move Line Up' })


-- Substitute from register
keymap('n', '<leader>z', '%s/<C-R><C-W>/<C-R>0/g<CR>', { desc = 'Substitue all from register' })
