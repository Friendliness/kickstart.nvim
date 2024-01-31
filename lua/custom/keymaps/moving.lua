-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move Line Down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move Line Up' })
