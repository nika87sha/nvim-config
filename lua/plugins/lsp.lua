-- lsp.lua: Configuración ÚNICA de LSP
-- Usa mason-lspconfig como puente entre Mason y la configuración de servidores
-- Compatible con Neovim v0.12.2
return {
  "neovim/nvim-lspconfig",
  lazy = false, -- Se carga al inicio para que los módulos lsp/*.lua puedan usarlo
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "folke/which-key.nvim", lazy = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local wk = require("which-key")

    -- ============================================
    -- on_attach: se ejecuta cuando un LSP se conecta a un buffer
    -- ============================================
    local on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      -- Atajos con which-key
      wk.register({
        l = {
          name = "LSP",
          r = { vim.lsp.buf.rename, "Rename" },
          a = { vim.lsp.buf.code_action, "Code Action" },
          d = { vim.lsp.buf.definition, "Go to Definition" },
          h = { vim.lsp.buf.hover, "Hover" },
        },
      }, { prefix = "<leader>", buffer = bufnr })

      -- Atajos directos (por si no está which-key)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    end

    -- ============================================
    -- Configuración mason-lspconfig
    -- ============================================
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",       -- Bash
        "jdtls",        -- Java
        "pyright",      -- Python
        "clangd",       -- C/C++
        "groovyls",     -- Groovy (Jenkins pipelines)
        "ansiblels",    -- Ansible
        "lua_ls",       -- Lua
        "rust_analyzer",-- Rust
        "yamlls",       -- YAML (Docker, K8s, pipelines)
        "dockerls",     -- Docker
        "terraformls",  -- Terraform
      },
      automatic_installation = true,
      handlers = {
        -- Handler por defecto para TODOS los servidores
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
        -- Podés agregar handlers específicos para servidores que necesiten
        -- configuración especial, por ejemplo:
        -- lua_ls = function()
        --   lspconfig.lua_ls.setup({
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     settings = {
        --       Lua = {
        --         runtime = { version = "LuaJIT" },
        --         diagnostics = { globals = { "vim" } },
        --         workspace = {
        --           library = vim.api.nvim_get_runtime_file("", true),
        --         },
        --       },
        --     },
        --   })
        -- end,
      },
    })
  end,
}
