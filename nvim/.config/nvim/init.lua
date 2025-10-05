require("core.keymaps")
require("core.options")
require("core.snippets")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Import color theme based on environment variable NVIM_THEME
local default_color_scheme = "tokyonight"


require("lazy").setup({
  require("plugins.themes"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.lsp"),
  require("plugins.autocomplete"),
  require("plugins.copilot"),
  require("plugins.formatting"),
  require("plugins.lualine"),
  --   require("plugins.bufferline"),
  -- require("plugins.neo-tree"),
  require("plugins.indent-blanklines"),
  require("plugins.lazygit"),
  require("plugins.comment"),
  -- require("plugins.debug"),
  require("plugins.gitsigns"),
  require("plugins.misc"),
  require("plugins.aerial"),
  require("plugins.harpoon"),
  require("plugins.sidekick")
})

vim.cmd.colorscheme(default_color_scheme)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
