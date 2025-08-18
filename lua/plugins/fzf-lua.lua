-- plugins/fzf-lua.lua
return {
  "ibhagwan/fzf-lua",
  requires = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({
      file_icon_padding = ' ',
      keymap = {
        builtin = {
          ["<M-Esc>"] = "hide",
          ["<F1>"] = "toggle-help",
          ["<F2>"] = "toggle-fullscreen",
          ["<F3>"] = "toggle-preview-wrap",
          ["<F4>"] = "toggle-preview",
        },
        fzf = {
          ["ctrl-z"] = "abort",
          ["ctrl-u"] = "unix-line-discard",
        },
      },
    })
  end
}

