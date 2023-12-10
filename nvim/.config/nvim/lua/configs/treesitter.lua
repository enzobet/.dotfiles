
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'python', 'markdown', 'json', 'tsx', 'terraform', 'toml', 'yaml' },

  sync_install = false,

  auto_install = false,

  ignore_install = {},

  highlight = {
    enable = true,
  },
})
