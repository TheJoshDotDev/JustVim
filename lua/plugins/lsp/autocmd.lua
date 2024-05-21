local lspGroup = vim.api.nvim_create_augroup("LspFormatting", {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = lspGroup,
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

		vim.keymap.set("n", "<leader>fo", function()
			vim.lsp.buf.format({
				async = true,
				bufnr = 0,
				filter = function(client)
					return client.name == "null-ls"
				end,
			})
		end, { desc = "Formats the current buffer" })
	end,
})

