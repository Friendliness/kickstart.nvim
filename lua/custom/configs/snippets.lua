local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.config.set_config({
	store_selection_keys = '<C-s>',
})


local tir = function()
	return { "interaction.client.try_interaction_respond()" }
end

ls.add_snippets(nil, {
	all = {
		snip({
			trig = "tir",
			namr = "try_interaction_respond",
			dscr = "Try interaction respond snippet"
		}, {
			func(tir, {})
		}),

		snip({
				trig = "link",
				name = "markdown_link",
				dscr = "Create markdown link [txt](url)"
			},
			{
				text('['),
				insert(1),
				text(']('),
				func(function(_, snip)
					return snip.env.TM_SELECTED_TEXT[1] or {}
				end, {}),
				text(')'),
				insert(0)
			}
		),
		snip({})
	}
})
