return {
  "iamcco/markdown-preview.nvim",
  lazy = false, -- Carga el plugin al inicio de Neovim
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_browser = "" -- usar navegador por defecto
    vim.g.mkdp_echo_preview_url = 1
    vim.g.mkdp_port = "8888" -- Puerto fijo para evitar problemas
    -- Atajo para previsualizar markdown
    vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown preview toggle" })
  end,
}