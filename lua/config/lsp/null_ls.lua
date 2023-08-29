local null_ls = require('null-ls')
local null_ls_utils = require("null-ls.utils")

null_ls.setup({
	root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json", '.luarc.json'),
	sources = {
		null_ls.builtins.formatting.prettierd,
	}
})
