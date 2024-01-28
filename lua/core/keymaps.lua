local keymap = vim.keymap -- for conciseness
vim.g.mapleader = " "

---------------------
-- General Keymaps
---------------------
-- use jk to exit insert mode
keymap.set("i", "jj", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>kw", ":q<CR>")

--  file navigating
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "J", "30jzzzv")
keymap.set("n", "W", "^")
keymap.set("n", "E", "$")
-- keymap.set("n", "K", "30kzzzv")

-- window management
keymap.set("n", "<leader>h", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>v", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>wd", "<C-w>c") -- close current split window
keymap.set("n", "<leader>wv", "<C-w>_") -- Maximise vertical
keymap.set("n", "<leader>wh", "<C-w>|") -- Maximise horizontal
keymap.set("n", "<leader>wm", "<C-w>|<C-w>_") -- Maximise horizontal

-- file explorer
keymap.set("n", "<leader>e", "<cmd>Ex<cr>")

-- tab management
keymap.set("n", "<leader>nt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- Window navigation
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")

-- External
-- lazy
keymap.set("n", "<leader>ls", "<cmd>Lazy home<cr>")
keymap.set("n", "<leader>lh", "<cmd>Lazy health<cr>")
keymap.set("n", "<leader>ll", "<cmd>Lazy update<cr>")
keymap.set("n", "<leader>lc", "<cmd>Lazy clean<cr>")

-- git
keymap.set("n", "<leader>gg", "<cmd>G<cr>")

-- persistence
keymap.set("n", "<leader>ss", "<cmd>lua require('persistence').load()<cr>")

-- terminal
keymap.set("n", "<leader>tt", "<cmd>vsplit term://zsh<cr>")
keymap.set("n", "<leader>kt", function()
	for _, buf in ipairs(vim.fn.range(1, vim.fn.bufnr("$"))) do
		if vim.fn.getbufvar(buf, "&buftype") == "terminal" then
			vim.cmd("bdelete! " .. buf)
		end
	end
end)

keymap.set("t", "jj", "<C-\\><C-N>")
keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h")
keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l")
keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k")
keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j")

-- buffers
keymap.set("n", "<leader>q", "<cmd>bd!<cr>")
