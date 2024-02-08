local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local statusline = require("core.statusline")

local joshDotDev = augroup("JoshDotDev", {})

vim.api.nvim_create_autocmd({
	"WinEnter",
	"BufEnter",
	"VimResized",
	"WinEnter",
	"ModeChanged",
}, {
	callback = function()
		vim.opt.statusline = statusline.refresh()
	end,
})

autocmd("TextYankPost", {
	group = joshDotDev,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			timeout = 100,
		})
	end,
})

autocmd("FileType", {
	group = joshDotDev,
	pattern = "netrw",
	callback = function()
		vim.keymap.set("n", "a", "%", { remap = true, buffer = true })
		vim.keymap.set("n", "cp", "<C-w>z", { remap = true, buffer = true })
	end,
})

autocmd("FileType", {
	group = joshDotDev,
	pattern = { "help", "fugitive" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
	end,
})

autocmd("FileType", {
	group = joshDotDev,
	pattern = { "fugitive" },
	callback = function()
		vim.keymap.set("n", "p", "<cmd>Git pull<cr>", { buffer = true })
		vim.keymap.set("n", "f", "<cmd>Git fetch<cr>", { buffer = true })
		vim.keymap.set("n", "P", "<cmd>Git push<cr>", { buffer = true })
	end,
})

autocmd({ "TermOpen", "TermEnter" }, {
	group = joshDotDev,
	callback = function()
		vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { buffer = true })
		vim.keymap.set("n", "<leader>Q", "<cmd>bd!<cr>", { buffer = true })
	end,
})

autocmd({ "BufEnter" }, {
	group = joshDotDev,
	pattern = "term://*",
	callback = function()
		vim.cmd("startinsert")
	end,
})
