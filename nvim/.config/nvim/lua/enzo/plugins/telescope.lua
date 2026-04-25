return {
	"nvim-telescope/telescope.nvim",
	branch = "master", -- using master to fix issues with deprecated to definition warnings 
    -- '0.1.x' for stable ver.
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"andrew-george/telescope-themes",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.load_extension("fzf")
		telescope.load_extension("themes")

		telescope.setup({
			defaults = {
				-- path_display = { "smart" },
                path_display = {
                    filename_first = {
                        reverse_directories = true,
                    },
                },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
            pickers = {
                find_files = {
                    file_ignore_patterns = { "node_modules", ".git/", ".venv" },
                    hidden = true,
                },
            },
			extensions = {
				themes = {
					enable_previewer = true,
					enable_live_preview = true,
					persist = {
						enabled = true,
						path = vim.fn.stdpath("config") .. "/lua/current-theme.lua",
					},
				},
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]existing [B]uffers" })
		vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "[S]earch [M]arks" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]resume" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

		vim.keymap.set("n", "<leader>ths", "<cmd>Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })
    end,
}
