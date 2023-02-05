-- These are defined by :help luasnip.txt<cr>
-- Or ,fh luasnip.txt<cr>
local ls = require('luasnip')
local events = require('luasnip.util.events')
local ai = require('luasnip.nodes.absolute_indexer')
local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require('luasnip.extras.expand_conditions')
local postfix = require('luasnip.extras.postfix').postfix
local types = require('luasnip.util.types')
local parse = require('luasnip.util.parser').parse_snippet

local vars = {
	ls = ls,
	s = ls.snippet,
	sn = ls.snippet_node,
	isn = ls.indent_snippet_node,
	t = ls.text_node,
	i = ls.insert_node,
	f = ls.function_node,
	c = ls.choice_node,
	d = ls.dynamic_node,
	r = ls.restore_node,
	events = events,
	ai = ai,
	extras = extras,
	l = extras.lambda,
	rep = extras.rep,
	p = extras.partial,
	m = extras.match,
	n = extras.nonempty,
	dl = extras.dynamic_lambda,
	fmt = fmt,
	fmta = fmta,
	conds = conds,
	postfix = postfix,
	types = types,
	parse = parse
}

return vars
