return {
  'nomnivore/ollama.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  -- All the user commands added by the plugin
  cmd = { 'Ollama', 'OllamaModel', 'OllamaServe', 'OllamaServeStop' },

  keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
      '<leader>oo',
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = 'ollama prompt',
      mode = { 'n', 'v' },
    },

    -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
    {
      '<leader>oG',
      ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
      desc = 'ollama Generate Code',
      mode = { 'n', 'v' },
    },
  },

  ---@type Ollama.Config
  opts = {
    -- NOTE: If the model isn't available, you may need to pull it in the container:
    -- docker exec -it ollama bash
    -- ollama pull deepseek-r1:32b

    -- $ docker run -d --rm --gpus=all -v <volume>:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
    model = 'deepseek-r1:32b',
    url = 'http://127.0.0.1:11434',
    serve = {
      command = 'podman',
      args = {
        'run',
        '-d',
        '--rm',
        '--gpus=all',
        '-v',
        'ollama:/root/.ollama',
        '-p',
        '11434:11434',
        '--name',
        'ollama',
        'ollama/ollama',
      },
      stop_command = 'podman',
      stop_args = { 'stop', 'ollama' },
    },
  },
}
