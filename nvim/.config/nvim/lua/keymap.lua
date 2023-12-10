
vim.keymap.set('n', '<leader>sf', require('fzf-lua').files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sb', require('fzf-lua').buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>sg', require('fzf-lua').grep, { desc = '[S]earch [G]rep' })
vim.keymap.set('n', '<leader>sd', require('fzf-lua').diagnostics_document, { desc = '[S]search [D]iagnostics' })
vim.keymap.set('n', '<leader>st', require('fzf-lua').tabs, { desc = '[S]earch [T]abs' })
vim.keymap.set('n', '<leader>gf', require('fzf-lua').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>gs', require('fzf-lua').git_status, { desc = '[G]it [S]tatus' })

-- Debugger
vim.keymap.set('n', '<F5>', require('dap').continue, { desc = 'Start or Continue Debugger' })
vim.keymap.set('n', '<F6>', require('dap').step_over, { desc = 'Step over' })
vim.keymap.set('n', '<F7>', require('dap').step_into, { desc = 'Step into' })
vim.keymap.set('n', '<F8>', require('dap').step_out, { desc = 'Step out' })
vim.keymap.set('n', '<leader>ab', require('dap').toggle_breakpoint, { desc = 'Toggle [B]reakpoint' })
vim.keymap.set('n', '<leader>aB', require('dap').set_breakpoint, { desc = 'Set [B]reakpoint' })


-- vim.keymap.set({'n', 'v'}, '<Leader>ah', function()
--   require('dap.ui.widgets').hover()
-- end, { desc = 'Hover wdiget' })
-- vim.keymap.set({'n', 'v'}, '<Leader>ap', function()
--   require('dap.ui.widgets').preview()
-- end, { desc = 'Preview widget' })
-- vim.keymap.set('n', '<Leader>af', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.frames)
-- end, { desc = 'Show frames' })
-- vim.keymap.set('n', '<Leader>as', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.scopes)
-- end, { desc = 'Show scopes' })

-- vim: ts=2 sts=2 sw=2 et
