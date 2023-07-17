local keymap = vim.keymap -- for conciseness
vim.g.mapleader = " "

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

keymap.set("n", "<leader>mv", "<C-w>_") -- Maximise vertical
keymap.set("n", "<leader>mh", "<C-w>|") -- Maximise horizontal

-- file explorer
keymap.set("n", "<leader>e", "<cmd>Ex<cr>")

-- tab management
keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- tmux
keymap.set("n", "<leader>trm", "<cmd>!tmux detach<CR>", { desc = "Detach current tmux session" })

keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")

-- lazyvim
keymap.set("n", "<leader>ls", "<cmd>Lazy home<cr>")
keymap.set("n", "<leader>lh", "<cmd>Lazy health<cr>")
keymap.set("n", "<leader>ll", "<cmd>Lazy update<cr>")
keymap.set("n", "<leader>lc", "<cmd>Lazy clean<cr>")

-- git
keymap.set("n", "<leader>gg", "<cmd>G<cr>")

-- persistence
keymap.set("n", "<leader>ss", "<cmd>lua require('persistence').load()<cr>")

-- terminal
keymap.set("t", "jj", "<C-\\><C-n>")
keymap.set("n", "<leader>vt", "<cmd>vsplit term://zsh<cr>")
keymap.set("n", "<leader>ht", "<cmd>split term://zsh<cr>")
