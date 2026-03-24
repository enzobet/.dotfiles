local is_vscode = vim.g.vscode ~= nil

return {
	"lukas-reineke/indent-blankline.nvim",
    cond = not is_vscode,
	main = "ibl",
	opts = {
		indent = {
			char = "▏",
		},
		scope = {
			show_start = false,
			show_end = false,
			show_exact_scope = false,
		},
		exclude = {
			filetypes = {
				"help",
				"startify",
				"dashboard",
				"packer",
				"neogitstatus",
				"NvimTree",
				"Trouble",
			},
		},
	},
}
