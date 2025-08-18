-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "bash", "java", "python", "c", "cpp", "groovy", "lua", "json", "yaml" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

