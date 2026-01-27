return {
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Configuración por defecto
        result_split_horizontal = false,
        result_split_vertical = true,
        highlight = {
          enabled = true,
          timeout = 150,
        },
      })
    end
  }
}
