# Neovim review follow-up: remaining items and new suggestions

This document captures what from the previous review is still pending, what has been implemented, and a few new, focused recommendations after checking the current config.

## Implemented since last review
- Telescope config scoping: picker-specific options are placed under `pickers` and shared options under `defaults` (good).
- Formatting strategy: switched to `conform.nvim` with `<leader>cf` (good). `none-ls` is not loaded anymore.
- Mason org migration: using `mason-org/mason.nvim` and `mason-org/mason-lspconfig.nvim` (good).

## Still to do from previous recommendations
1) Diagnostics toggle API misuse
- In `lua/core/keymaps.lua`, `vim.diagnostic.enable(true)` / `vim.diagnostic.enable(false)` pass booleans where buffer numbers are expected.
- Action: call with no args for global enable/disable.
  - enable: `vim.diagnostic.enable()`
  - disable: `vim.diagnostic.disable()`

2) Sidekick expr mapping may return nil
- In `lua/plugins/sidekick.lua`, the `<c-y>` mapping is `expr = true` but returns nothing in the consumed case.
- Action: return an empty string to consume the key, or set `expr = false`.
  - Example minimal fix: replace bare `return` with `return ""`.

3) Theme selection fallback/unification
- `init.lua` unconditionally sets `vim.cmd.colorscheme("tokyonight")` and does not read `NVIM_THEME`.
- `lualine.lua` reads `NVIM_THEME` but does not fall back if the env var is unknown.
- Actions:
  - Option A: Support `NVIM_THEME` in `init.lua` with a safe fallback to a default scheme.
  - Option B: Keep a single source of truth for the theme and ensure lualine falls back when the env var is not recognized.

4) Clean up disabled-but-present plugin configs (optional)
- The repo contains plugin specs not loaded by `init.lua`: `bufferline.lua`, `neo-tree.lua`, `debug.lua`, `none-ls.lua`.
- Action (one of):
  - Add `enabled = false` to their specs, or
  - Move them into `lua/plugins/disabled/` to reduce noise.

5) Python toolchain alignment
- Both `pyright` and `ruff` are installed via Mason; `conform` formats with `black` and `ruff_organize_imports`.
- Actions:
  - Decide import organization owner (ruff vs. pyright) and disable the other to avoid churn.
  - Consider `basedpyright` if you want lighter diagnostics and to delegate linting/formatting to ruff/black entirely.

6) Treesitter incremental selection keys
- Currently use `<C-Space>` / `<M-Space>` which some terminals/tmux swallow.
- Action: consider alternatives like `<leader><space>` / `<C-s>`.

7) Add dev ergonomics
- Not yet present:
  - `folke/neodev.nvim` for better Lua/Neovim config completion.
  - `b0o/schemastore.nvim` with `jsonls`/`yamlls` schemas.

8) Telescope live-grep-args (quality-of-life)
- Consider `nvim-telescope/telescope-live-grep-args.nvim` to pass ripgrep flags interactively.

9) Lazy performance options
- No `performance.rtp.disabled_plugins` configured.
- Action: disable unneeded built-in vim plugins to shave startup time (gzip, netrwPlugin, tarPlugin, tutor, etc.).

10) Keymap descriptions
- Many user-facing maps in `lua/core/keymaps.lua` lack `desc`.
- Action: add `desc` so which-key and command-line help are richer.

11) Indent guides excludes
- `indent-blankline` still excludes legacy names like `NvimTree`.
- Action: replace with the filetypes you actually use (e.g., `neo-tree`) or remove if not needed.

12) Version guard for semantic tokens tweak
- `lua/core/snippets.lua` sets `vim.hl.priorities.semantic_tokens` unguarded.
- Action: add a version/feature guard if you use multiple Neovim versions.

## New suggestions after re-review
1) Ensure LSP servers are actually set up
- `mason-lspconfig` is configured with `ensure_installed`, but there is no visible handler calling `require("lspconfig")[server].setup{}`.
- If you rely on `mason-lspconfig` default handlers, add an explicit `handlers` table to be safe and to pass `capabilities`.

2) Unify theme handling end-to-end
- Consider centralizing theme selection (colorscheme + statusline theme) off a single variable/env, with a safe fallback, so `NVIM_THEME` always works.

3) Conform configuration polish
- You can set `format_on_save` for a consistent on-save experience and extend `formatters_by_ft` for the languages you use most.

4) Optional UX additions
- Surround (kylechui/nvim-surround or mini.surround), motion (leap.nvim or folke/flash.nvim), diagnostics list (folke/trouble.nvim), terminal (akinsho/toggleterm.nvim), sessions (folke/persistence.nvim).

5) Expose transparency toggle as a command
- You already have `<leader>bg` for Catppuccin. Consider adding a user command like `:ToggleTransparency` for discoverability.

---
If you want, I can apply the quick, low-risk fixes (diagnostics toggle, Sidekick expr return, theme fallback, indent-blankline excludes, and a basic `mason-lspconfig` handler) in a small PR. Let me know which ones to proceed with.