-- lua/plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false,
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      git = { enable = true },
      filters = { dotfiles = false },
      actions = {
        open_file = {
          window_picker = { enable = false },
          quit_on_open = false,
        },
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            git = true,
          },
        },
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local keymap = require("nvim-tree.keymap")

        -- 1️⃣ Aplicar TODOS los atajos por defecto de nvim-tree
        keymap.on_attach_default(bufnr)

        -- 2️⃣ Agregar atajos custom (sin pisar los defaults)
        -- Abrir en nueva pestaña (t)
        vim.keymap.set("n", "t", api.node.open.tab, { buffer = bufnr, desc = "nvim-tree: Open in New Tab" })
        -- Abrir en split vertical (v)
        vim.keymap.set("n", "v", api.node.open.vertical, { buffer = bufnr, desc = "nvim-tree: Open in Vertical Split" })
        -- Abrir en split horizontal (h)
        vim.keymap.set("n", "h", api.node.open.horizontal, { buffer = bufnr, desc = "nvim-tree: Open in Horizontal Split" })
      end,
    })
  end,
}
