return {
  "folke/sidekick.nvim",
  opts = {
    -- add any options here
    cli = {
      mux = {
        backend = "tmux",
        enabled = false,
      },
    },
  },
  keys = {
    {
      "<c-y>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if require("sidekick").nes_jump_or_apply() then
          return "" -- jumped or applied
        end

        -- if you are using Neovim's native inline completions
        if vim.lsp.inline_completion.get() then
          return ""
        end

        -- any other things (like snippets) you want to do on <tab> go here.

        return "<C-y>"
      end,
      mode = { "i", "n" },
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<c-.>",
      function()
        require("sidekick.cli").focus()
      end,
      mode = { "n", "x", "i", "t" },
      desc = "Sidekick Switch Focus",
    },
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle({ focus = true })
      end,
      desc = "Sidekick Toggle CLI",
      mode = { "n", "v" },
    },
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      desc = "Sidekick Ask Prompt",
      mode = { "n", "v" },
    },
  },
}
