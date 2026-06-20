-- init.lua
-- Configuración modular de Neovim para DevOps/SysAdmin
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

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.fn.sign_define("AvanteInputPromptSign", {
      text = "󰭹",
      texthl = "Comment",
    })
  end,
})

-- Parche para vim.tbl_flatten deprecated en Neovim v0.12+
-- Los plugins desactualizados (none-ls, fzf-lua, nvim-nio) lo usan
-- esto evita el warning sin tener que esperar que los plugins se actualicen
if vim.fn.has("nvim-0.11") == 1 then
  vim.tbl_flatten = function(t)
    return vim.iter(t):flatten(math.huge):totable()
  end
end

-- ======================================
-- 3️⃣ Carga plugins con Lazy.nvim
-- ======================================
require("lazy").setup('plugins') -- lazy.nvim auto-descubre los archivos en lua/plugins/

-- ======================================
-- 4️⃣ Carga módulos de configuración
-- (ORDEN IMPORTANTE: lib → options → funciones → autocmds → mappings → LSP → testing → snippets → UI)
-- ======================================

-- Utilidades (debe ir primero porque otros módulos dependen de éstas)
require('lib.util')
require('lib.icons')
require('lib.prompts')

-- Opciones básicas de Neovim
require('config.options')

-- Funciones y comandos de usuario
require('config.functions')

-- Autocomandos
require('config.autocmd')

-- Mapeos generales
require('config.mapping')

-- LSP: La configuración de servidores se maneja desde plugins/lsp.lua (handlers de mason-lspconfig)
-- Los archivos en lua/lsp/*.lua ya NO se cargan desde acá para evitar doble configuración

-- Testing
require('testing.neotest')
require('testing.refactoring')

-- Snippets (se cargan todos)
require('snippets.python')
require('snippets.java') -- Si no usas Java, borrá esta línea y snippets/java.lua
require('snippets.bash')
require('snippets.yaml_docker')
require('snippets.docker')
require('snippets.kubernetes')
require('snippets.terraform')
require('snippets.ansible')
require('snippets.rust')

-- UI componentes
require('ui.hipatterns')

-- Sesión
require('config.session')

-- ======================================
-- 5️⃣ DevOps / Sysadmin Configuration
-- (Mapeos específicos para el flujo de trabajo DevOps)
-- ======================================
require('config.mapping_devops')
