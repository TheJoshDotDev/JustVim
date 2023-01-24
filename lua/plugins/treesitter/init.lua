local treesitter_opts = require('plugins.treesitter.config.opts').nvimtreesitter_opts
local nvim_treesitter_conf = require('plugins.treesitter.config.nvim-treesitter')
return {
  'nvim-treesitter/nvim-treesitter',
  build = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
  end,

  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = treesitter_opts,
  config = nvim_treesitter_conf.setup,
}
