-- plugins/dotenv.lua
-- Soporte para archivos .env
return {
  "ellisonleao/dotenv.nvim",
  config = function()
    require("dotenv").setup({
      enable_on_load = true,
      verbose = false,
    })
  end,
}