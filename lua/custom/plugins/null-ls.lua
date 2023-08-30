return {
  'jose-elias-alvarez/null-ls.nvim',
  name = 'null-ls',
  opts = function()
    local null_ls = require('null-ls')
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    return {
      sources = {
        formatting.black
      }
    }
  end
}
