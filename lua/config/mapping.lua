-- =========================================================
-- LEADER
-- =========================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

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
-- ARCHIVOS / FIND
-- =========================================================

map('n', '<leader><space>', function()
    require('telescope.builtin').find_files()
end, { desc = 'Find files (Telescope)' })

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
map('n', '<leader>fa', builtin.find_files, { desc = 'Find all files' })
map('n', '<leader>fF', builtin.git_files, { desc = 'Find git files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Grep (live)' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
map('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })

map('n', '<leader>e', '<cmd>:NvimTreeOpen<CR>', { desc = 'Explorer toggle' })
map('n', '<leader>fn', '<cmd>:NvimTreeFindFile<CR>', { desc = 'Explorer find file' })

-- =========================================================
-- BUFFERS (barbar.nvim)
-- =========================================================

map('n', '<leader>bd', '<cmd>BufferClose<CR>', { desc = 'Close buffer' })
map('n', '<leader>bn', '<cmd>BufferNext<CR>', { desc = 'Next buffer' })
map('n', '<leader>bp', '<cmd>BufferPrevious<CR>', { desc = 'Previous buffer' })
map('n', '<leader>bl', '<cmd>BufferLast<CR>', { desc = 'Last buffer' })
map('n', '<leader>bP', '<cmd>BufferPick<CR>', { desc = 'Pick buffer by index' })

-- Navegación rápida tipo vim-unimpaired
map('n', ']b', '<cmd>BufferNext<CR>', { desc = 'Next buffer' })
map('n', '[b', '<cmd>BufferPrevious<CR>', { desc = 'Previous buffer' })

-- Moverse al buffer por número (Alt + 1..9)
for i = 1, 9 do
    map('n', '<A-' .. i .. '>', '<cmd>BufferGoto ' .. i .. '<CR>', { desc = 'Buffer ' .. i })
end

-- =========================================================
-- GIT
-- =========================================================

map('n', '<leader>gg', function()
    require('lazygit').lazygit()
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
    vim.cmd('enew')
    vim.bo.buftype = 'nofile'
    vim.bo.bufhidden = 'hide'
    vim.bo.swapfile = false
end, { desc = 'Scratch buffer' })

map('n', '<leader>sz', function()
    vim.cmd('ZenMode')
end, { desc = 'Zen mode' })

-- Vim REST Console
map('n', '<leader>xr', ':call VrcQuery()<CR>', { desc = 'Run REST query' })

-- =========================================================
-- SYSTEM
-- =========================================================

map('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
map('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
map('n', '<leader>pp', '<cmd>Lazy<CR>', { desc = 'Plugin manager (Lazy)' })

-- ActivityWatch report
map('n', '<leader>ar', function()
    local handle = io.popen("activity-report hoy 2>/dev/null")
    if handle then
        local result = handle:read("*a")
        handle:close()
        vim.cmd("new")
        vim.bo.buftype = "nofile"
        vim.bo.bufhidden = "hide"
        vim.bo.swapfile = false
        vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(result, "\n"))
        vim.bomodifiable = false
    end
end, { desc = 'Activity report (hoy)' })

-- Deep link: tmux → nvim buffers
map('n', '<leader>tb', function()
    require('telescope.builtin').buffers()
end, { desc = 'TMUX: Buffers (Telescope)' })
