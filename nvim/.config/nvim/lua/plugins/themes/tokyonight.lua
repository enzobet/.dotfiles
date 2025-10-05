return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup({
            transparent = true,
            on_colors = function(colors)
                colors.comment = "#5c6370"
                colors.hint = colors.orange
            end,
        })
    end,
}
