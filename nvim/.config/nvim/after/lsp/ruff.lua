return {
    settings = {
        lineLength = 100,
        format = {
            preview = true,
        },
    },
    commands = {
        RuffAutofix = {
            function()
                vim.lsp.buf.execute_command({
                    command = "ruff.applyAutofix",
                    arguments = {
                        { uri = vim.uri_from_bufnr(0) },
                    },
                })
            end,
            description = "Ruff: Fix all auto-fixable problems",
        },
        RuffOrganizeImports = {
            function()
                vim.lsp.buf.execute_command({
                    command = "ruff.applyOrganizeImports",
                    arguments = {
                        { uri = vim.uri_from_bufnr(0) },
                    },
                })
            end,
            description = "Ruff: Format imports",
        },
    },
}
