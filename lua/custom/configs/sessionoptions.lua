-- Default before was:
-- vim.opt.sessionoptions = {"blank", "buffers", "curdir", "folds", "help", "tabpages","winsize","terminal"}

-- This prevents blank buffers from being saved in the session
vim.opt.sessionoptions = { 'buffers', 'curdir', 'folds', 'help', 'tabpages', 'winsize', 'terminal' }
