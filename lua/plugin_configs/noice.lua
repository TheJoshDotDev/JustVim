local M = {}

M.opts = function()
  return {
    cmdline = {
      view = "cmdline",
      format = {
        cmdline = { pattern = "^:", icon = "󰘳", lang = "vim" },
      },
    },
    presets = {
      bottom_search = false,
      command_palette = false,
      long_message_to_split = false,
      inc_rename = false,
    },
  }
end

return M
