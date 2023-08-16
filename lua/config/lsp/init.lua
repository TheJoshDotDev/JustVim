local luasnip_loaders = require('luasnip.loaders.from_vscode')
local lsp_utils = require('config.lsp.utils')
local lspcongif = require('lspconfig')

local lsp = require('lsp-zero').preset({
	name = 'recommended',
	manage_nvim_cmp = {
		set_sources = 'recommended'
	}
})

lsp.ensure_installed({
	'eslint',
	'lua_ls',
	'gopls'
})



lsp.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

lsp.on_attach(lsp_utils.on_attach)
lsp.setup()

luasnip_loaders.lazy_load()

require('config.lsp.cmp')
require('config.lsp.typescript')
require('config.lsp.null_ls')

-- NOTE: What the fuck is this?
vim.diagnostic.config({
	virtual_text = true
})
