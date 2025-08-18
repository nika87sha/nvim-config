-- lua/plugins/indent-blankline.lua
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local ibl = require("ibl")
    ibl.setup({
      indent = { char = "│", tab_char = "│" },
      scope = { enabled = true, show_start = true },
      exclude = {
        buftypes = { "terminal" },
        filetypes = { "help" },
      },
    })
  end,
}

