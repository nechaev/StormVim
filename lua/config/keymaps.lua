local Util = require("lazyvim.util")
-- Uncomment line for reset LazyVim default mappings

-- better up/down
-- vim.keymap.del({ "n", "x" }, "j") -- "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- vim.keymap.del({ "n", "x" }, "<Down>") -- "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- vim.keymap.del({ "n", "x" }, "k") -- "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.del({ "n", "x" }, "<Up>") -- "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
-- vim.keymap.del("n", "<C-h>") -- "<C-w>h", { desc = "Go to left window", remap = true })
-- vim.keymap.del("n", "<C-j>") -- "<C-w>j", { desc = "Go to lower window", remap = true })
-- vim.keymap.del("n", "<C-k>") -- "<C-w>k", { desc = "Go to upper window", remap = true })
-- vim.keymap.del("n", "<C-l>") -- "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.del("n", "<C-Up>") -- "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.del("n", "<C-Down>") -- "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.del("n", "<C-Left>") -- "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.del("n", "<C-Right>") -- "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
-- vim.keymap.del("n", "<A-j>") -- "<cmd>m .+1<cr>==", { desc = "Move down" })
-- vim.keymap.del("n", "<A-k>") -- "<cmd>m .-2<cr>==", { desc = "Move up" })
-- vim.keymap.del("i", "<A-j>") -- "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- vim.keymap.del("i", "<A-k>") -- "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- vim.keymap.del("v", "<A-j>") -- ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- vim.keymap.del("v", "<A-k>") -- ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
-- vim.keymap.del("n", "<S-h>") -- "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- vim.keymap.del("n", "<S-l>") -- "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.del("n", "[b") -- "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.del("n", "]b") -- "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.del("n", "<leader>bb") -- "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.del("n", "<leader>`") -- "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
-- vim.keymap.del({ "i", "n" }, "<esc>") -- "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
vim.keymap.del(
  "n",
  "<leader>ur"
  -- "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  -- { desc = "Redraw / clear hlsearch / diff update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- vim.keymap.del("n", "n") -- "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
-- vim.keymap.del("x", "n") -- "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- vim.keymap.del("o", "n") -- "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
-- vim.keymap.del("n", "N") -- "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
-- vim.keymap.del("x", "N") -- "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
-- vim.keymap.del("o", "N") -- "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
-- vim.keymap.del("i", ",") -- ",<c-g>u")
-- vim.keymap.del("i", ".") -- ".<c-g>u")
-- vim.keymap.del("i", ";") -- ";<c-g>u")

-- save file
-- vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>") -- "<cmd>w<cr><esc>", { desc = "Save file" })

--keywordprg
vim.keymap.del("n", "<leader>K") -- "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
-- vim.keymap.del("v", "<") -- "<gv")
-- vim.keymap.del("v", ">") -- ">gv")

-- lazy
vim.keymap.del("n", "<leader>l") -- "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
vim.keymap.del("n", "<leader>fn") -- "<cmd>enew<cr>", { desc = "New File" })

vim.keymap.del("n", "<leader>xl") -- "<cmd>lopen<cr>", { desc = "Location List" })
vim.keymap.del("n", "<leader>xq") -- "<cmd>copen<cr>", { desc = "Quickfix List" })

vim.keymap.del("n", "[q") -- vim.cmd.cprev, { desc = "Previous quickfix" })
vim.keymap.del("n", "]q") -- vim.cmd.cnext, { desc = "Next quickfix" })

-- formatting
vim.keymap.del({ "n", "v" }, "<leader>cf") -- function() Util.format({ force = true }) end, { desc = "Format" })

-- diagnostic
-- vim.keymap.del("n", "<leader>cd") -- vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- vim.keymap.del("n", "]d") -- diagnostic_goto(true), { desc = "Next Diagnostic" })
-- vim.keymap.del("n", "[d") -- diagnostic_goto(false), { desc = "Prev Diagnostic" })
-- vim.keymap.del("n", "]e") -- diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
-- vim.keymap.del("n", "[e") -- diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
-- vim.keymap.del("n", "]w") -- diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
-- vim.keymap.del("n", "[w") -- diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
-- vim.keymap.del("n", "<leader>uf") -- function() Util.format.toggle() end, { desc = "Toggle auto format (global)" })
-- vim.keymap.del("n", "<leader>uF") -- function() Util.format.toggle(true) end, { desc = "Toggle auto format (buffer)" })
-- vim.keymap.del("n", "<leader>us") -- function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
-- vim.keymap.del("n", "<leader>uw") -- function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- vim.keymap.del("n", "<leader>uL") -- function() Util.toggle("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
-- vim.keymap.del("n", "<leader>ul") --, function() Util.toggle.number() end, { desc = "Toggle Line Numbers" })
-- vim.keymap.del("n", "<leader>ud") -- function() Util.toggle.diagnostics() end, { desc = "Toggle Diagnostics" })
-- vim.keymap.del("n", "<leader>uc") -- function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })
vim.keymap.del("n", "<leader>uT") -- function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "Toggle Treesitter Highlight" })
-- vim.keymap.del("n", "<leader>ub") -- function() Util.toggle("background", false, {"light", "dark"}) end, { desc = "Toggle Background" })

-- lazygit
vim.keymap.del("n", "<leader>gg") -- function() Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazygit (root dir)" })
vim.keymap.del("n", "<leader>gG") -- function() Util.terminal({ "lazygit" }, {esc_esc = false, ctrl_hjkl = false}) end, { desc = "Lazygit (cwd)" })

-- diffview binding
vim.keymap.set("n", "<leader>h", "<cmd>DiffviewFileHistory %<cr>", { desc = "Show file history in git" })
vim.keymap.set("n", "<C-g>", "<cmd>DiffviewOpen<cr>", { desc = "Show git status" })
-- quit
-- vim.keymap.del("n", "<leader>qq") -- "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
-- vim.keymap.del("n", "<leader>ui") -- vim.show_pos, { desc = "Inspect Pos" })

-- LazyVim Changelog
vim.keymap.del("n", "<leader>L") -- function() Util.news.changelog() end, { desc = "LazyVim Changelog" })

-- floating terminal
vim.keymap.del("n", "<leader>ft") -- lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.del("n", "<leader>fT") -- function() Util.terminal() end, { desc = "Terminal (cwd)" })
-- vim.keymap.del("n", "<c-/>") -- lazyterm, { desc = "Terminal (root dir)" })
-- vim.keymap.del("n", "<c-_>") -- lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
-- vim.keymap.del("t", "<esc><esc>") -- "<c-\\><c-n>", { desc = "Enter Normal Mode" })
-- vim.keymap.del("t", "<C-h>") -- "<cmd>wincmd h<cr>", { desc = "Go to left window" })
-- vim.keymap.del("t", "<C-j>") -- "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
-- vim.keymap.del("t", "<C-k>") -- "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
-- vim.keymap.del("t", "<C-l>") -- "<cmd>wincmd l<cr>", { desc = "Go to right window" })
-- vim.keymap.del("t", "<C-/>") -- "<cmd>close<cr>", { desc = "Hide Terminal" })
-- vim.keymap.del("t", "<c-_>") -- "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
vim.keymap.del("n", "<leader>ww") -- "<C-W>p", { desc = "Other window", remap = true })
-- vim.keymap.del("n", "<leader>wd") -- "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.del("n", "<leader>w-") -- "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.del("n", "<leader>w|") -- "<C-W>v", { desc = "Split window right", remap = true })
-- vim.keymap.del("n", "<leader>-") -- "<C-W>s", { desc = "Split window below", remap = true })
-- vim.keymap.del("n", "<leader>|") -- "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
-- vim.keymap.del("n", "<leader><tab>l") -- "<cmd>tablast<cr>", { desc = "Last Tab" })
-- vim.keymap.del("n", "<leader><tab>f") -- "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- vim.keymap.del("n", "<leader><tab><tab>") -- "<cmd>tabnew<cr>", { desc = "New Tab" })
-- vim.keymap.del("n", "<leader><tab>]") -- "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.del("n", "<leader><tab>d") -- "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- vim.keymap.del("n", "<leader><tab>[") -- "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
