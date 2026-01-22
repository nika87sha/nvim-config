local jdtls = require('jdtls')
local home = os.getenv("HOME")
local workspace_dir = vim.fn.stdpath("data") .. "/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
  cmd = { "/ruta/a/jdt-language-server/bin/jdtls" },  -- Cambia según tu instalación
  root_dir = require("jdtls.setup").find_root({".git", "pom.xml", "build.gradle"}),
  workspace_dir = workspace_dir,
}

jdtls.start_or_attach({
  cmd = { 'jdtls', '-data', workspace_dir },
  on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  end,
})

