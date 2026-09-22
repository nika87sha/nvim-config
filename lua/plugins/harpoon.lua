-- plugins/harpoon.lua
-- Marcado rápido de archivos (ideal para saltar entre configs: nginx, k8s, docker, terraform)
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local map = vim.keymap.set
    -- Añadir archivo actual
    map("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add file" })
    -- Toggle quick menu
    map("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
    -- Navegación rápida (1-4)
    map("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
    map("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
    map("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
    map("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
    -- Prev/Next
    map("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
    map("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Harpoon next" })
  end,
}