-- TODO:
--    - github copilot
--    - which-key setup
--    - that TODO: plugin i have in lvim
--    - C/C++ language support
--    - Obsidian.nvim / a markdown plugin for journaling
--    - Fix the stupid formatoptions:remove('o') thing
--    - Make Mason look better

--     ____  __            _
--    / __ \/ /_  ______ _(_)___  _____
--   / /_/ / / / / / __ `/ / __ \/ ___/
--  / ____/ / /_/ / /_/ / / / / (__  )
-- /_/   /_/\__,_/\__, /_/_/ /_/____/
--               /____/

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader and localleader before lazy.nvim loads
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Load lazy.nvim
-- Documentation: https://github.com/folke/lazy.nvim
require("lazy").setup({
  { 'neovim/nvim-lspconfig' },                                -- LSP Basic Framework
  { 'loctvl842/monokai-pro.nvim' },                           -- Theme: Monokai
  { 'williamboman/mason.nvim' },                              -- LSP Server Manager
  { 'nvim-treesitter/nvim-treesitter',       build = ':TSUpdate' }, -- LSP Parser
  { 'hrsh7th/nvim-cmp' },                                     -- Completion Engine
  { 'hrsh7th/cmp-nvim-lsp' },                                 -- Completion Source: LSP
  { 'hrsh7th/cmp-buffer' },                                   -- Completion Source: Buffer
  { 'hrsh7th/cmp-path' },                                     -- Completion Source: Path
  { 'hrsh7th/cmp-emoji' },                                    -- Completion Source: Emojis
  { 'hrsh7th/cmp-cmdline' },                                  -- Completion Source: Commandline
  { 'hrsh7th/cmp-nvim-lua' },                                 -- Completion Source: Nvim's Lua API
  { 'saadparwaiz1/cmp_luasnip' },                             -- Completion Source: Luasnip snippets
  { 'chrisgrieser/cmp-nerdfont' },                            -- Completion Source: Nerdfont icons
  { 'nat-418/cmp-color-names.nvim' },                         -- Completion Source: Color Names
  { 'roobert/tailwindcss-colorizer-cmp.nvim' },               -- Completion Source: CSS Colors
  { 'tamago324/cmp-zsh' },                                    -- Completion Source: ZSH
  { 'rafamadriz/friendly-snippets' },                         -- Snippet Source: Common
  { 'tpope/vim-commentary' },                                 -- Plugin: Comment lines
  { 'tpope/vim-fugitive' },                                   -- Plugin: Git integration
  { 'tpope/vim-surround' },                                   -- Plugin: csiw'
  { 'tpope/vim-repeat' },                                     -- Plugin: csis'j.
  { 'sudormrfbin/cheatsheet.nvim' },                          -- Plugin: Cheatsheet
  { 'navarasu/onedark.nvim' },                                -- Style: Onedark
  { 'alec-gibson/nvim-tetris' },                              -- Game: Tetris
  {                                                           -- Style: Telescope
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[
         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
},
  {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  opts = {},
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
    { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
  },
},
{
  "echasnovski/mini.icons",
  opts = {
    file = {
      [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
    },
    filetype = {
      gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
    },
  },
},
  { -- Plugin: Snippet Engine
    'L3MON4D3/LuaSnip',
    init = function()
      require('luasnip').config.setup({ enable_autosnippets = true })
    end
  },
  {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },
  opts = {
    options = {
      -- stylua: ignore
      close_command = function(n) LazyVim.ui.bufremove(n) end,
      -- stylua: ignore
      right_mouse_command = function(n) LazyVim.ui.bufremove(n) end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      diagnostics_indicator = function(_, _, diag)
        local icons = LazyVim.config.icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
      ---@param opts bufferline.IconFetcherOpts
      get_element_icon = function(opts)
        return LazyVim.config.icons.ft[opts.filetype]
      end,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
},
{ "MunifTanjim/nui.nvim", lazy = true },
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>sn", "", desc = "+noice"},
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
  },
  config = function(_, opts)
    -- HACK: noice shows messages from before it was enabled,
    -- but this is not ideal when Lazy is installing plugins,
    -- so clear the messages in this case.
    if vim.o.filetype == "lazy" then
      vim.cmd([[messages clear]])
    end
    require("noice").setup(opts)
  end,
},
  { -- Plugin: Status Line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      require('lualine').setup({})
    end
  },
  { -- Style: Diagnostics Icons
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  { -- Plugin: which-key
    'folke/which-key.nvim',
    event = 'VeryLazy',
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
      {
        "<leader>w",
        function()
          vim.api.nvim_command('w')
        end,
        desc = "Save",
      },
      {
        "<leader>q",
        function()
          vim.api.nvim_command('q')
        end,
        desc = "Quit",
      },
      {
        "<leader>h",
        function()
          vim.api.nvim_command('nohlsearch')
        end,
        desc = "Remove Highlighting",
      },
      {
        "<leader>t",
        function()
          vim.api.nvim_command('vert term')
        end,
        desc = "Vert Term",
      },
      {
        "<leader>rr",
        function()
          vim.api.nvim_command('%lua')
        end,
        desc = "Run as Lua",
      },
      {
        "<C-h>",
        function()
          vim.api.nvim_command('wincmd h')
        end,
        desc = "Left",
      },
      {
        "<C-j>",
        function()
          vim.api.nvim_command('wincmd j')
        end,
        desc = "Right",
      },
      {
        "<C-k>",
        function()
          vim.api.nvim_command('wincmd k')
        end,
        desc = "Up",
      },
      {
        "<C-l>",
        function()
          vim.api.nvim_command('wincmd l')
        end,
        desc = "Down",
      },
      {
        "<C-shift-h>",
        function()
          vim.api.nvim_command('res -10')
        end,
        desc = "Left",
      },
      {
        "<C-shift-j>",
        function()
          -- TODO: Check if the buffer is on the left or the right
          vim.api.nvim_command('vert res +10')
        end,
        desc = "Right",
      },
      {
        "<C-shift-k>",
        function()
          vim.api.nvim_command('vert res -10')
        end,
        desc = "Up",
      },
      {
        "<C-shift-l>",
        function()
          vim.api.nvim_command('res +10')
        end,
        desc = "Down",
      },
    },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  },
})

--    ____        __  _
--   / __ \____  / /_(_)___  ____  _____
--  / / / / __ \/ __/ / __ \/ __ \/ ___/
-- / /_/ / /_/ / /_/ / /_/ / / / (__  )
-- \____/ .___/\__/_/\____/_/ /_/____/
--     /_/

vim.opt.tabstop = 8               -- Tab = 2 spaces
vim.opt.softtabstop = 2           -- Tab = 2 spaces
vim.opt.shiftwidth = 2            -- Indentation level = 2 spaces
vim.opt.cmdheight = 2             -- Give more space for displaying messages
vim.opt.mouse = 'a'               -- Let mouse control the screen in predictable ways
vim.opt.syntax = 'on'             -- Turn syntax highlighting on
vim.opt.expandtab = false
vim.opt.magic = true              -- Defaults %s to use \m, can override to \v for verymagic
vim.opt.number = true             -- Line numbers
vim.opt.relativenumber = true     -- Relative distances
vim.opt.cursorline = true         -- Highlight current line
vim.opt.splitbelow = true         -- These open split windows to the right...
vim.opt.splitright = true         -- ...And below the current one
vim.opt.ignorecase = true         -- Allows you to search for things ignoring case
vim.opt.smartcase = true          -- If you use caps, turn ignorecase off
vim.opt.wrap = true               -- Text wrap
vim.opt.formatoptions:remove('o') -- TODO: Makes it so comments don't auto-generate on o/O

--    ________      __          __
--   / ____/ /___  / /_  ____ _/ /____
--  / / __/ / __ \/ __ \/ __ `/ / ___/
-- / /_/ / / /_/ / /_/ / /_/ / (__  )
-- \____/_/\____/_.___/\__,_/_/____/

