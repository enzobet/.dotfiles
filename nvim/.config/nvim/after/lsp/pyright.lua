return {
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                ignore = { "*" }, -- ruff handles diagnostics; pyright for type-checking only
            },
        },
    },
}
