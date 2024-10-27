return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
		})

		local toggle_bg = function()
			local cat = require("catppuccin")
			cat.options.transparent_background = not cat.options.transparent_background
			cat.compile()
			vim.cmd.colorscheme(vim.g.colors_name)
		end

		vim.keymap.set("n", "<leader>bg", toggle_bg, { noremap = true, silent = true })
	end,
}
