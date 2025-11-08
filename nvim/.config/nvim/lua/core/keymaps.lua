-- Keymaps for better default experiencekey

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true, desc = "Disable space key (use as leader)" })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move up by screen line when wrapped" })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Move down by screen line when wrapped" })

-- clear highlights
vim.keymap.set("n", "<Esc>", ":noh<CR>", vim.tbl_extend("force", opts, { desc = "Clear search highlights" }))

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', vim.tbl_extend("force", opts, { desc = "Delete char without yanking" }))

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Half-page down and center" }))
vim.keymap.set("n", "<C-u>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Half-page up and center" }))

-- Find and center
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", vim.tbl_extend("force", opts, { desc = "Decrease window height" }))
vim.keymap.set("n", "<Down>", ":resize +2<CR>", vim.tbl_extend("force", opts, { desc = "Increase window height" }))
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", vim.tbl_extend("force", opts, { desc = "Decrease window width" }))
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", vim.tbl_extend("force", opts, { desc = "Increase window width" }))

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous buffer" }))
vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", vim.tbl_extend("force", opts, { desc = "Close buffer" })) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", vim.tbl_extend("force", opts, { desc = "New buffer" })) -- new buffer

-- Increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", vim.tbl_extend("force", opts, { desc = "Increment number" })) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", vim.tbl_extend("force", opts, { desc = "Decrement number" })) -- decrement

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", vim.tbl_extend("force", opts, { desc = "Split window vertically" }))      -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", vim.tbl_extend("force", opts, { desc = "Split window horizontally" }))      -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", vim.tbl_extend("force", opts, { desc = "Make splits equal size" }))     -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", vim.tbl_extend("force", opts, { desc = "Close current split" })) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", vim.tbl_extend("force", opts, { desc = "Focus split up" }))
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", vim.tbl_extend("force", opts, { desc = "Focus split down" }))
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", vim.tbl_extend("force", opts, { desc = "Focus split left" }))
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", vim.tbl_extend("force", opts, { desc = "Focus split right" }))

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", vim.tbl_extend("force", opts, { desc = "Open new tab" }))   -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", vim.tbl_extend("force", opts, { desc = "Close current tab" })) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", vim.tbl_extend("force", opts, { desc = "Next tab" }))     --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", vim.tbl_extend("force", opts, { desc = "Previous tab" }))     --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", vim.tbl_extend("force", opts, { desc = "Toggle line wrap" }))

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", vim.tbl_extend("force", opts, { desc = "Indent left and keep selection" }))
vim.keymap.set("v", ">", ">gv", vim.tbl_extend("force", opts, { desc = "Indent right and keep selection" }))

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", vim.tbl_extend("force", opts, { desc = "Move line down" }))
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", vim.tbl_extend("force", opts, { desc = "Move line up" }))

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', vim.tbl_extend("force", opts, { desc = "Paste over selection without yanking" }))

-- Replace word under cursor
vim.keymap.set("n", "<leader>j", "*``cgn", vim.tbl_extend("force", opts, { desc = "Change next occurrence of word under cursor" }))

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set("n", "<leader>do", function()
    diagnostics_active = not diagnostics_active

    if diagnostics_active then
        vim.diagnostic.enable(true)
    else
        vim.diagnostic.enable(false)
    end
end, { desc = "Toggle diagnostics" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Save and load session
-- vim.keymap.set("n", "<leader>ss", ":Neotree close<CR>:mksession! .session.vim<CR>", { noremap = true, silent = false })
-- vim.keymap.set("n", "<leader>sl", ":source .session.vim<CR>", { noremap = true, silent = false })
