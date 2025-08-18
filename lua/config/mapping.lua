-- lua/config/mappings.lua
-- Keymaps mínimos (leader, algunos atajos útiles)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Shortcut rapido para Lazy UI
map("n", "<leader>pp", ":Lazy<CR>", { desc = "Plugins (Lazy)" })

-- Explorador (nvim-tree) - si no lo usas, elimina
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- fzf-lua shortcuts (si usas fzf-lua)
map("n", "<leader>ff", ":FzfLua files<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":FzfLua live_grep<CR>", { desc = "Live grep" })

-- Guardar/Salir
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

