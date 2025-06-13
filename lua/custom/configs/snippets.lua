local ls = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
ls.filetype_extend('html', { 'djangohtml' })

-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.config.set_config {
  store_selection_keys = '<leader>ss',
}

-- Temporary snippets
local tir = function()
  return { 'interaction.client.try_interaction_respond()' }
end

-- Endblock
local endbl = function()
  return { '{% endblock %}' }
end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = 'tir',
      namr = 'try_interaction_respond',
      dscr = 'Try interaction respond snippet',
    }, {
      text { 'interaction.client.try_interaction_respond(interaction=interaction, content=' },
      insert(1),
      text { ', ephemeral=' },
      insert(2),
      text { ')' },
    }),

    snip({
      trig = 'endbl',
      namr = 'jinja_2_endblock',
      dscr = 'Jinja2 endblock',
    }, {
      func(endbl, {}),
    }),
    snip({
      trig = 'link',
      name = 'markdown_link',
      dscr = 'Create markdown link [txt](url)',
    }, {
      text '[',
      insert(1),
      text '](',
      func(function(_, snip)
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      text ')',
      insert(1),
    }),
    snip({
      trig = 'eee',
      name = 'go_error_not_equals_nil',
      dscr = 'If error != nil ',
    }, {
      text { 'if err != nil {', '' },
      insert(1),
      text { '', '}' },
    }),
    snip({
      trig = 'dbpy',
      name = 'import_debugpy',
      dscr = 'Import debugpydbstub',
    }, { text 'from utils.debug import debugpy' }),
  },
})
