return {
  'ravitemer/mcphub.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  build = 'npm install -g mcp-hub@latest',
  config = function()
    require('mcphub').setup {
      config = vim.fn.expand '~/.config/mcphub/servers.json',
      auto_approve = false,
      auto_toggle_mcp_servers = true,
    }
  end,
}
