return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		local conform_ok, conform = pcall(require, "conform")
		if not conform_ok then
			vim.notify("Conform not found", vim.log.levels.ERROR)
		end

		local mason_status, mason = pcall(require, "mason")
		if not mason_status then
			vim.notify("Mason not found", vim.log.levels.ERROR)
		end

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				lua = { "stylua" },
				go = { "golines", "goimports-reviser", "gofumpt" },
			},

			-- FIX: This formatter just doesnt work properly should really fix it
			-- formatters = {
			-- 	sqlfmt = {
			-- 		exe = "sqlfmt",
			-- 		stdin = true,
			-- 		args = { "-", "--fast", "--line-length", "120" },
			-- 	},
			-- },
		})

		vim.keymap.set({ "n", "v" }, "<leader>fo", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
