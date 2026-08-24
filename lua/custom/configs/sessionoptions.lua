-- Default before was:
-- vim.opt.sessionoptions = {"blank", "buffers", "curdir", "folds", "help", "tabpages","winsize","terminal"}

-- This prevents blank buffers from being saved in the session
-- 'globals' is needed for kulala.nvim's session.restore to work (see lua/custom/plugins/kulala.lua)
vim.opt.sessionoptions = { 'buffers', 'curdir', 'folds', 'help', 'tabpages', 'winsize', 'terminal', 'globals' }
