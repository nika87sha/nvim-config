-- mason.lua: SOLO configura Mason como instalador de herramientas
-- La configuración de LSP va en lsp.lua
return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()
  end,
}
