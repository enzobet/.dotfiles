
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable backup files
vim.go.backup = false

-- Disable search highlighting of all found matches
vim.o.hlsearch = false

-- Line numers
vim.wo.number = true
-- Relative numbers
vim.wo.relativenumber = true
-- Highlight the cursorline
vim.wo.cursorline = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim
vim.o.clipboard = 'unnamedplus'

-- Enable break indent. Basically when a line is wrapped, it is indented on the next line
vim.o.breakindent = true

-- Case insensitive searching unless \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep sign column
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Keep at least 30 lines buffer between top and bottom of screen
vim.o.scrolloff = 30

-- Disable netrw for nvim-tree to work
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim: ts=2 sts=2 sw=2 et
