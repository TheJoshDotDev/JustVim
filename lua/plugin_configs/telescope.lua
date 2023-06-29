local M = {}

M.keys = function()
  return {
    { "<leader>sh", false },
    { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
  }
end

M.opts = function()
  return {
    defaults = {
      layout_strategy = "horizontal",
      sorting_strategy = "ascending",
      layout_config = {
        height = 0.7,
        width = 0.6,
        prompt_position = "top",
      },
    },
  }
end

return M
