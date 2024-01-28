local G = {}

function G.organizeImports()
	local params = {
		file = vim.api.nvim_buf_get_name(0),
		mode = "All",
	}
	print("help")
	-- local res = vim.lsp.buf_request_sync(0, "typescript.organizeImports", params, 500)
	-- print(res)
end

return G
