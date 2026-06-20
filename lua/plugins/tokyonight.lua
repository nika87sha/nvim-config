-- lua/plugins/tokyonight.lua
-- ÚNICA definición de tokyonight.nvim
-- colorscheme.lua fue mergeado acá y eliminado
return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "storm",        -- opciones: storm, night, day
      transparent = true,     -- true si quieres fondo transparente
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
        conditionals = { italic = true },
        loops = {},
        sidebars = "transparent",
        floats = "transparent",
      },
      sidebars = { "qf", "help", "packer" },
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = true,
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}
