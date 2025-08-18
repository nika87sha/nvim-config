return {
  "romgrk/barbar.nvim",
  config = function()
    vim.g.barbar_auto_setup = false
    require("barbar").setup({
      animation = false,
      tabpages = true,
      focus_on_close = "left",
      hide = {extensions = false, inactive = false},
      icons = {buffer_index = false, button = ""},
      maximum_length = 25,
    })
  end,
}

