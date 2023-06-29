local M = {}

M.keys = function()
  return {
    { "<leader>zz", "<cmd>ZenMode<cr>" },
  }
end

M.otps = function()
  return {
    window = {
      backdrop = 0.95,
      width = 140,
      options = {
        cursorline = true,
      },
    },
  }
end

return M
