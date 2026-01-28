--~/.config/nvim/lua/plugins/which-key.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 200,
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "",
    },
    win = {
      border = "rounded",
      padding = { 1, 2 },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- =========================================================
    -- REGISTRO DE GRUPOS (NO MAPPINGS REALES)
    -- =========================================================
     wk.add({
     -- =====================================================
      -- FILES / FIND
      -- =====================================================
      { "<leader>f", group = "󰱼 Find / Files" },
      { "<leader>ff", desc = "Find files" },
      { "<leader><space>", desc = "Smart picker" },
      { "<leader>ft", desc = "Toggle file explorer" },
      { "<leader>fn", desc = "Reveal file in explorer" },

      -- =====================================================
      -- BUFFERS
      -- =====================================================
      { "<leader>b", group = "󰓩 Buffers" },
      { "<leader>bb", desc = "Switch buffer" },
      { "<leader>bd", desc = "Delete buffer" },

      -- =====================================================
      -- GIT
      -- =====================================================
      { "<leader>g", group = "󰊢 Git" },
      { "<leader>gg", desc = "LazyGit" },

      -- =====================================================
      -- LSP
      -- =====================================================
      { "<leader>l", group = "󰒋 LSP" },
      { "<leader>lr", desc = "Rename symbol" },
      { "<leader>la", desc = "Code action" },
      { "<leader>ld", desc = "Go to definition" },
      { "<leader>lD", desc = "Go to declaration" },
      { "<leader>li", desc = "Go to implementation" },
      { "<leader>lh", desc = "Hover documentation" },
      { "<leader>ls", desc = "Signature help" },
      { "<leader>lf", desc = "Format buffer" },

      -- =====================================================
      -- SNACKS / UI
      -- =====================================================
      { "<leader>s", group = "󰙵 Snacks / UI" },
      { "<leader>sx", desc = "Scratch buffer" },
      { "<leader>sz", desc = "Zen mode" },

      -- =====================================================
      -- PLUGINS / SYSTEM
      -- =====================================================
      { "<leader>p", group = "󰏖 Plugins" },
      { "<leader>pp", desc = "Lazy plugin manager" },

      -- REST API
      { "<leader>x", group = "API"},
      { "<leader>xr", desc = "REST API"},
      -- =====================================================
      -- FILE ACTIONS
      -- =====================================================
      { "<leader>w", desc = "Save file" },
      { "<leader>q", desc = "Quit" },
    })
      end,
}

