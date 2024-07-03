return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"zapling/mason-conform.nvim",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"eslint",
				"tsserver",
				"gopls",
				"lua_ls",
				"dockerls",
				"marksman",
				"sqls"
			},
			automatic_installation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			},
		})
		require("mason-conform").setup()
	end,
}
