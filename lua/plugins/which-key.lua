-- ~/.config/nvim/lua/plugins/which-key.lua
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
      { "<leader>a", group = " AI" },
      { "<leader>ap", group = " Prompts" },

      { "<leader>c", group = " Code" },

      { "<leader>e", group = " Edit / Explorer" },
      { "<leader>ec", group = " Edit Configs" },

      { "<leader>f", group = " Find" },

      { "<leader>g", group = " Git" },
      { "<leader>gt", group = "󰊢 Git Toggle" },

      { "<leader>r", group = " Refactor" },

      { "<leader>w", desc = "Save file" },
      { "<leader>q", desc = "Quit" },
      { "<leader>x", desc = "Save & Quit" },

      { "<leader>pp", desc = "Plugins (Lazy)" },

      -- Explorador (nvim-tree)
      { "<leader>ee", desc = "Toggle file explorer" },
      { "<leader>ef", desc = "Reveal file in tree" },

      -- Telescope / FZF
      { "<leader>ff", desc = "Find files" },
      { "<leader>fg", desc = "Live grep" },
      { "<leader>fb", desc = "Buffers" },
      { "<leader>fh", desc = "Help" },

      -- Git (descripciones claras)
      { "<leader>ga", desc = "Stage hunk" },
      { "<leader>gr", desc = "Reset hunk" },
      { "<leader>gb", desc = "Blame line" },
      { "<leader>gd", desc = "Diff this" },
      { "<leader>gp", desc = "Git pull" },
      { "<leader>gP", desc = "Git push" },
      { "<leader>gc", desc = "Git commit" },
      { "<leader>gg", desc = "LazyGit" },

      -- Refactor / LSP
      { "<leader>rr", desc = "Rename symbol" },
      { "<leader>ra", desc = "Search (Spectre)" },
      { "<leader>rb", desc = "Search in file" },
      { "<leader>rw", desc = "Search word" },
      { "<leader>rd", desc = "Go to definition" },
    })
  end,
}

