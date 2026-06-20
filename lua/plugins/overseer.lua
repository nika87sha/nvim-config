-- plugins/overseer.lua
-- Task runner para DevOps: Make, Ansible, Terraform, Docker Compose, etc.
-- https://github.com/stevearc/overseer.nvim
return {
  "stevearc/overseer.nvim",
  lazy = false,
  opts = {},
  config = function()
    require("overseer").setup({
      templates = {
        "builtin",
        "user",
      },
      -- Detectar automáticamente task runners por proyecto
      task_list = {
        direction = "bottom",
        min_height = 10,
        max_height = 20,
        default_detail = 1,
      },
    })

    -- Atajos para tareas
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Run task (elige de la lista)
    map("n", "<leader>rr", "<cmd>OverseerRun<CR>", { desc = "Run task" })
    -- Toggle task list
    map("n", "<leader>rl", "<cmd>OverseerToggle<CR>", { desc = "Task list toggle" })
    -- Quick actions
    map("n", "<leader>ra", "<cmd>OverseerTaskAction<CR>", { desc = "Task action" })
    -- Build project (task builder)
    map("n", "<leader>rb", "<cmd>OverseerBuild<CR>", { desc = "Build project" })
    -- Load last task
    map("n", "<leader>rL", "<cmd>OverseerLoadLast<CR>", { desc = "Load last task" })
  end,
}
