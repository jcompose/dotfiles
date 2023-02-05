-- ,--.    ,---.  ,------.  
-- |  |   '   .-' |  .--. ' 
-- |  |   `.  `-. |  '--' | 
-- |  '--..-'    ||  | --'  
-- `-----'`-----' `--'      

local option = vim.opt
local map = vim.keymap

-- Set up LSP with lsp-zero
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.configure('sumneko_lua', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})

-- Configure keybindings for cmp completion engine
local cmp = require('cmp')
local ls = require('luasnip')
local cmp_mappings = lsp.defaults.cmp_mappings()

cmp_mappings['<CR>'] = cmp.mapping.confirm({ select = false })
lsp.setup_nvim_cmp({ mapping = cmp_mappings })

-- Finish setup
lsp.setup()

-- Post-setup options
option.completeopt = { 'menu', 'menuone', 'noselect' }

-- Enable autosnippets
ls.config.setup({ enable_autosnippets = true })

-- <c-k> to accept snippet / go to next spot
map.set({'i','s'}, '<c-k>', function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

-- <c-j> to go to previous spot
map.set({'i','s'}, '<c-j>', function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

-- Load in my snippet files -- automatically takes .lua files from ~/.config/nvim/luasnippets/
require("luasnip.loaders.from_lua").load()

-- These are the colors corresponding to Gruvbox-material color scheme
-- \ 'fg0':              ['#d4be98',   '223'],
-- \ 'fg1':              ['#ddc7a1',   '223'],
-- \ 'red':              ['#ea6962',   '167'],
-- \ 'orange':           ['#e78a4e',   '208'],
-- \ 'yellow':           ['#d8a657',   '214'],
-- \ 'green':            ['#a9b665',   '142'],
-- \ 'aqua':             ['#89b482',   '108'],
-- \ 'blue':             ['#7daea3',   '109'],
-- \ 'purple':           ['#d3869b',   '175'],
-- \ 'bg_red':           ['#ea6962',   '167'],
-- \ 'bg_green':         ['#a9b665',   '142'],
-- \ 'bg_yellow':        ['#d8a657',   '214']

