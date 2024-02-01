-- Harpoon
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers").new({}, {
		prompt_title = "Harpoon",
		finder = require("telescope.finders").new_table({
			results = file_paths,
		}),
		previewer = conf.file_previewer({}),
		sorter = conf.generic_sorter({}),
	}):find()
end

-- Extension for Telescope split tabs
harpoon:extend({
	UI_CREATE = function(cx)
		vim.keymap.set("n", "<C-v>", function()
			harpoon.ui:select_menu_item({ vsplit = true })
		end, { buffer = cx.bufnr })

		vim.keymap.set("n", "<C-x>", function()
			harpoon.ui:select_menu_item({ split = true })
		end, { buffer = cx.bufnr })

		vim.keymap.set("n", "<C-t>", function()
			harpoon.ui:select_menu_item({ tabedit = true })
		end, { buffer = cx.bufnr })
	end,
})

vim.keymap.set("n", "<leader>Hl", function() harpoon:list():append() end, { desc = "Harpoon [L]ist append" })
vim.keymap.set("n", "<leader>He", function() toggle_telescope(harpoon:list()) end,
	{ desc = "[H]arpoon toggle quick m[e]nu" })


vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "[H]arpoon 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "[H]arpoon 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "[H]arpoon 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "[H]arpoon 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>Hp", function() harpoon:list():prev() end, { desc = "[H]arpoon [p]revious" })
vim.keymap.set("n", "<leader>Hn", function() harpoon:list():next() end, { desc = "[H]arpoon [n]revious" })
