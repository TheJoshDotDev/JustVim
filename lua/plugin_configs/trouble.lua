local M = {}

M.keys = function()
  return {
    { "<leader>xx", false },
    { "<leader>xX", false },
    { "<leader>tr", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
    { "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
  }
end

return M
