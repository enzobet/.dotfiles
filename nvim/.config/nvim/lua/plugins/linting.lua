local is_vscode = vim.g.vscode ~= nil

return {
    "mfussenegger/nvim-lint",
    cond = not is_vscode,
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            javascript      = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescript      = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            makefile        = { "checkmake" },
        }
        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
