return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  priority = 1000,
  config = function()
    require('tiny-inline-diagnostic').setup {
      -- Filetypes where the plugin starts disabled - toggle back on with <leader>dl
      disabled_ft = { 'markdown' },
      options = {
        add_messages = {
          display_count = true,
        },
        multilines = {
          enabled = true,
          -- Always show the dot/count on every diagnostic line
          always_show = true,
        },
      },
    }
    vim.diagnostic.config { virtual_text = false } -- Disable Neovim's default virtual text diagnostics
  end,
}
