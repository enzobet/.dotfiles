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
  -- require("plugins.none-ls"),
  require("plugins.lualine"),
  require("plugins.bufferline"),
  require("plugins.neo-tree"),
  require("plugins.alpha"),
  require("plugins.indent-blanklines"),
  require("plugins.lazygit"),
  require("plugins.comment"),
  require("plugins.debug"),
  require("plugins.gitsigns"),
  require("plugins.misc"),
  require("plugins.aerial"),
  require("plugins.harpoon"),
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

vim.cmd.colorscheme(env_var_nvim_theme)

-- Function to check if a file exists
local function file_exists(file)
  local f = io.open(file, "r")
  if f then
    f:close()
    return true
  else
    return false
  end
end

-- Path to the session file
local session_file = ".session.vim"

-- Check if the session file exists in the current directory
if file_exists(session_file) then
  -- Source the session file
  vim.cmd("source " .. session_file)
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
