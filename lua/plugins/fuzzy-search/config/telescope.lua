local keymaps = require("plugins.fuzzy-search.config.keymaps")
local M = {}

M.setup = function(_, opts)
	local ok, telescope = pcall(require, "telescope")

	if not ok then
		return
	end

	telescope.setup(opts)
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("lazy")
	require("telescope").load_extension("recent_files")
	keymaps.telescope_keymaps()
end

return M
