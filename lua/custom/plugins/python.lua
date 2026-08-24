return {
  ---@module 'python'
  {
    'joshzcold/python.nvim',
    dependencies = {
      { 'mfussenegger/nvim-dap' },
      { 'mfussenegger/nvim-dap-python' },
      { 'neovim/nvim-lspconfig' },
      { 'L3MON4D3/LuaSnip' },
      { 'nvim-neotest/neotest' },
      { 'nvim-neotest/neotest-python' },
    },
    ---@type python.Config
    opts = { ---@diagnostic disable-line: missing-fields`
      -- Should return a list of tables with a `name` and a `path` entry each.
      -- Gets the argument `venvs_path` set below.
      -- By default just lists the entries in `venvs_path`.
      ---@return VEnv[]
      get_venvs = function(venvs_path)
        return require('python.venv').get_venvs(venvs_path)
      end,
      -- Path for venvs picker
      venvs_path = vim.fn.expand '~/.virtualenvs',
      -- Something to do after setting an environment
      post_set_venv = nil,
      -- base path for creating new venvs
      auto_create_venv_path = function(parent_dir)
        return vim.fs.joinpath(parent_dir, '.venv')
      end,
      -- Patterns for autocmd LspAttach that trigger the auto venv logic
      -- Add onto this list if you depend on venvs for other file types
      -- like .yaml, .yml for ansible
      auto_venv_lsp_attach_patterns = { '*.py' },

      -- Buffer patterns to activate commands for python.nvim
      command_setup_buf_pattern = { '*.py' },

      -- Load python.nvim python snippets
      python_lua_snippets = true,

      -- List of text actions to take on InsertLeave, TextChanged
      -- Put in empty table or nil to disable
      enabled_text_actions = {
        'f-strings', -- When inserting {}, put in an f-string
      },
      -- Adjust when enabled_text_actions is triggered
      enabled_text_actions_autocmd_events = { 'InsertLeave' },

      treesitter = {
        functions = {
          -- Wrap treesitter identifier under cursor using substitute_options
          wrapper = {
            -- Substitute options for PythonTSWrapWithFunc
            substitute_options = {
              'print(%s)',
              'log.debug(%s)',
              'log.info(%s)',
              'log.warning(%s)',
              'log.error(%s)',
              'np.array(%s)',
            },

            -- Look for tree-sitter types to wrap
            find_types = {
              'tuple',
              'string',
              'true',
              'false',
              'list',
              'call',
              'parenthesized_expression',
              'expression_statement',
              'integer',
            },
          },
        },
      },
      -- Tell neotest-python which test runner to use
      test = {
        test_runner = 'pytest',
      },
    },
    -- Load python keymaps. Everything starting with <leader>p...
    keys = {
      { '<leader>pv', '<cmd>Python venv pick<cr>', desc = 'python.nvim: pick venv' },
      { '<leader>pi', '<cmd>Python venv install<cr>', desc = 'python.nvim: python venv install' },
      { '<leader>pd', '<cmd>Python dap<cr>', desc = 'python.nvim: python run debug program' },

      -- Test Actions
      { '<leader>ptt', '<cmd>Python test test<cr>', desc = 'python.nvim: python run test suite' },
      { '<leader>ptm', '<cmd>Python test test_method<cr>', desc = 'python.nvim: python run test method' },
      { '<leader>ptf', '<cmd>Python test test_file<cr>', desc = 'python.nvim: python run test file' },
      { '<leader>ptdd', '<cmd>Python test test_debug<cr>', desc = 'python.nvim: run test suite in debug mode.' },
      { '<leader>ptdm', '<cmd>Python test test_method_debug<cr>', desc = 'python.nvim: run test method in debug mode.' },
      { '<leader>ptdf', '<cmd>Python test_file_debug<cr>', desc = 'python.nvim: run test file in debug mode.' },

      -- VEnv Actions
      { '<leader>ped', '<cmd>Python venv delete_select<cr>', desc = 'python.nvim: select and delete a known venv.' },
      { '<leader>peD', '<cmd>Python venv delete<cr>', desc = 'python.nvim: delete current venv set.' },

      -- Language Actions
      { '<leader>ppe', '<cmd>Python treesitter toggle_enumerate<cr>', desc = 'python.nvim: turn list into enumerate' },
      {
        '<leader>ppw',
        '<cmd>Python treesitter wrap_cursor<cr>',
        desc = 'python.nvim: wrap treesitter identifier with pattern',
      },
      {
        '<leader>pw',
        mode = 'v',
        ':Python treesitter wrap_cursor<cr>',
        desc = 'python.nvim: wrap treesitter identifier with pattern',
      },
    },
  },
}
