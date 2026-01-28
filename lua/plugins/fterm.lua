-- ~/.config/nvim/lua/plugins/extra.lua
return {
  {
    "numtostr/FTerm.nvim",
    lazy = false,       -- carga bajo demanda
    event = "VeryLazy", -- o un evento como BufRead
    config = function()
      local FTerm = require("FTerm")

      _G.htop = FTerm:new({
        ft = 'fterm_htop',
        cmd = "htop",
        border = "rounded",
        dimensions = { height = 0.8, width = 0.8 },
      })

      _G.ToggleFTerm = function() _G.htop:toggle() end
    end,
  },
}

