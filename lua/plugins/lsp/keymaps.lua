local keymap = vim.keymap

keymap.set("n", "<leader>ff", function()
	local clients = vim.lsp.get_active_clients()

	local current_client = clients[1]

	if current_client.supports_method("textDocument/formatting") then
		vim.lsp.buf.format({
			async = true,
			filter = function(client)
				return client.name == "null-ls"
			end,
			bufnr = 0,
		})
	else
		vim.notify("The current client does not support formatting")
	end
end, { desc = "Formats the current buffer" })
