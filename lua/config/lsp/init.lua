local lsp_utils = require('config.lsp.utils')

local lsp = require('lsp-zero').preset({
	name = 'recommended',
	manage_nvim_cmp = {
		set_sources = 'recommended'
	}
})

lsp.on_attach(lsp_utils.on_attach)

lsp.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		['lua_ls'] = { 'lua' },
		['null-ls'] = { 'javascript', 'typescript', 'typescriptreact', 'json', 'yaml' }
	}
})

lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'eslint', 'lua_ls', 'gopls' },
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
		end,
	},
})

require('luasnip.loaders.from_vscode').lazy_load()
require('config.lsp.cmp')
require('config.lsp.typescript')
require('config.lsp.null_ls')
