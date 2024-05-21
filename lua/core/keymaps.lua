local keymap = vim.keymap -- for conciseness
vim.g.mapleader = " "

---------------------
-- General Keymaps
---------------------
-- Quality of life mods
keymap.set("i", "jj", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>kw", ":q<CR>")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("n", "W", "^")
keymap.set("n", "E", "$")

-- window management
keymap.set("n", "<leader>h", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>v", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make split windows equal width" })
keymap.set("n", "<leader>wd", "<C-w>c", { desc = "Close current split window" })
keymap.set("n", "<leader>wm", "<C-w>|<C-w>_", { desc = "Maximize current split window" })

-- file explorer
keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Open file explorer" })

-- tab management
keymap.set("n", "<leader>nt", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- Window navigation
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })

-- buffers
keymap.set("n", "<leader>q", "<cmd>bd!<cr>", { desc = "Delete buffer" })

-- keymap.set("n", "<leader>gg", function()
-- 	local utils = require("lazy.util")
-- 	utils.float_term({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
-- end, { desc = "Lazygit (root dir)" })

keymap.set("n", "<leader>lf", function()
	local utils = require("lazy.util")
	utils.float_term({ "lf" }, {})
end, { desc = "Lazygit (root dir)" })
