-- plugins/fterm.lua
return {
  "numtostr/FTerm.nvim",
  config = function()
    local fterm = require("FTerm")

    _G.htop = fterm:new({
      ft = 'fterm_htop',
      cmd = "htop"
    })
  end
}

