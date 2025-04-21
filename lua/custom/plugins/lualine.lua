return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      theme = 'auto',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_c = {
        'filename',
        {
          function()
            return require('grapple').name_or_index()
          end,
          cond = function()
            return package.loaded['grapple'] and require('grapple').exists()
          end,
        },
      },
    },
  },
}
