--     _   __      _         
--    / | / /   __(_)___ ___ 
--   /  |/ / | / / / __ `__ \
--  / /|  /| |/ / / / / / / /
-- /_/ |_/ |___/_/_/ /_/ /_/ 
--
-- Jackson's Totally Custom Neovim Configuration
--	TODO:
--		- CMP setup
--		- LSP setup
--		- Luasnip setup
--		- Whichkey / better Undo / Redo plugin
--		- Homescreen like Lunarvim
--		- Latex support
--		- GH Copilot Setup
--		- Telescope shortcuts

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Required before lazy.nvim setup
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- lazy.nvim setup
require('lazy').setup({
	{'neovim/nvim-lspconfig'},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function()
			require('lualine').setup({
				options = { theme = 'gruvbox' }
			})
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.3',
		dependencies = {'nvim-lua/plenary.nvim'}	-- Library
	},
	{'ellisonleao/gruvbox.nvim'},	-- Theme
	{'tpope/vim-surround'},		-- Surround
	{'tpope/vim-repeat'},		-- Repeat
	{'tpope/vim-fugitive'},		-- Git integration
	{'tpope/vim-commentary'},	-- Commenting
	{'hrsh7th/cmp-nvim-lsp'},	-- Provides CMP source for LSP servers
	{'hrsh7th/cmp-buffer'},		-- Provides CMP source for buffer
	{'hrsh7th/cmp-path'},		-- Provides CMP source for paths of files and folders
	{'hrsh7th/cmp-cmdline'},	-- Provides CMP source for command line suggestions
	{'hrsh7th/nvim-cmp'},		-- Base CMP plugin
})

-- Options
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wildignorecase = true -- TODO not working yet, supposed to make it so tab autocomplete with : commands is case-insensitive

-- CMP
local cmp = require('cmp')
cmp.setup({
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'cmdline' },
	})
})

-- ???
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP
local lsp = require('lspconfig')
lsp.pylsp.setup{ capabilities = capabilities }

-- Colorscheme
vim.cmd.colorscheme('gruvbox')

-- Newlines with comments
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
