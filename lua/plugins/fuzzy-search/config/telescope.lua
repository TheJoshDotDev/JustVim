local M = {}

M.setup = function(_, opts)
	local ok, telescope = pcall(require, "telescope")

	if not ok then
		return
	end

	telescope.setup(opts)
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("lazy")
	require("configs.plugin-keymaps").telescope_keymaps()
end

return M
