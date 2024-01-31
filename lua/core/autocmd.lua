local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local joshDotDev = augroup("JoshDotDev", {})
local utils = require("utils")

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

autocmd("LspAttach", {
	group = joshDotDev,
	callback = function()
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
		vim.keymap.set("n", "sh", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
		vim.keymap.set("n", "rr", "<cmd>lua vim.lsp.buf.rename()<cr>")
		vim.keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	end,
})

vim.api.nvim_create_autocmd({
	"VimEnter",
	"ModeChanged",
	"TabEnter",
	"TabLeave",
	"WinEnter",
	"WinLeave",
	"BufLeave",
	"BufEnter",
}, {
	callback = function()
		vim.opt.statusline = utils.statusLineInfo()
	end,
})
