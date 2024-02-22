-- An idea to modify the find files default to show hidden files
local telescope = require('telescope')
telescope.setup({
	pickers = {
		find_files = {
			hidden = true
		}
	}
})
