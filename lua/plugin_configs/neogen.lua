local M = {}

M.opts = function()
  return {
    { "<leader>ng", "<cmd>Neogen<cr>" },
    { "<leader>nf", "<cmd>Neogen func<cr>" },
    { "<leader>nc", "<cmd>Neogen class<cr>" },
    { "<leader>nt", "<cmd>Neogen type<cr>" },
  }
end

return M
