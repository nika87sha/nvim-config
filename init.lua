-- init.lua
-- Inicializa Lazy.nvim
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

-- Carga los plugins
require("lazy").setup("plugins")  -- plugins.lua con la lista de plugins

-- Carga tus módulos de configuración (LSP, UI, snippets)
require('lsp.python')
require('lsp.java')
require('lsp.bash')
require('lsp.yaml_docker')

require('ui.telescope')
require('ui.bufferline')
require('ui.incline')
require('ui.noice_notify')

require('testing.neotest')
require('testing.refactoring')

require('snippets.python')
require('snippets.java')
require('snippets.bash')
require('snippets.yaml_docker')

