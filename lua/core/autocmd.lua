local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local joshDotDev = augroup("JoshDotDev", {})

autocmd("TextYankPost", {
	group = joshDotDev,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

autocmd("FileType", {
	group = joshDotDev,
	pattern = "netrw",
	callback = function()
		vim.keymap.set("n", "a", "%", { remap = true, buffer = true })
	end,
})

autocmd("FileType", {
	group = joshDotDev,
	pattern = { "help", "fugitive" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
	end,
})

autocmd("LspAttach", {
	group = joshDotDev,
	callback = function()
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
		vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")
		vim.keymap.set("x", "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")

		-- if vim.lsp.buf.range_code_action then
		--   map('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
		-- else
		--   map('x', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
		-- end

		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	end,
})
