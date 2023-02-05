local var = require("util")
-- LaTeX snippets
var.ls.add_snippets('tex',
{
	-- INLINE MATH MODE --
	var.s({
		trig = 'mk',
		snippetType = 'autosnippet',
		name = 'Inline Math Mode',
		dscr = 'Create an inline math mode environment using \\(\\)'
	},
	{
		var.t('\\('), var.i(1), var.t('\\)')
	}),

	-- DISPLAY MATH MODE --
	var.s({
		trig = 'md',
		snippetType = 'autosnippet',
		name = 'Display Math Mode',
		dscr = 'Create a display math mode environment using \\[\\]'
	},
	{
		var.t({'\\[',''}), var.t('	'), var.i(1), var.t({'','\\]'})
	}),
	-- BEGIN{} ENVIRONMENT --
	var.s({
		trig = 'beg',
		snippetType = 'autosnippet',
		name = 'Begin{} environment',
		dscr = 'Enter a Begin{} environment'
	},
	{
		var.t('\\begin{'), var.i(1), var.t({'}','	'}), var.i(2), var.t({'','\\end{}'})
	}),
},
{
	key = 'tex'
})
