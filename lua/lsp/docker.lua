-- LSP para Dockerfile
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Dockerfile Language Server
lspconfig.dockerls.setup({
  capabilities = capabilities,
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

-- JSON Language Server (útil para k8s, terraform, etc.)
lspconfig.jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          fileMatch = { "tsconfig*.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
        {
          fileMatch = { ".prettierrc", ".prettierrc.json" },
          url = "https://json.schemastore.org/prettierrc.json",
        },
        {
          fileMatch = { ".eslintrc", ".eslintrc.json" },
          url = "https://json.schemastore.org/eslintrc.json",
        },
      },
    },
  },
})
