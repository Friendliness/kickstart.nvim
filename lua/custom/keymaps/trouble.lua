-- Trouble
vim.keymap.set("n", "<leader>tx", function() require("trouble").toggle() end, { desc = 'TroubleToggle' })
vim.keymap.set("n", "<leader>tq", function() require("trouble").toggle("workspace_diagnostics") end,
	{ desc = 'TroubleToggle workspace_diagnostics' })
vim.keymap.set("n", "<leader>tc", function() require("trouble").toggle("document_diagnostics") end,
	{ desc = 'TroubleToggle document_diagnostics' })
vim.keymap.set("n", "<leader>tf", function() require("trouble").toggle("quickfix") end,
	{ desc = 'TroubleToggle quickfix' })
vim.keymap.set("n", "<leader>tl", function() require("trouble").toggle("loclist") end, { desc = 'TroubleToggle loclist' })
vim.keymap.set("n", "<leader>gr", function() require("trouble").toggle("lsp_references") end,
	{ desc = 'TroubleToggle [G]oto lsp_[R]eferences' })
