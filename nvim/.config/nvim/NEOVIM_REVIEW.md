# Neovim configuration review and recommendations

This is a focused review of the current Neovim setup under nvim/.config/nvim. Overall, it’s clean, modular, and centered around lazy.nvim. Below are concrete, low-risk improvements and a few optional enhancements you can adopt over time.

## Highlights
- Good project structure: lua/core for settings and lua/plugins per-plugin config.
- lazy.nvim bootstrap and lockfile present.
- Thoughtful keymaps and sensible defaults (relative numbers, splits, etc.).
- Solid core plugin set (Telescope, Treesitter, LSP, gitsigns, lualine, catppuccin, which-key, etc.).

## Quick wins (small, high impact)

1) Harden theme selection fallback
- Today, NVIM_THEME must match a key in the themes table; otherwise require(themes[...]) will error.
- Suggest defaulting to the configured default_color_scheme when an unknown env var is provided.

Example diff (init.lua):
```lua
local default_color_scheme = "catppuccin"
local env_var_nvim_theme = os.getenv("NVIM_THEME") or default_color_scheme
local themes = {
  catppuccin = "plugins.themes.catppuccin",
}

local theme_module = themes[env_var_nvim_theme] or themes[default_color_scheme]
require("lazy").setup({
  require(theme_module),
  -- ...
})

vim.cmd.colorscheme(env_var_nvim_theme or default_color_scheme)
```

2) Fix diagnostics toggle API usage
- In core/keymaps.lua the toggle uses vim.diagnostic.enable(true) and vim.diagnostic.disable(false). These boolean arguments are interpreted as buffer IDs and are not intended here.
- Use nil (global) or the current buffer explicitly.

Recommended change:
```lua
vim.keymap.set("n", "<leader>do", function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.enable() -- enable globally
  else
    vim.diagnostic.disable() -- disable globally
  end
end)
```

3) Telescope: move picker-specific configs under pickers and defaults
- In plugins/telescope.lua, keys like live_grep, git_files and path_display are specified at the top level. Telescope only consumes defaults, pickers, extensions at the root.
- Move path_display into defaults, and live_grep / git_files under pickers so settings actually apply.

Example shape:
```lua
require("telescope").setup({
  defaults = {
    mappings = { ... },
    path_display = { filename_first = { reverse_directories = true } },
  },
  pickers = {
    find_files = { ... },
    buffers = { ... },
    live_grep = {
      file_ignore_patterns = { "node_modules", ".git", ".venv" },
      additional_args = function(_) return { "--hidden" } end,
    },
    git_files = { previewer = true },
  },
  extensions = { ... },
})
```

4) Sidekick keymap: expr mapping returns nothing
- The <c-y> mapping in plugins/sidekick.lua sets expr = true but the function does not return a string when falling through. Expression mappings must return a string of keys to feed or be non-expr.
- Either set expr = false or return "<C-y>" (or your intended fallback) explicitly.

Minimal fix:
```lua
keys = {
  {
    "<c-y>",
    function()
      if require("sidekick").nes_jump_or_apply() then
        return ""  -- consumed
      end
      return "<C-y>" -- fallback (or remove expr=true to just call the function)
    end,
    mode = { "i", "n" },
    expr = true,
  },
}
```

5) Resolve duplicate formatter mapping
- <leader>cf is mapped in both plugins/lsp.lua and plugins/none-ls.lua. Choose one source of truth (LSP or none-ls) to avoid confusing rebindings. If you plan to keep none-ls disabled, keep the LSP mapping only.

6) Clean up disabled-but-present plugin configs
- The repo contains plugin files that are not loaded (commented out in init.lua): bufferline.lua, neo-tree.lua, debug.lua, none-ls.lua.
- Options:
  - Move them into lua/plugins/disabled/ to reduce noise, or
  - Convert them to lazy plugin specs with enabled = false so they’re explicitly off but discoverable.

Example header change:
```lua
return {
  "akinsho/bufferline.nvim",
  enabled = false,
  -- ...
}
```

