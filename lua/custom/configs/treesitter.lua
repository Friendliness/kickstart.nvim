require('nvim-treesitter.config').setup {
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
    highlight = {
      enable = true,
    },
  },
}
