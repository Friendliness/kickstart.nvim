local ollama = require 'ollama'
local prompts = {
  Ask_About_Code = {
    -- action = 'display_prompt',
    action = require('ollama.actions.factory').create_action { display = true, show_prompt = true, window = 'vsplit' },
  },
  Simplify_Code = {
    -- action = 'display_replace',
    action = require('ollama.actions.factory').create_action { display = true, replace = true, show_prompt = true, window = 'vsplit' },
  },
  Explain_Code = {
    -- action = 'display_prompt',
    action = require('ollama.actions.factory').create_action { display = true, show_prompt = true, window = 'vsplit' },
  },
  Modify_Code = {
    -- action = "display_replace",
    action = require('ollama.actions.factory').create_action { display = true, replace = true, show_prompt = true, window = 'vsplit' },
  },
  Generate_Code = {
    -- action = 'display_insert',
    action = require('ollama.actions.factory').create_action { display = true, insert = true, show_prompt = true, window = 'vsplit' },
  },
}

ollama.setup { prompts = prompts }
