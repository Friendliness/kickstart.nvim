local keymap = vim.keymap.set
local nmap = function(keys, func, desc)
	if desc then
		desc = 'LSP: ' .. desc
	end

	vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end
-- Keymap for toggling the tree - Neo-Tree
keymap('n', '<C-n>', ":Neotree toggle<CR>", { desc = 'Toggle neotree' })

-- Always center
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Center after moving down half a page' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Center after moving up half a page' })
keymap('n', 'G', 'Gzz', { desc = 'Center after moving to the bottom of a page' })

-- Switch between windows
keymap('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Window up' })

-- Tmux Navigator Support
keymap('n', '<C-h>', vim.cmd.TmuxNavigateLeft, { desc = 'Window left' })
keymap('n', '<C-l>', vim.cmd.TmuxNavigateRight, { desc = 'Window right' })
keymap('n', '<C-j>', vim.cmd.TmuxNavigateDown, { desc = 'Window down' })
keymap('n', '<C-k>', vim.cmd.TmuxNavigateUp, { desc = 'Window up' })


-- Buffers Tab
keymap('n', '<Tab>', vim.cmd.BufferNext, { desc = 'Next buffer' })
keymap('n', '<S-Tab>', vim.cmd.BufferPrevious, { desc = 'Previous buffer' })
keymap('n', '<leader>x', vim.cmd.BufferClose, { desc = 'Close buffer' })

-- Lazygit
keymap('n', '<leader>gs', vim.cmd.LazyGit, { desc = 'LazyGit' })

-- Undotree
keymap('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree' })

-- Move lines
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move Line Down' })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move Line Up' })


-- Substitute from register
keymap('n', '<leader>z', '%s/<C-R><C-W>/<C-R>0/g<CR>', { desc = 'Substitue all from register' })

-- Trouble
keymap("n", "<leader>tx", function() require("trouble").toggle() end, { desc = 'TroubleToggle' })
keymap("n", "<leader>tq", function() require("trouble").toggle("workspace_diagnostics") end,
	{ desc = 'TroubleToggle workspace_diagnostics' })
keymap("n", "<leader>tc", function() require("trouble").toggle("document_diagnostics") end,
	{ desc = 'TroubleToggle document_diagnostics' })
keymap("n", "<leader>tf", function() require("trouble").toggle("quickfix") end, { desc = 'TroubleToggle quickfix' })
keymap("n", "<leader>tl", function() require("trouble").toggle("loclist") end, { desc = 'TroubleToggle loclist' })
keymap("n", "<leader>gr", function() require("trouble").toggle("lsp_references") end,
	{ desc = 'TroubleToggle [G]oto lsp_[R]eferences' })


-- Go snippets
-- keymap("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { desc = "Go snippet for error handling" })


-- Neogen -
keymap("n", "<leader>nf", ":lua require('neogen').generate()<CR>", { desc = "Neogen generate" })


-- Yank keymap changes
-- keymap("n", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
-- keymap({ "v", "x" }, '<leader>y', '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
-- keymap({ "n", "v", "x" }, '<leader>yy', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
-- keymap({ "n", "v", "x" }, '<leader>Y', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
keymap({ "n", "v", "x" }, '<C-a>', 'gg0vG$', { noremap = true, silent = true, desc = 'Select all' })
-- keymap({ 'n', 'v', 'x' }, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })
-- keymap('i', '<C-p>', '<C-r>+', { noremap = true, silent = true, desc = 'Paste from clipboard from within insert mode' })
-- keymap("x", "<leader>P", '"_dP',
-- 	{ noremap = true, silent = true, desc = 'Paste over selection without erasing unnamed register' })


-- Telescope
keymap('n', '<leader>si', function()
		require('telescope.builtin').find_files({ hidden = true })
	end,
	{ desc = '[S]earch h[i]dden files' })
