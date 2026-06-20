return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-l>", -- acepta la sugerencia
          next = "<C-]>",
          prev = "<C-[>",
          dismiss = "<C-c>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          open = "<C-p>",
          close = "<C-c>",
          accept = "<C-l>",
        },
      },
    })
  end,
}
