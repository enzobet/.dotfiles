
local function _on_attach(buffnr)
  local api = require("nvim-tree.api")

  local  function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = buffnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(buffnr)


  vim.keymap.set('n', '<S-k>', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))

end

vim.keymap.set('n', '<leader>e', require('nvim-tree.api').tree.toggle, { desc = 'Toggle Tree' })

require("nvim-tree").setup({
  on_attach = _on_attach,
  -- renderer = {
  --   highlight_git = true,
  -- },
  filters = {
    git_ignored = true,
    dotfiles = false,
    exclude = {
      ".env",
    },
  },
})



-- vim: ts=2 sts=2 sw=2 et
