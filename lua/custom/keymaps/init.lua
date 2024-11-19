local keymap = vim.keymap.set
local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end
-- Keymap for toggling the tree - Neo-Tree
keymap('n', '<C-n>', ':Neotree toggle<CR>', { desc = 'Toggle neotree' })

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
keymap('n', '<leader>lg', vim.cmd.LazyGit, { desc = 'LazyGit' })

-- LazySql
keymap('n', '<leader>ls', vim.cmd.LazySql, { desc = 'LazySql' })

-- Undotree
keymap('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undotree' })

-- Move lines
keymap('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move Line Down' })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move Line Up' })

-- Substitute from register
keymap('n', '<leader>z', '%s/<C-R><C-W>/<C-R>0/g<CR>', { desc = 'Substitue all from register' })

-- Trouble
keymap('n', '<leader>tx', function()
  require('trouble').toggle()
end, { desc = 'TroubleToggle' })
keymap('n', '<leader>tq', function()
  require('trouble').toggle 'workspace_diagnostics'
end, { desc = 'TroubleToggle workspace_diagnostics' })
keymap('n', '<leader>tc', function()
  require('trouble').toggle 'document_diagnostics'
end, { desc = 'TroubleToggle document_diagnostics' })
keymap('n', '<leader>tf', function()
  require('trouble').toggle 'quickfix'
end, { desc = 'TroubleToggle quickfix' })
keymap('n', '<leader>tl', function()
  require('trouble').toggle 'loclist'
end, { desc = 'TroubleToggle loclist' })
keymap('n', '<leader>gr', function()
  require('trouble').toggle 'lsp_references'
end, { desc = 'TroubleToggle [G]oto lsp_[R]eferences' })

-- Go snippets
-- In the future I'll create an actual snippet for this
-- keymap('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>', { desc = 'Go snippet for error handling' })

-- Neogen -
keymap('n', '<leader>nf', ":lua require('neogen').generate()<CR>", { desc = 'Neogen generate' })

-- Yank keymap changes
-- keymap("n", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
-- keymap({ "v", "x" }, '<leader>y', '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
-- keymap({ "n", "v", "x" }, '<leader>yy', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
-- keymap({ "n", "v", "x" }, '<leader>Y', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
-- keymap({ 'n', 'v', 'x' }, '<C-a>', 'gg0vG$', { noremap = true, silent = true, desc = 'Select all' })
-- keymap({ 'n', 'v', 'x' }, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })
-- keymap('i', '<C-p>', '<C-r>+', { noremap = true, silent = true, desc = 'Paste from clipboard from within insert mode' })
keymap('x', '<leader>P', '"_dP', { noremap = true, silent = true, desc = 'Paste over selection without erasing unnamed register' })

-- Format
keymap('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>', { desc = '[F]ormat Buffer' })

-- Telescope
keymap('n', '<leader>si', function()
  require('telescope.builtin').find_files { hidden = true }
end, { desc = '[S]earch h[i]dden files' })
keymap('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })

-- Terminal
keymap('n', '<leader>ot', ':split term://zsh<CR>:resize 10<CR>', { desc = '[O]pen [T]erminal' })
-- Remap escape in the terminal to exit terminal mode
keymap('t', '<Esc>', '<C-\\><C-n><CR>', { desc = 'Escape terminal remap' })

-- Code Screenshots with Silicon
keymap('x', '<leader>cc', ":'<,'>Silicon<CR>", { desc = '[C]apture [C]ode with Silicon' })

-- Persistence keybinds
-- load the session for current directory
keymap('n', '<leader>Ss', function()
  require('persistence').load()
end, { desc = '[S]ession [s]elect current directory' })

-- select a session to load
keymap('n', '<leader>SS', function()
  require('persistence').select()
end, { desc = '[S]ession [S]elect' })

-- load the last session
keymap('n', '<leader>Sl', function()
  require('persistence').load { last = true }
end, { desc = '[S]ession [l]ast' })

-- stop persistence - session won't be saved on exit
keymap('n', '<leader>Sd', function()
  require('persistence').stop()
end, { desc = '[S]ession stop' })
