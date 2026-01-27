return {
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        result = { -- Añadimos el '=' aquí
          formatters = {
            json = "jq",
          },
        },
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
