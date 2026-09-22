-- lsp.lua: Configuración ÚNICA de LSP
-- Usa mason-lspconfig como puente entre Mason y la configuración de servidores
-- Compatible con Neovim v0.12.2 + blink.cmp
return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    { "folke/which-key.nvim", lazy = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()
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
        "bashls",
        "jdtls",
        "pyright",
        "clangd",
        "groovyls",
        "ansiblels",
        "lua_ls",
        "rust_analyzer",
        "yamlls",
        "dockerls",
        "terraformls",
      },
      automatic_installation = true,
      handlers = {
        -- Handler por defecto
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
          })
        end,
        -- Override para yamlls: schemas k8s, github actions, docker-compose, ansible
        ["yamlls"] = function()
          lspconfig.yamlls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              yaml = {
                schemaStore = {
                  enable = true,
                  url = "https://www.schemastore.org/json/catalog.json",
                },
                schemas = {
                  kubernetes = "*.yaml",
                  ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
                  ["https://json.schemastore.org/docker-compose.json"] = "docker-compose.yaml",
                  ["https://json.schemastore.org/ansible-playbook.json"] = "**/playbooks/**/*.{yml,yaml}",
                  ["https://json.schemastore.org/ansible-vault.json"] = "**/vault*.{yml,yaml}",
                },
                customTags = {
                  "!vault",
                  "!include",
                  "!reference",
                  "!Cidr",
                  "!vault scalar",
                  "!vault sequence",
                  "!vault mapping",
                },
                keyOrdering = false,
              },
            },
          })
        end,
        -- Override para dockerls
        ["dockerls"] = function()
          lspconfig.dockerls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              docker = {
                languageserver = {
                  formatter = {
                    ignoreMultilineInstructions = false,
                  },
                },
              },
            },
          })
        end,
      },
    })
  end,
}