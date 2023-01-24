local M = {}

M.setup = function(_, opts)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "nvimtree" },
		callback = function()
			vim.b.miniindentscope_disable = true
		end,
	})
	require("mini.indentscope").setup(opts)
end

return M
