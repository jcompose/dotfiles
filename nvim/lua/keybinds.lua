-- ,--. ,--.                ,--.   ,--.           ,--.        
-- |  .'   / ,---. ,--. ,--.|  |-. `--',--,--,  ,-|  | ,---.  
-- |  .   ' | .-. : \  '  / | .-. ',--.|      \' .-. |(  .-'  
-- |  |\   \\   --.  \   '  | `-' ||  ||  ||  |\ `-' |.-'  `) 
-- `--' '--' `----'.-'  /    `---' `--'`--''--' `---' `----'  

local global = vim.g
local option_local = vim.opt
local map = vim.keymap
local api = vim.api

-- Set mapleader
global.mapleader = ','
global.maplocalleader = ','

-- Markdown-specific bindings and options
api.nvim_create_autocmd('FileType', {
	pattern = { 'markdown' },
	desc = 'All of my Markdown mappings and options',
	callback = function()
		map.set('n', 'j', 'gj')
		map.set('n', 'k', 'gk')
		map.set('n', '<leader>o', '<cmd>MarkdownPreview<cr>')
		map.set('n', '<leader>p', '<cmd>call mdip#MarkdownClipboardImage()<cr>', { buffer = true, silent = true, remap = true })
		option_local.conceallevel = 1
	end
})

-- This is so I can press <F9> to run Python files
api.nvim_create_autocmd('FileType', {
	pattern = { 'python' },
	desc = 'Run current Python file in shell',
	callback = function()
		map.set('n', '<leader>r', '<cmd>w<cr><cmd>exec \'!python3\' shellescape(@%, 1)<CR>', {buffer = true})
	end
})

-- This is so I can press <F9> to run Lua files
api.nvim_create_autocmd('FileType', {
	pattern = { 'lua' },
	desc = 'Run current Lua file in shell',
	callback = function()
		map.set('n', '<leader>r', '<cmd>w<cr><cmd>exec \'!lua\' shellescape(@%, 1)<CR>', {buffer = true})
	end
})

-- Go to tab by number
map.set('n', '<leader>1', '1gt', { desc = 'Go to first tab' })
map.set('n', '<leader>2', '2gt', { desc = 'Go to second tab' })
map.set('n', '<leader>3', '3gt', { desc = 'Go to third tab' })
map.set('n', '<leader>4', '4gt', { desc = 'Go to fourth tab' })
map.set('n', '<leader>5', '5gt', { desc = 'Go to fifth tab' })
map.set('n', '<leader>6', '6gt', { desc = 'Go to sixth tab' })
map.set('n', '<leader>7', '7gt', { desc = 'Go to seventh tab' })
map.set('n', '<leader>8', '8gt', { desc = 'Go to eighth tab' })
map.set('n', '<leader>9', '9gt', { desc = 'Go to ninth tab' })

-- Telescope mappings
local telescope_builtin = require('telescope.builtin')
map.set('n', '<leader>ff', telescope_builtin.find_files, {})
map.set('n', '<leader>fg', telescope_builtin.live_grep, {})
map.set('n', '<leader>fb', telescope_builtin.buffers, {})
map.set('n', '<leader>fc', telescope_builtin.commands, {})
map.set('n', '<leader>fh', telescope_builtin.help_tags, {})
map.set('n', '<leader>fq', telescope_builtin.quickfix, {})

-- Mapping just for my D&D Campaign files
map.set('n', '<leader>fd', function() telescope_builtin.find_files({ cwd = "~/Desktop/u^n/" }) end, {})

-- Open relevant snippets file
api.nvim_create_autocmd('BufEnter', {
	pattern = { '*' },
	desc = 'Open relevant Snippets file based on buffer file extension',
	callback = function()
		map.set('n', '<leader>s', '<cmd>vsplit ~/.config/nvim/lua/luasnippets/' .. vim.bo.filetype .. '.lua<cr>', {buffer = true})
	end
})
