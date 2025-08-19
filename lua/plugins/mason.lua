return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp", -- opcional, para autocompletado
  },
  config = function()
    -- Inicializa Mason
    require("mason").setup()

    -- Inicializa mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "pyright"}, -- ajusta a tus LSP
      automatic_installation = true, -- ✅ solo boolean o lista
    })

    -- Capabilities para autocompletado
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Configuración de servidores LSP
    local lspconfig = require("lspconfig")

    -- Si existe setup_handlers (versiones nuevas)
    if mason_lspconfig.setup_handlers then
      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })
    else
      -- 🔙 fallback para versiones viejas
      for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end
    end
  end,
}

