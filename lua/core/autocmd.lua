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
