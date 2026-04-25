return {
	"nvim-lua/plenary.nvim", -- functions multiple plugins need
	-- fixes the well know nvim bug
	{
		"folke/lazydev.nvim",
		ft = "lua",
		priority = 1000,
		opts = {
			library = {
				{
					path = "${3rd}/plenary.nvim/lua",
					words = { "plenary" },
				},
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
