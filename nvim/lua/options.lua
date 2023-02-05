--  ,-----.          ,--.  ,--.                       
-- '  .-.  ' ,---. ,-'  '-.`--' ,---. ,--,--,  ,---.  
-- |  | |  || .-. |'-.  .-',--.| .-. ||      \(  .-'  
-- '  '-'  '| '-' '  |  |  |  |' '-' '|  ||  |.-'  `) 
--  `-----' |  |-'   `--'  `--' `---' `--''--'`----'  
--          `--'

-- Aliases
local global = vim.g
local option = vim.opt
local command = vim.cmd
local api = vim.api

-- Configure lualine
require('lualine').setup {
	options = {
		theme = 'onedark'
	}
}

-- This allows bold and italicized fonts to show up while using Gruvbox theme
command.colorscheme('onedark')
global.gruvbox_material_enable_bold = 1
global.gruvbox_material_enable_italic = 1
global.gruvbox_material_diagnostic_virtual_text = 'colored'

option.tabstop = 4 -- Tab = 4 spaces
option.shiftwidth = 4 -- Indentation level = 4 spaces
option.cmdheight = 2 -- Give more space for displaying messages
option.mouse = 'a' -- Let mouse control the screen in predictable ways
option.syntax = 'on' -- Turn syntax highlighting on
option.magic = true -- Defaults %s to use \m, can override to \v for verymagic
option.number = true -- Line numbers
option.relativenumber = true -- Relative distances
option.cursorline = true -- Highlight current line
option.splitbelow = true -- These open split windows to the right...
option.splitright = true -- ...And below the current one
option.ignorecase = true -- Allows you to search for things ignoring case
option.smartcase = true -- If you use caps, turn ignorecase off
option.hlsearch = false -- hlsearch sucks

-- Highlight Bold and Italic text in markdown
api.nvim_set_hl(0, 'markdownBold', { bold = true, ctermfg = 167 })
api.nvim_set_hl(0, 'markdownItalic', { italic = true, ctermfg = 109 })

-- Sets the PDF viewer for Vimtex
global.vimtex_view_method = 'skim'
