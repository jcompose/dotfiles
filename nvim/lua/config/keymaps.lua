-- stylua: ignore start
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- formatting
map({ "n", "v" }, "<leader>cf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- floating terminal
local lazyterm = function() LazyVim.terminal(nil, { cwd = LazyVim.root() }) end
map("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<leader>fT", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- windows
map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
LazyVim.toggle.map("<leader>wm", LazyVim.toggle.maximize)

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-----------

map({ "n", "v" }, "<F6>", vim.fn.execute('!' .. vim.fn.getline('.')), { desc = "Run As Shell Cmd" })
-- map("n", "gf", require("obsidian").util.gf_passthrough(), { remap = false, expr = true, buffer = true })
-- map("n", "<leader>ch", require("obsidian").util.toggle_checkbox(), { buffer = true }) -- FIXME: why does this error out
-- map("n", "<cr>", require("obsidian").util.smart_action(), { buffer = true, expr = true })
map("n", "<leader>/", ":CommentToggle<cr>", { silent = true })
map("v", "<leader>/", ":'<,'>CommentToggle<cr>", { silent = true })

-- Mapping <leader>- to :split
map("n", "<leader>-", ":split<CR>", { silent = true, desc = "Horizontal Split" })

-- Mapping <leader>| to :vsplit
map("n", "<leader>|", ":vsplit<CR>", { silent = true, desc = "Vertical Split" })
