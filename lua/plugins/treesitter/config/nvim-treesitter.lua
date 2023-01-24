local M = {}

M.setup = function(_, opts)
  require("nvim-treesitter.configs").setup(opts)
end

return M
