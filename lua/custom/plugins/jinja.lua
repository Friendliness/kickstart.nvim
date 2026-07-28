-- additional filetypes
-- Neovim's builtin filetype detection only maps the `.jinja` extension by
-- default; `.jinja2` and `.j2` are just as common and go unrecognized.
vim.filetype.add {
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',

    -- `.html` files sometimes hold Jinja/Django tags (`{{ }}` / `{% %}`)
    -- inline. The plain `html` parser/LSPs don't understand that syntax and
    -- garble everything after the first tag, so detect it and switch to
    -- `htmldjango`, which has a dedicated treesitter grammar that parses the
    -- tags natively and injects `html` for the rest.
    html = function(_path, bufnr)
      for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
        if line:find('{{', 1, true) or line:find('{%', 1, true) then
          return 'htmldjango'
        end
      end
      return 'html'
    end,
  },
}

return {}
