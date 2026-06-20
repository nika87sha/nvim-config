-- plugins/dadbod-ui.lua
-- Interfaz gráfica para vim-dadbod (explorador de bases de datos)
-- https://github.com/kristijanhusak/vim-dadbod-ui
return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
  },
  init = function()
    -- Atajo para abrir el explorador de BD
    vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<CR>", { desc = "Database browser" })
    -- Atajo para add connection
    vim.keymap.set("n", "<leader>dba", "<cmd>DBUIAddConnection<CR>", { desc = "Database: add connection" })
  end,
  config = function()
    -- Las conexiones se definen en ~/.local/share/dadbod-ui/connections.json
    -- o directamente en el buffer con:
    -- :DBUIAddConnection postgresql://user:pass@host:port/dbname
  end,
}
