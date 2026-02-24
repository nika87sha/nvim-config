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

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.fn.sign_define("AvanteInputPromptSign", {
      text = "󰭹",
      texthl = "Comment",
    })
  end,
})
-- ======================================
-- 3️⃣ Carga plugins desde plugins.lua
-- ======================================
require("lazy").setup('plugins')

-- ======================================
-- 4️⃣ Carga módulos de configuración
-- ======================================

-- LSP
require('lsp.python')
--require('lsp.java')
require('lsp.bash')
require('lsp.yaml_docker')
require('lsp.docker')
require('lsp.terraform')

require('testing.neotest')
require('testing.refactoring')

-- Snippets
require('snippets.python')
require('snippets.java')
require('snippets.bash')
require('snippets.yaml_docker')
require('snippets.docker')
require('snippets.kubernetes')
require('snippets.terraform')
require('snippets.ansible')

require('plugins.seeker')

-- UI y tema
require("plugins.tokyonight")
require("plugins.lualine")
require("plugins.colorizer")
require("plugins.twilight")
require("plugins.mini-icons")

-- Navegación y búsqueda
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.filetree")
require("plugins.fzf-lua")
require("plugins.fterm")
require("plugins.cmp")
require("plugins.toggleterm")

-- Desarrollo
require("plugins.mason")   -- << Asegúrate de tener este
require("plugins.lsp")
require("plugins.autopairs")
require("plugins.comment")
require("plugins.nvim-lint")
require("plugins.render-markdown")
require("plugins.conform")
require("plugins.trouble")

-- Git y utilidades
require('plugins.gitsigns')
require('plugins.utilities')
require('plugins.lazygit')
require('plugins.diffview')
require('config.session')

-- Otros
require('plugins.which-key')
require('plugins.indent-blankline')
require('plugins.barbar')

-- ======================================
-- 5️⃣ DevOps / Sysadmin Configuration
-- ======================================
require('config.mapping_devops')


