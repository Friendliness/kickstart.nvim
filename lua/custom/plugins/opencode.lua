return {
  'sudo-tee/opencode.nvim',
  config = function()
    local function is_sensitive_path(path)
      if not path or path == '' then
        return false
      end

      local normalized = vim.fn.fnamemodify(path, ':p'):gsub('\\', '/')
      local name = vim.fn.fnamemodify(normalized, ':t')

      return name:match('^%.env') ~= nil
        or name:match('%.env') ~= nil
        or name == '.envrc'
        or name == '.npmrc'
        or name == '.pypirc'
        or name == '.netrc'
        or name == '.pgpass'
        or normalized:match('/%.aws/') ~= nil
        or normalized:match('/%.ssh/') ~= nil
        or normalized:match('/%.kube/') ~= nil
        or normalized:match('/secrets/') ~= nil
        or normalized:match('/credentials/') ~= nil
        or normalized:match('/%.docker/config%.json$') ~= nil
        or normalized:match('/config/database%.yml$') ~= nil
        or normalized:match('/credfile%.json$') ~= nil
        or normalized:match('/kubeconfig$') ~= nil
        or normalized:match('/env%.php') ~= nil
        or normalized:match('%.pem$') ~= nil
        or normalized:match('%.key$') ~= nil
        or normalized:match('%.crt$') ~= nil
        or normalized:match('%.p12$') ~= nil
        or normalized:match('%.pfx$') ~= nil
        or normalized:match('/appsettings%..*%.json$') ~= nil
    end

    local function prompt_guard(mentioned_files)
      local paths = vim.list_extend({}, mentioned_files or {})
      local current = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())

      if current ~= '' then
        table.insert(paths, current)
      end

      local ok, context = pcall(require, 'opencode.context')
      if ok then
        local ctx = context.get_context()
        if ctx.current_file and ctx.current_file.path then
          table.insert(paths, ctx.current_file.path)
        end
        for _, selection in ipairs(ctx.selections or {}) do
          if selection.file and selection.file.path then
            table.insert(paths, selection.file.path)
          end
        end
      end

      local state_ok, state = pcall(require, 'opencode.state')
      if state_ok and state.current_code_buf and vim.api.nvim_buf_is_valid(state.current_code_buf) then
        local code_buf = vim.api.nvim_buf_get_name(state.current_code_buf)
        if code_buf ~= '' then
          table.insert(paths, code_buf)
        end
      end

      for _, path in ipairs(paths) do
        if is_sensitive_path(path) then
          vim.notify('OpenCode prompt blocked: sensitive file context is active (' .. path .. ')', vim.log.levels.ERROR)
          return false
        end
      end

      return true
    end

    require('opencode').setup {
      keymap_prefix = '<leader>O',
      prompt_guard = prompt_guard,
      context = {
        current_file = { enabled = false },
        cursor_data = { enabled = false },
        diagnostics = { enabled = false },
        buffer = { enabled = false },
      },
      ui = {
        completion = {
          file_sources = {
            ignore_patterns = {
              '^%.git/',
              '^%.svn/',
              '^%.hg/',
              '^%.jj/',
              'node_modules/',
              '%.pyc$',
              '%.o$',
              '%.obj$',
              '%.exe$',
              '%.dll$',
              '%.so$',
              '%.dylib$',
              '%.class$',
              '%.jar$',
              '%.war$',
              '%.ear$',
              'target/',
              'build/',
              'dist/',
              'out/',
              'deps/',
              '%.tmp$',
              '%.temp$',
              '%.log$',
              '%.cache$',
              '^%.env',
              '/%.env',
              '%.env',
              '^%.aws/',
              '^%.ssh/',
              '^%.kube/',
              '/secrets/',
              '/credentials/',
              '%.pem$',
              '%.key$',
              '%.crt$',
              '%.p12$',
              '%.pfx$',
            },
          },
        },
      },
      keymap = {
        input_window = {
          ['~'] = false,
          ['<C-f>'] = { 'mention_file', mode = 'i' },
        },
      },
    }

    local ok, chat_context = pcall(require, 'opencode.context.chat_context')
    if ok then
      local add_file = chat_context.add_file
      chat_context.add_file = function(path)
        if is_sensitive_path(path) then
          vim.notify('OpenCode file mention ignored: sensitive file (' .. path .. ')', vim.log.levels.WARN)
          return
        end
        return add_file(path)
      end

      local add_selection = chat_context.add_selection
      chat_context.add_selection = function(selection)
        local path = selection and selection.file and selection.file.path
        if is_sensitive_path(path) then
          vim.notify('OpenCode selection ignored: sensitive file (' .. path .. ')', vim.log.levels.WARN)
          return
        end
        return add_selection(selection)
      end
    end
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        anti_conceal = { enabled = false },
        file_types = { 'markdown', 'opencode_output' },
      },
      ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
    },
    -- Optional, for file mentions and commands completion, pick only one
    'saghen/blink.cmp',
    -- 'hrsh7th/nvim-cmp',

    -- Optional, for file mentions picker, pick only one
    -- 'folke/snacks.nvim',
    'nvim-telescope/telescope.nvim',
    -- 'ibhagwan/fzf-lua',
    -- 'nvim_mini/mini.nvim',
  },
}
