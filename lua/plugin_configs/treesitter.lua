local M = {}

M.opts = function(_, opts)
  table.insert(opts.ensure_installed, "jsdoc")
end

return M
