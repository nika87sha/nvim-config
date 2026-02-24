return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        themable = true,
        style_preset = "default",
        mode = "buffers",
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
        separator_style = "slant",
        enforce_regular_tabs = false,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        close_icon = "󰅖",
        buffer_close_icon = "󰅖",
        modified_icon = "󰢛",
        left_mouse_command = "buffer %d",
        right_mouse_command = "bdelete! %d",
        middle_mouse_command = "bdelete! %d",
      },
    })
  end,
}