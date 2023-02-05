-- ,------. ,--.               ,--.
-- |  .--. '|  |,--.,--. ,---. `--',--,--,  ,---.
-- |  '--' ||  ||  ||  || .-. |,--.|      \(  .-'
-- |  | --' |  |'  ''  '' '-' '|  ||  ||  |.-'  `)
-- `--'     `--' `----' .`-  / `--'`--''--'`----'
--                      `---'

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'			-- Plugin manager
	use 'nvim-lualine/lualine.nvim'			-- Status line
	use 'tpope/vim-commentary'				-- Commenting lines
	use 'tpope/vim-fugitive'				-- Git integration
	use 'tpope/vim-surround'				-- Surround text
	use 'tpope/vim-repeat'					-- For repeating with .
	use 'lervag/vimtex'						-- Run LaTeX code
	use 'sainnhe/gruvbox-material'			-- Theme
	use 'joshdick/onedark.vim' 				-- Theme 2
	use 'img-paste-devs/img-paste.vim'		-- For pasting images in .md
	use 'nvim-treesitter/nvim-treesitter'	-- Better syntax highlighting
	use
	{
		'nvim-telescope/telescope.nvim',	-- FZF / NERDtree replacement
		tag = '0.1.0',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use({
		'iamcco/markdown-preview.nvim',		-- Preview Markdown files in browser
		run = function() vim.fn['mkdp#util#install']() end,
	})
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
end)
