return {
  { "n", "<leader>vd", vim.diagnostic.open_float },
  { "n", "[d", vim.diagnostic.goto_next },
  { "n", "]d", vim.diagnostic.goto_prev },
  { "n", "gd", vim.lsp.buf.definition },
  { "n", "K", vim.lsp.buf.hover },
  { "n", "<leader>vws", vim.lsp.buf.workspace_symbol },
  { "n", "<leader>ca", vim.lsp.buf.code_action },
  { "n", "<leader>rr", vim.lsp.buf.references },
  { "n", "<leader>rn", vim.lsp.buf.rename },
}
