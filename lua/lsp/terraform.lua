-- Terraform Language Server
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.terraformls.setup({
  capabilities = capabilities,
  filetypes = { "terraform", "tf", "tfvars" },
  settings = {
    terraform = {
      path = "terraform",
      timeout = "10s",
    },
  },
})

-- HCL Language Server
lspconfig.hcl.setup({
  capabilities = capabilities,
  filetypes = { "hcl" },
})
