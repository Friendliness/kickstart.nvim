-- An idea to modify the find_files default to show hidden files and files ignored by .gitignore
local telescope = require('telescope')
telescope.setup({
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
		}
	}
})
