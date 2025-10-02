return {
  -- LSP-based Copilot implementation
  {
    "zbirenbaum/copilot.lua",
    -- dependencies = {
    --     {
    --         "copilotlsp-nvim/copilot-lsp",
    --         init = function()
    --             vim.g.copilot_nes_debounce = 500
    --         end,
    --     }
    -- },
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-y>",
            accept_word = false,
            accept_line = false,
            next = "<C-n>",
            prev = "<C-p>",
            dismiss = "<C-e>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {
          settings = {
            telemetry = {
              telemetryLevel = "off",
            },
          },
        },
      })
      
      -- Alternative keybinding (keeping your Alt+j preference)
      vim.keymap.set("i", "<M-j>", function()
        if require("copilot.suggestion").is_visible() then
          require("copilot.suggestion").accept()
        end
      end, {
        desc = "Accept Copilot suggestion"
      })
    end,
  },
}
