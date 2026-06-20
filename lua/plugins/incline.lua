return {
  "b0o/incline.nvim",
  event = "VeryLazy",
  config = function()
    require("incline").setup({
      debounce_threshold = 10,
      render = function(props)
        return props.buf_name
      end,
    })
  end,
}