-- vim.g.

--     __  ___                  _
--    /  |/  /___ _____  ____  (_)___  ____ ______
--   / /|_/ / __ `/ __ \/ __ \/ / __ \/ __ `/ ___/
--  / /  / / /_/ / /_/ / /_/ / / / / / /_/ (__  )
-- /_/  /_/\__,_/ .___/ .___/_/_/ /_/\__, /____/
--             /_/   /_/            /____/

--    ______                                          __
--   / ____/___  ____ ___  ____ ___  ____ _____  ____/ /____
--  / /   / __ \/ __ `__ \/ __ `__ \/ __ `/ __ \/ __  / ___/
-- / /___/ /_/ / / / / / / / / / / / /_/ / / / / /_/ (__  )
-- \____/\____/_/ /_/ /_/_/ /_/ /_/\__,_/_/ /_/\__,_/____/

vim.cmd.colorscheme('onedark')          -- Colorscheme
vim.api.nvim_create_autocmd('TermOpen', -- When terminal opens, start in insert mode
  {
    pattern = '*',
    command = 'startinsert',
  }
)

-- Completion
local mason = require('mason')
local cmp = require('cmp')

mason.setup()

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items
  }),
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },     -- For luasnip users.
      { name = 'nvim-lsp' },    -- Completion Source: LSP
      { name = 'nvim-lua' },    -- Completion Source: Nvim's Lua API
      { name = 'latex-symbols' }, -- Completion Source: LaTeX symbols
    },
    {
      { name = 'buffer' },
      { name = 'path' },                     -- Completion Source: Path
      { name = 'cmdline' },                  -- Completion Source: Commandline
      { name = 'nerdfont' },                 -- Completion Source: Nerdfont icons
      { name = 'emoji' },                    -- Completion Source: Emojis
      { name = 'color-names.nvim' },         -- Completion Source: Color Names
      { name = 'tailwindcss-colorizer.nvim' }, -- Completion Source: CSS Colors
      { name = 'zsh' },                      -- Completion Source: ZSH
    })
})

-- Set configuration for specific filetype
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git)
  }, {
    { name = 'buffer' },
  })
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore)
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig['lua_ls'].setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    }
  }
})

lspconfig['clangd'].setup({
  capabilities = capabilities,
})
