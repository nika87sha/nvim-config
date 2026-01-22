-- init.lua
-- ======================================
-- 1️⃣ Leader
-- ======================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ======================================
-- 2️⃣ Lazy.nvim bootstrap
-- ======================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ======================================
-- 3️⃣ Carga plugins desde plugins.lua
-- ======================================
require("lazy").setup("plugins")  -- plugins.lua con TODOS tus plugins

-- ======================================
-- 4️⃣ Carga módulos de configuración
-- ======================================

-- LSP
require('lsp.python')
require('lsp.java')
require('lsp.bash')
require('lsp.yaml_docker')

-- UI
require('ui.dashboard')       -- dashboard
require('ui.telescope')
require('ui.bufferline')
require('ui.incline')
require('ui.noice_notify')
require('ui.mini_hipatterns')

-- Testing & Refactoring
require('testing.neotest')
require('testing.refactoring')

-- Snippets
require('snippets.python')
require('snippets.java')
require('snippets.bash')
require('snippets.yaml_docker')


