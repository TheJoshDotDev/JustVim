local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local lsp = augroup("LspFormatting", {})
local joshDotDev = augroup("JoshDotDev", {})

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

vim.api.nvim_create_autocmd("LspAttach", {
	group = lsp,
	callback = function()
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show hover" })
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition" })
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "Go to implementation" })
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Go to type definition" })
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "Go to references" })
		vim.keymap.set("n", "sh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Show signature help" })
		vim.keymap.set("n", "rr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
		vim.keymap.set("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code action" })
		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Show diagnostics" })
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous diagnostic" })
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
	end,
})
