local nmap = function(keys, func, desc)
	if desc then
		desc = 'LSP: ' .. desc
	end

	vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end


require("custom.keymaps.buffers")
require("custom.keymaps.centering")
require("custom.keymaps.neotree")
require("custom.keymaps.tmux")
require("custom.keymaps.undotree")
require("custom.keymaps.trouble")
require("custom.keymaps.moving")
require("custom.keymaps.substitution")
require("custom.keymaps.lazygit")
require("custom.keymaps.gosnippet")
