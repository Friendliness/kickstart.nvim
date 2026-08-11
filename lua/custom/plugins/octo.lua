local octo_repo = nil

-- Runs `Octo <cmd> [repo] [extra]`, inserting the sticky repo (set via <leader>oR) right after the subcommand and before any filter args, since Octo expects `list <owner/repo> <key=value>...` in that order.
local function octo_cmd(cmd, extra)
  return function()
    local parts = { 'Octo', cmd }
    if octo_repo then
      table.insert(parts, octo_repo)
    end
    if extra then
      table.insert(parts, extra)
    end
    vim.cmd(table.concat(parts, ' '))
  end
end

return {
  'pwntester/octo.nvim',
  cmd = 'Octo',
  opts = {
    -- or "fzf-lua" or "snacks" or "default"
    picker = 'telescope',
    -- bare Octo command opens picker of commands
    enable_builtin = true,
  },
  keys = {
    {
      '<leader>oR',
      function()
        vim.ui.input({ prompt = 'Octo repo (owner/repo, empty to clear): ', default = octo_repo or '' }, function(input)
          if input == nil then
            return
          end
          octo_repo = input ~= '' and input or nil
          if octo_repo then
            vim.notify('Octo repo set to ' .. octo_repo, vim.log.levels.INFO)
          else
            vim.notify('Octo repo cleared, using local remote', vim.log.levels.INFO)
          end
        end)
      end,
      desc = 'Set Octo repo',
    },
    {
      '<leader>oi',
      octo_cmd 'issue list',
      desc = 'List GitHub Issues',
    },
    {
      '<leader>op',
      octo_cmd 'pr list',
      desc = 'List GitHub PullRequests',
    },
    {
      '<leader>od',
      octo_cmd 'discussion list',
      desc = 'List GitHub Discussions',
    },
    {
      '<leader>on',
      octo_cmd 'notification list',
      desc = 'List GitHub Notifications',
    },
    {
      '<leader>os',
      function()
        require('octo.utils').create_base_search_command {
          include_current_repo = octo_repo == nil,
          query = octo_repo and ('repo:' .. octo_repo .. ' ') or nil,
        }
      end,
      desc = 'Search GitHub',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- OR "ibhagwan/fzf-lua"
    -- OR "folke/snacks.nvim",
    'nvim-tree/nvim-web-devicons', -- optional if file_panel.icons is a function
  },
}
