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
          display_count = false, -- Show diagnostic count instead of messages when cursor not on line
        },
        multilines = {
          -- Needed so diagnostics render on every line, not just the cursor's line.
          -- display_count only takes effect when this is true.
          enabled = true,
          -- Keep the dot/count visible even when the cursor is on a diagnostic line
          always_show = true,
        },
        -- Keep the cursor line's error message on a single line instead of wrapping
        overflow = {
          mode = 'oneline',
        },
      },
    }
    vim.diagnostic.config { virtual_text = false } -- Disable Neovim's default virtual text diagnostics
  end,
}
