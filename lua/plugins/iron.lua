return {
  "Vigemus/iron.nvim",
  lazy = false, -- Carga el plugin al inicio
  config = function()
    local iron = require("iron.core")
    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          python = { command = { "python3" } },
        },
        repl_open_cmd = "vertical botright 60 vsplit",
      },
      keymaps = {
        -- Utilitzam <C-h> per evitar conflicte amb Copilot i el flux del terminal
        send_line = "<C-h>",
        visual_send = "<C-h>",
        send_file = "<C-f>",
        send_until_cursor = "<C-u>",
        cr = "<C-c>",
        interrupt = "<C-x>",
        exit = "<C-q>",
        clear = "<C-l>",
      },
    })
    -- Mapeig principal: leader + i per obrir REPL
    vim.keymap.set("n", "<leader>ir", "<cmd>IronRepl<cr>", { desc = "Iron Repl" })
    -- Leader + h = Enviar línia al REPL (sobreescriure hide)
    vim.keymap.set("n", "<leader>ih", "<cmd>IronSend<cr>", { desc = "Iron Send Line/Visual" })
  end,
}