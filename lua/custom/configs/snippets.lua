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
	store_selection_keys = '<leader>ss',
})

-- Temporary snippets
local tir = function()
	return { "interaction.client.try_interaction_respond()" }
end

local botlogerror = function()
	return { "self.bot._logging.error()" }
end

-- Block extends base.html
local bebh = function()
	return { '{% extends "base.html" %"}' }
end

-- Endblock
local endbl = function()
	return { '{% endblock %}' }
end

-- With end block
local bebhe = function()
	return { '{% extends "base.html" %"}<CR>{% endblock %}' }
end

local jinja = function()
	return { '{% %}' }
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
			trig = "sble",
			namr = "self.bot_logging.error",
			dscr = "Bot logging error"
		}, {
			func(botlogerror, {})
		}),
		snip({
			trig = "bebh",
			namr = "block_extends_base_html",
			dscr = "Jinja2 Block Extends Base HTML"
		}, {
			func(bebh, {})
		}),
		snip({
			trig = "bebhe",
			namr = "block_extends_base_html_and_endblock",
			dscr = "Jinja2 Block Extends Base HTML with Endblock"
		}, {
			func(bebhe, {})
		}),
		snip({
			trig = "endbl",
			namr = "jinja_2_endblock",
			dscr = "Jinja2 endblock"
		}, {
			func(endbl, {})
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

		snip({
				trig = "jj2",
				name = "jinja2_block",
				dscr = "Create jinja2 block"
			},
			{
				text('{% block '),
				func(function(_, snip)
					return snip.env.TM_SELECTED_TEXT[1] or {}
				end, {}),
				text(' %}'),
			}
		)
	}
})
