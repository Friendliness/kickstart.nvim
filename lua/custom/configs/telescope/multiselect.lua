local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local function multiopen(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()

  if not vim.tbl_isempty(multi) then
    actions.close(prompt_bufnr)
    for _, j in pairs(multi) do
      if j.path ~= nil then
        local path = vim.fn.fnameescape(j.path)
        if j.lnum ~= nil then
          vim.cmd(string.format('silent! edit +%d %s', j.lnum, path))
        else
          vim.cmd(string.format('silent! edit %s', path))
        end
      end
    end
  else
    actions.select_default(prompt_bufnr)
  end
end

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<CR>'] = multiopen,
      },
      n = {
        ['<CR>'] = multiopen,
      },
    },
  },
}
