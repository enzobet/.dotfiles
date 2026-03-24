-- Easily comment visual regions/lines
local is_vscode = vim.g.vscode ~= nil

return {
	"numToStr/Comment.nvim",
    cond = not is_vscode,
	opts = {},
	config = function()
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<C-c>", require("Comment.api").toggle.linewise.current, opts)
		vim.keymap.set(
			"v",
			"<C-c>",
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
			opts
		)
	end,
}
