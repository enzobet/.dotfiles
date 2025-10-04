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
local default_color_scheme = "catppuccin"
local env_var_nvim_theme = os.getenv("NVIM_THEME") or default_color_scheme

-- Define a table of theme modules
local themes = {
  catppuccin = "plugins.themes.catppuccin",
  -- onedark = 'plugins.themes.onedark',
}

require("lazy").setup({
  require(themes[env_var_nvim_theme]),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.lsp"),
  require("plugins.autocomplete"),
  require("plugins.copilot"),
  -- require("plugins.none-ls"),
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

vim.cmd.colorscheme(env_var_nvim_theme)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