## LSP and tooling

7) Mason org migration or pinning
- lsp.lua mentions TODO to move to mason-org. If/when you migrate, update repos to:
  - mason-org/mason.nvim
  - mason-org/mason-lspconfig.nvim
- Alternatively, pin williamboman repos to known working commits/tags to avoid surprises until you migrate.

8) Add Neovim/Lua dev ergonomics
- neodev: better completion and docs for your Neovim config and plugins
- schemastore: JSON/YAML validation and completion

Suggested additions:
```lua
{ "folke/neodev.nvim", opts = {} },
{ "b0o/schemastore.nvim" },
-- in jsonls setup
jsonls = {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
},
```

9) Python: ruff + pyright alignment
- You have ruff LSP enabled, and pyright also enabled. Consider deciding who formats/organizes imports to avoid conflicts.
- If you want formatting via ruff_format/ruff and diagnostics via ruff-lsp, consider disabling pyright’s organize imports or use basedpyright with tuned settings.

10) Formatting strategy
- You already have none-ls configured but not loaded. If you prefer tool-per-language formatting without a shim layer, consider conform.nvim for a simple formatter runner. Otherwise, re-enable none-ls and keep format-on-save in one place only.

## Treesitter

11) Keymap ergonomics in terminals
- Incremental selection uses <C-Space> which can be swallowed by some terminals/tmux. Consider an alternative like <leader><space> or <C-s>.

12) Keep ensure_installed lean
- The current list is comprehensive. If startup/network time matters, trim languages you never edit; auto_install = true will grab missing parsers as needed.

## Telescope UX

13) Consider adding telescope-live-grep-args
- Allows on-the-fly args (e.g., -t type, -g glob) and quoting. Great productivity boost.
```lua
{ "nvim-telescope/telescope-live-grep-args.nvim" }
-- then load extension and map a key
```

## UI/UX polish

14) Lazy performance options
- lazy.nvim can disable some built-in Vim plugins to reduce startup time.
```lua
require("lazy").setup({
  -- specs...
}, {
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "matchit", "matchparen", "netrwPlugin",
        "tarPlugin", "tohtml", "tutor", "zipPlugin",
      },
    },
  },
})
```

15) Statusline: add LSP status and recording indicator
- You already use fidget.nvim for LSP progress; you can add a little LSP attached indicator and record status to lualine if desired.

16) Optional lightweight additions
- surround: easy change of quotes/brackets (kylechui/nvim-surround or echasnovski/mini.surround)
- motion: leap.nvim or folke/flash.nvim for quick navigation
- diagnostics list: folke/trouble.nvim complements Telescope diagnostics
- terminal: akinsho/toggleterm.nvim for a consistent terminal UX
- sessions: folke/persistence.nvim to autosave/restore sessions

## Consistency and housekeeping

17) Consistent keymap descriptions
- You already describe many mappings. Consider adding desc to all user-facing maps; which-key will show richer hints.

18) Transparent background toggle
- Nice touch in the catppuccin config. Consider exposing a command (e.g., :ToggleTransparency) via vim.api.nvim_create_user_command for discoverability.

19) Indent guides exclude list
- In indent-blankline excludes, replace legacy names (e.g., NvimTree) with current ones you actually use (neo-tree) to keep intent clear.

20) Version guards
- core/snippets.lua sets vim.hl.priorities.semantic_tokens which is fine, but consider guarding by vim.fn.has("nvim-0.9")/0.10 if you share config across machines.

## What to remove or consolidate (optional)
- If you are committed to Telescope file_browser, you may not need a full tree (neo-tree). If you keep both, consider <leader>e for tree and <leader>fb for browser like you have now.
- If you don’t actively debug in Neovim, disabling nvim-dap and friends will reduce footprint. Keep the file but mark enabled=false.

---

If you want, I can make any of the quick-win edits for you (theme fallback, diagnostics toggle, Telescope config scoping, and Sidekick expr fix) as a small PR in this repo. Let me know which ones to apply.