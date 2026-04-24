-- Copied from https://github.com/Sin-cy/dotfiles/blob/main/nvim/.config/nvim/init.lua
-- vim ui2
require('vim._core.ui2').enable({
    enable = true,
    msg = {
        target = "cmd", -- options: cmd(classic), msg(similar to noice)
        pager = { height = 1 },
        msg   = { height = 0.5, timeout = 4500 },
        dialog = { height = 0.5 },
        cmd    = { height = 0.5 },
    },
})

require('enzo.core')
require('enzo.lazy')
-- require('current-theme')
