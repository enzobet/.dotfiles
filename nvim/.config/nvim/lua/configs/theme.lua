
require('tokyonight').setup({
  transparent = true,
  styles = {
    comments = { italic = true },
    -- variables = { bold = true },
    functions = { bold = true },
  },
})

require('onedark').setup({
  transparent = true,
  code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'bold',
        strings = 'none',
        variables = 'italic'
    },
})

vim.cmd[[colorscheme tokyonight]]

-- vim: ts=2 sts=2 sw=2 et
