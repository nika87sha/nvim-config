return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({
      icons = true,
      fold_open = "",
      fold_closed = "",
      indent_lines = true,
      severity = nil,
      signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠",
      },
      use_diagnostic_signs = false,
      auto_open = false,
      auto_close = false,
      auto_preview = true,
      auto_refresh = true,
      focus = false,
      restore = true,
      follow = true,
      multiline = true,
      max_items = 200,
      win_config = {
        border = "rounded",
        zindex = 200,
      },
      modes = {
        lsp = {
          mode = "lsp",
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.3,
          },
        },
        lsp_references = {
          mode = "lsp_references",
          preview = {
            type = "split",
            relative = "win",
            position = "bottom",
            size = 0.3,
          },
        },
        quickfix = {
          mode = "quickfix",
        },
        loclist = {
          mode = "loclist",
        },
        telescope = {
          mode = "telescope",
        },
      },
    })
  end,
}
