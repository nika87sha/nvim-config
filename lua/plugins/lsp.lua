return {
  "neovim/nvim-lspconfig",
  -- Nota: nvim-lspconfig es la dependencia, no deberías usar un bloque 'config' para él.
  -- Deberías usar 'mason-lspconfig' para configurarlo.

  dependencies = { 
      "williamboman/mason.nvim", 
      "williamboman/mason-lspconfig.nvim" 
  },
  
  -- Este bloque 'config' ahora se centrará en configurar los servidores
  -- usando el enfoque recomendado por mason-lspconfig.
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local wk = require("which-key")

    mason.setup()
    
    -- 1. Definición de la función on_attach
    local on_attach = function(client, bufnr)
      -- Tu configuración de which-key para atajos del LSP
      local opts = { noremap = true, silent = true, buffer = bufnr } 
      wk.register({
        l = {
          name = "LSP",
          r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
          a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
          d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
          h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
        },
      }, opts)
    end
    
    -- 2. Configuración usando mason-lspconfig.setup_handlers
    -- Esto garantiza que .setup() solo se llama si el servidor está instalado.
    mason_lspconfig.setup({ 
      ensure_installed = { "bashls", "jdtls", "pyright", "clangd", "groovyls", "ansiblels"},
      
      -- Usamos setup_handlers para definir una configuración por defecto
      -- para todos los servidores instalados por mason.
      handlers = {
        -- Configuración por defecto para la mayoría de los servidores
        function(server_name)
            vim.lsp.config[server_name].setup({
                on_attach = on_attach,
            })
        end,
        
        -- Si necesitas una configuración especial para Lua o Pyright:
        -- lua_ls = function()
        --     vim.lsp.config.lua_ls.setup({
        --         on_attach = on_attach,
        --         settings = { Lua = { ... } },
        --     })
        -- end,
      }
    })

  end,
}
