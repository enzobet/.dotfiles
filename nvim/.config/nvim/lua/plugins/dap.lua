return {
  {
    "mfussenegger/nvim-dap"
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require('dap-python').setup('~/.pyenv/versions/3.9.16/bin/python')
      require('dap.ext.vscode').load_launchjs()
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap-python" },
    config = function()
      require('dapui').setup()
    end
  }
}
-- vim: ts=2 sts=2 sw=2 et
