local keymap = vim.keymap -- for conciseness
local Util = require("lazyvim.util")

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jj", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

--  file navigating
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- window management
keymap.set("n", "<leader>wv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>wd", "<C-w>c") -- close current split window

-- tab management
keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- tmux
keymap.set("n", "<leader>trm", "<cmd>!tmux detach<CR>", { desc = "Detach current tmux session" })

-- tmux navigating
keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>") -- split window vertically
keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>") -- split window vertically
keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>") -- split window vertically
keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>") -- split window vertically

-- lazyvim
keymap.set("n", "<leader>ls", "<cmd>Lazy home<cr>")
keymap.set("n", "<leader>lh", "<cmd>Lazy health<cr>")
keymap.set("n", "<leader>ll", "<cmd>Lazy update<cr>")
keymap.set("n", "<leader>lc", "<cmd>Lazy clean<cr>")
