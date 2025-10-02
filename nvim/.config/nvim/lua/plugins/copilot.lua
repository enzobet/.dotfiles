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
  -- Enhanced Copilot Chat integration with copilot.lua
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "main",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" }, -- Updated dependency
  --     { "nvim-lua/plenary.nvim" },
  --     { "nvim-telescope/telescope.nvim" }, -- Optional: for better UI
  --   },
  --   event = "VeryLazy",
  --   build = "make tiktoken", -- Only on MacOS or Linux
  --   opts = {
  --     debug = false,
  --     show_help = "yes",
  --     auto_follow_cursor = false, -- Don't follow the cursor after getting response
  --     show_folds = true, -- Shows folds for sections in chat
  --     clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
  --     context = nil, -- Default context or array of context
  --     history_path = vim.fn.stdpath("data") .. "/copilotchat_history", -- Default path to stored history
  --     callback = nil, -- Callback to use when ask response is received
  --     
  --     -- default selection
  --     selection = function(source)
  --       return require("CopilotChat.select").visual(source) or require("CopilotChat.select").buffer(source)
  --     end,
  --
  --     prompts = {
  --       Explain = "Please explain how the following code works.",
  --       Review = "Please review the following code and provide suggestions for improvement.",
  --       Tests = "Please explain how the selected code works, then generate unit tests for it.",
  --       Refactor = "Please refactor the following code to improve its clarity and readability.",
  --       FixCode = "Please fix the following code to make it work as intended.",
  --       FixError = "Please explain the error in the following text and provide a solution.",
  --       BetterNamings = "Please provide better names for the following variables and functions.",
  --       Documentation = "Please provide documentation for the following code.",
  --       SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
  --       SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
  --       -- Custom prompts
  --       Optimize = "Please optimize the following code for better performance.",
  --       CommitStaged = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
  --     },
  --     
  --     -- default window options
  --     window = {
  --       layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
  --       width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
  --       height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
  --       -- Options below only apply to floating windows
  --       relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
  --       border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
  --       row = nil, -- row position of the window, default is centered
  --       col = nil, -- column position of the window, default is centered
  --       title = 'Copilot Chat', -- title of chat window
  --       footer = nil, -- footer of chat window
  --       zindex = 1, -- determines if window is on top or below other floating windows
  --     },
  --   },
  --   config = function(_, opts)
  --     local chat = require("CopilotChat")
  --     local select = require("CopilotChat.select")
  --     
  --     chat.setup(opts)
  --     
  --     -- Custom function to get git diff for commit messages
  --     -- opts.prompts.CommitStaged.selection = select.gitdiff
  --   end,
  --   keys = {
  --     -- Show help actions with telescope
  --     {
  --       "<leader>cch",
  --       function()
  --         local actions = require("CopilotChat.actions")
  --         require("CopilotChat.integrations.telescope").pick(actions.help_actions())
  --       end,
  --       desc = "CopilotChat - Help actions",
  --     },
  --     -- Show prompts actions with telescope
  --     {
  --       "<leader>ccp",
  --       function()
  --         local actions = require("CopilotChat.actions")
  --         require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
  --       end,
  --       desc = "CopilotChat - Prompt actions",
  --     },
  --     {
  --       "<leader>cc",
  --       "<cmd>CopilotChatToggle<cr>",
  --       desc = "CopilotChat - Toggle",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<leader>cx",
  --       "<cmd>CopilotChatReset<cr>",
  --       desc = "CopilotChat - Reset",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<leader>cs",
  --       "<cmd>CopilotChatSave<cr>",
  --       desc = "CopilotChat - Save",
  --       mode = { "n", "v" },
  --     },
  --     {
  --       "<leader>cl",
  --       "<cmd>CopilotChatLoad<cr>",
  --       desc = "CopilotChat - Load",
  --       mode = { "n", "v" },
  --     },
  --     -- Quick chat with Copilot
  --     {
  --       "<leader>cq",
  --       function()
  --         local input = vim.fn.input("Quick Chat: ")
  --         if input ~= "" then
  --           require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  --         end
  --       end,
  --       desc = "CopilotChat - Quick chat",
  --     },
  --     -- Chat with Copilot in visual mode
  --     {
  --       "<leader>cv",
  --       ":CopilotChatVisual",
  --       mode = "x",
  --       desc = "CopilotChat - Open in vertical split",
  --     },
  --     {
  --       "<leader>cx",
  --       ":CopilotChatInline<cr>",
  --       mode = "x",
  --       desc = "CopilotChat - Inline chat",
  --     },
  --     -- Generate commit message based on the git diff
  --     {
  --       "<leader>cmc",
  --       "<cmd>CopilotChatCommitStaged<cr>",
  --       desc = "CopilotChat - Generate commit message for staged changes",
  --     },
  --   },
  -- }
}
