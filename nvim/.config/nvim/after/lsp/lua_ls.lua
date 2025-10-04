return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
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
