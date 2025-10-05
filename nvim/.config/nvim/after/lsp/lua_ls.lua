return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        library = {
          "${3rd}/luv/library",
          unpack(vim.api.nvim_get_runtime_file('', true)),
        },
        checkThirdParty = false,
      },
      completion = {
        callSnippet = 'Replace',
      },
      telemetry = {
        enable = false,
      },
      diagnostics = {
        globals = {
          'vim',
          'require',
        },
      },
    },
  },
}
