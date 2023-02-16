local keymaps = require("plugins.file-explorer.config.keymaps")
local M = {}

local file_auto_open = function(api)
	api.events.subscribe(api.events.Event.FileCreated, function(file)
		vim.cmd("edit " .. file.fname)
	end)
end

local auto_close_tree = function(api)
	local augroup = vim.api.nvim_create_augroup("NvimTreeBuffer", {})
	vim.api.nvim_clear_autocmds({ group = augroup })
	vim.api.nvim_create_autocmd("VimLeave", {
		callback = function()
			api.tree.close()
		end,
	})
end

M.setup = function(_, opts)
	local nvimtree_ok, nvimtree = pcall(require, "nvim-tree")
	if not nvimtree_ok then
		return
	end

	local nvimtree_api_ok, nvimtree_api = pcall(require, "nvim-tree.api")
	if not nvimtree_api_ok then
		return
	end

	nvimtree.setup(opts)
	keymaps.nvimtree_keys()
	file_auto_open(nvimtree_api)
	auto_close_tree(nvimtree_api)
end

return M
