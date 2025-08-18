return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      flavour = "storm",
      transparent_background = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })
    vim.cmd[[colorscheme tokyonight]]
  end
}

