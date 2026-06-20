-- ~/.config/nvim/lua/plugins/fterm.lua
-- Terminal flotante para htop (útil para DevOps/SysAdmin)
return {
  "numtostr/FTerm.nvim",
  lazy = false,
  event = "VeryLazy",
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
}
