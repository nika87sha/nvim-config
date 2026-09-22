-- plugins/todo-comments.lua
-- Highlight TODO, FIXME, NOTE, HACK en código y configs
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufReadPost",
  config = function()
    require("todo-comments").setup({
      signs = true,
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏱ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        DEPLOY = { icon = " ", color = "deploy", alt = { "DEPLOYMENT", "RELEASE" } },
        SECURITY = { icon = " ", color = "security", alt = { "SEC", "VULN", "CVE" } },
      },
      colors = {
        deploy = { "#f5c2e7" },
        security = { "#f38ba8" },
      },
    })

    local map = vim.keymap.set
    map("n", "<leader>xt", "<cmd>TodoTelescope<CR>", { desc = "TODO comments (Telescope)" })
    map("n", "<leader>xT", "<cmd>TodoTrouble<CR>", { desc = "TODO comments (Trouble)" })
  end,
}