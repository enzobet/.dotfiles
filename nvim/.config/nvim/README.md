# NeoVim configuration

This project contains the NeoVim configuration I am currently using and will probably be outdated at times.

I will try and update the README with the configuration details as I make the changes.

## Plugins

The following plugins are used within this configuration.

Most plugins are split into their own Lua files. These can be found in the [lua/plugins](./lua/plugins) directory.  
Configuration for the plugins can be found in the [lua/configs](./lua/configs) directory.

### General

- [tpope/vim-sleuth](https://github.com/tpope/vim-sleuth)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- [lukas-reineke/indent-blankline.nvim](lukas-reineke/indent-blankline.nvim)
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

### Autocomplete

- [hrsh7th/nvim-cmp](hrsh7th/nvim-cmp)
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

### Debugging

- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [mfussenegger/nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)
- [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)

### Searching

- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)

### Git

- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

### LSP

- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim)
- [folke/neodev.nvim](https://github.com/folke/neodev.nvim)

### Status Line

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

### Directory Tree

- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

### Themes

- [navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim)
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [rose-pine/neovim](https://github.com/rose-pine/neovim)

### Code highlighting

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)

## Key bindings

These are mostly the keybindings I have set. I am not exactly using all of them, and this is primarily for me to document what keybindings I have so that I can figure out which ones I am actually using.

### Fuzzy Finder

| Mode | Binding | Description |
| - | - | - |
| Normal | <leader>sf | [S]earch [F]iles |
| Normal | <leader>sb | [S]earch [B]uffers |
| Normal | <leader>sd | [S]earch [D]iagnostics |
| Normal | <leader>st | [S]earch [T]abs |
| Normal | <leader>gf | Search [G]it [F]iles |
| Normal | <leader>gs | [G]it [S]tatus |

### Debgging

| Mode | Binding | Description |
| - | - | - |
| Normal | <F5> | Start debugging or Continue debugger |
| Normal | <F6> | Step over |
| Normal | <F7> | Step into |
| Normal | <F8> | Step out |
| Normal | <leader>ab | Toggle [B]reakpoint |
| Normal | <leader>aB | Set [B]reakpoint |

## Auto complete

| Mode | Binding | Description |
| - | - | - |
| Insert & Select | <C-n> | Select next item |
| Insert & Select | <C-p> | Select previous item |
| Insert & Select | <C-d> | Scroll docs down 4 lines |
| Insert & Select | <C-f> | Scroll docs up 4 lines |
| Insert & Select | <C-Space> | Complete |
| Insert & Select | <CR> / Enter | Confirm |
| Insert & Select | <Tab> | Select next item / Expand or Jump Luasnip |
| Insert & Select | <S-Tab> | Select previous item / Jump to previous Luasnip |

## LSP

| Mode | Binding | Description |
| - | - | - |
| Normal | <leader>rn | [R]e[n]ame |
| Normal | <leader>ca | [C]ode [A]ction |
| Normal | gd | [G]oto [D]efinition |
| Normal | gr | [G]oto [R]eferences |
| Normal | gI | [G]oto [I]mplementation |
| Normal | <leader>D | Type [D]efinition |
| Normal | <leader>ds | [D]ocument [S]ymbols |
| Normal | <leader>ws | [W]orkspace [S]ymbols |
| Normal | K | Hover Documentation |
| Normal | <C-k> | Signature Documentation |
| Normal | [d | Go to next diagnostic |
| Normal | ]d | Go to previous diagnostic |
| Normal | <leader>vd | Show diagnostic |
| Normal | gD | [G]oto [D]eclaration |
| Normal | <leader>wa | [W]orkspace [A]dd Folder |
| Normal | <leader>wr | [W]orkspace [R]emove Folder |
| Normal | <leader>wl | [W]orkspace [L]ist Folders |

## Nvim Tree

These are a subset of the standard keybindings I would / do use.  
I primarily use the fuzzy finder as I find it quicker.

| Mode | Binding | Description |
| - | - | - |
| Normal | <leader>e | Toggle Tree |
| Normal | <C-t> | Open: New Tab |
| Normal | <C-v> | Open: Vertical Split |
| Normal | <C-x> | Open: Horizontal Split |
| Normal | <BS> | Close Directory |
| Normal | <CR> | Open |
| Normal | <Tab> | Open Preview |
| Normal | d | Delete |
| Normal | D | Trash |
| Normal | o | Open |
| Normal | O | Open: No Window Picker |
| Normal | q | Close |
| Normal | r | Rename |
| Normal | R | Refresh |
| Normal | u | Rname: Full Path |
| Normal | W | Collapse |

