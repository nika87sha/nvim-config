-- =========================================================
-- LEADER
-- =========================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Snacks
local snacks = require('snacks')

-- =========================================================
-- BASICO / CORE
-- =========================================================

-- Escape rapido
map('i', 'jj', '<Esc>', opts)
map('t', 'JJ', '<C-\\><C-n>', opts)

-- Limpiar búsqueda al salir
-- map({ "n", "i" }, "<Esc>", "<cmd>noh<CR><Esc>", { desc = "Clear search" })

-- Mejor movimiento vertical
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Inicio / fin de línea
map({ 'n', 'v', 'x' }, 'gh', '^', { desc = 'Line start' })
map({ 'n', 'v', 'x' }, 'gl', '$', { desc = 'Line end' })

-- =========================================================
-- EDICIÓN
-- =========================================================

-- No copiar al borrar
map({ 'v', 'x' }, 'x', '"_x')
map('n', 'X', '"_D')
map({ 'v', 'x' }, 'X', '"_d')

-- Paste sin sobrescribir registro
map({ 'v', 'x' }, 'p', '"_dP')

-- Indent mejorado
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Breakpoints undo
map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')
map('i', ';', ';<C-g>u')

-- Mover líneas
map({ 'v', 'x' }, 'J', ":move '>+1<CR>gv-gv", opts)
map({ 'v', 'x' }, 'K', ":move '<-2<CR>gv-gv", opts)

-- Centrar pantalla
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- =========================================================
-- ARCHIVOS / FIND (SNACKS)
-- =========================================================

-- map("n", "<leader>ff", function()
--   snacks.picker.files()
-- end, { desc = "Find files" })  -- Handled by snacks.lua

map('n', '<leader><space>', function()
    snacks.picker.smart()
end, { desc = 'Smart picker' })

map('n', '<leader>e', '<cmd>:NvimTreeOpen<CR>', { desc = 'Explorer toggle' })
map('n', '<leader>fn', '<cmd>:NvimTreeFindFile<CR>', { desc = 'Explorer find file' })

-- =========================================================
-- BUFFERS
-- =========================================================

map('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })
map('n', '<leader>bn', '<cmd>bufferNext<CR>', { desc = 'Next buffer' })

-- =========================================================
-- GIT
-- =========================================================

map('n', '<leader>gg', function()
    snacks.lazygit()
end, { desc = 'LazyGit' })

-- =========================================================
-- LSP
-- =========================================================

map('n', '<leader>ld', vim.lsp.buf.definition, { desc = 'Go to definition' })
map('n', '<leader>lD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
map('n', '<leader>li', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
map('n', '<leader>lh', vim.lsp.buf.hover, { desc = 'Hover docs' })
map('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = 'Signature help' })
map('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'Rename symbol' })
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code action' })
map('n', '<leader>lf', function()
    vim.lsp.buf.format({ async = true })
end, { desc = 'Format buffer' })

-- =========================================================
-- UI / SNACKS
-- =========================================================

map('n', '<leader>sx', function()
    snacks.scratch()
end, { desc = 'Scratch buffer' })

map('n', '<leader>sz', function()
    snacks.zen()
end, { desc = 'Zen mode' })

-- Vim REST Console
map('n', '<leader>xr', ':call VrcQuery()<CR>', { desc = 'Run REST query' })

-- =========================================================
-- SYSTEM
-- =========================================================

map('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
map('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
map('n', '<leader>pp', '<cmd>Lazy<CR>', { desc = 'Plugin manager (Lazy)' })

-- Deep link: tmux → nvim buffers
map('n', '<leader>tb', function()
    snacks.picker.buffers()
end, { desc = 'TMUX: Buffers (Snacks)' })
