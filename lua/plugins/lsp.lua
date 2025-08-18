return {
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup()
    mason_lspconfig.setup({ ensure_installed = { "bashls", "jdtls", "pyright", "clangd", "clang-format", "groovyls", "ansiblels"}})

    local on_attach = function(client, bufnr)
      local wk = require("which-key")
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

    local servers = { "bashls", "jdtls", "pyright", "clangd", "groovyls" }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({ on_attach = on_attach })
    end
  end,
}

