-- Some colorschemes (like Dracula) set a fg color for diff highlights, but it messes with treesitter highlights
-- So we set the bg color so the text colors keep their highlighting
local function apply_diff_highlights()
  vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#1f3327' })
  vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#332f1f' })
  vim.api.nvim_set_hl(0, 'DiffText', { bg = '#544d26', bold = true })
  vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#3a2020', fg = '#6272a4' })
end

-- This file loads after lazy.setup(), so the colorscheme has already been set
-- We apply immediately here to make sure it's overridden
apply_diff_highlights()

vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('CustomDiffHighlights', { clear = true }),
  callback = apply_diff_highlights,
})
