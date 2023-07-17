local dashboard = require("alpha.themes.dashboard")

local logo = [[
       __   __    __       _______.___________.____    ____  __  .___  ___.
      |  | |  |  |  |     /       |           |\   \  /   / |  | |   \/   |
      |  | |  |  |  |    |   (----`---|  |----` \   \/   /  |  | |  \  /  |
.--.  |  | |  |  |  |     \   \       |  |       \      /   |  | |  |\/|  |
|  `--'  | |  `--'  | .----)   |      |  |     __ \    /    |  | |  |  |  |
 \______/   \______/  |_______/       |__|    (__) \__/     |__| |__|  |__|
]]

dashboard.section.header.val = vim.split(logo, "\n")
dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
  dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = "AlphaButtons"
  button.opts.hl_shortcut = "AlphaShortcut"
end

dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "AlphaFooter"
dashboard.opts.layout[1].val = 8

if vim.o.filetype == "lazy" then
  vim.cmd.close()
  vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
      require("lazy").show()
    end,
  })
end

require("alpha").setup(dashboard.opts)
