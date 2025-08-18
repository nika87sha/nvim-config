-- ~/.config/nvim2k/init.lua

-- =========================
-- 1️⃣ Configuración básica
-- =========================
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.background = "dark"

-- =========================
-- 2️⃣ Instalar Lazy.nvim si no existe
-- =========================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =========================
-- 3️⃣ Cargar todos los plugins desde lua/plugins/
-- =========================
require("lazy").setup("plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "default" } },
})

-- =========================
-- 4️⃣ Colores y tema
-- =========================
vim.cmd([[colorscheme tokyonight-storm]])

-- =========================
-- 5️⃣ Opciones y ajustes globales
-- =========================
-- Puedes añadir aquí tus ajustes personalizados
vim.g.mapleader = " "
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- =========================
-- 6️⃣ Autocomandos
-- =========================
-- Ejemplo: recargar init.lua al guardarlo
vim.cmd([[
  augroup reload_init
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])

