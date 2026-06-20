local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- YAML Language Server (Kubernetes, Ansible, etc.)
lspconfig.yamlls.setup({
  capabilities = capabilities,
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
      },
      customTags = {
        "!vault",
        "!include",
        "!reference",
        "!Cidr",
      },
      keyOrdering = false,
    },
  },
})

-- Docker Language Server
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