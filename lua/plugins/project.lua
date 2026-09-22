-- plugins/project.lua
-- Detección automática de proyectos + Telescope integration
return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup({
      detection_methods = { "pattern", "lsp" },
      patterns = { ".git", "docker-compose.yml", "docker-compose.yaml", "Makefile", "go.mod", "pyproject.toml", "Cargo.toml", "package.json", "terraform.tfstate" },
      show_hidden = true,
      silent_chdir = true,
      ignore_lsp = { "null-ls" },
    })

    -- Integración con Telescope
    pcall(require("telescope").load_extension, "projects")

    local map = vim.keymap.set
    map("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Find projects" })
  end,
}