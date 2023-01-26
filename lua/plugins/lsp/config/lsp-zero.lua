local null_ls_conf = require("plugins.lsp.config.null-ls")
local M = {}

M.setup = function()
  local lsp = require("lsp-zero")

  lsp.preset("recommended")

  lsp.ensure_installed({
    "tsserver",
    "eslint",
    "sumneko_lua",
    "gopls"
  })

  lsp.configure("sumneko_lua", {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  })

  local cmp = require("cmp")
  local cmp_select = { behavior = cmp.SelectBehavior.Select }
  local cmp_mappings = lsp.defaults.cmp_mappings({ ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  })

  cmp_mappings["<Tab>"] = nil
  cmp_mappings["<S-Tab>"] = nil
  local lspkind = require("lspkind")
  lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
        maxwidth = 50,
        ellipsis_char = "...",
      }),
    },
  })

  lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, bufnr)
    end

    -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    -- if client.supports_method("textDocument/formatting") then
    --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --   vim.api.nvim_create_autocmd("BufWritePre", {
    --     group = augroup,
    --     buffer = bufnr,
    --     callback = function()
				-- 	print("Formatting...")
    --       vim.lsp.buf.format({ async = true })
    --     end,
    --   })
    -- end

    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>vws", function()
      vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", "<leader>vd", function()
      vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>rr", function()
      vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "<leader>rn", function()
      vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
      vim.lsp.buf.signature_help()
    end, opts)
  end)

  lsp.setup()

  null_ls_conf.setup()
end

return M
