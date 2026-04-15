local is_vscode = vim.g.vscode ~= nil

return {
    "stevearc/conform.nvim",
    cond = not is_vscode,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function() require("conform").format({ async = true }) end,
            mode = "",
            desc = "[C]ode [F]ormat",
        },
    },
    opts = {
        formatters_by_ft = {
            lua        = { "stylua" },
            python     = { "ruff_organize_imports", "ruff_format" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            json       = { "prettier" },
            yaml       = { "prettier" },
            markdown   = { "prettier" },
            html       = { "prettier" },
            css        = { "prettier" },
            terraform  = { "terraform_fmt" },
            sh         = { "shfmt" },
            toml       = { "taplo" },
        },
        formatters = {
            prettier = {
                prepend_args = { "--single-quote" },
            },
        },
        default_format_opts = { lsp_format = "never" },
        format_on_save = { timeout_ms = 500 },
    },
}
