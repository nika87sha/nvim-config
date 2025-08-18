-- lua/config/autocmd.lua
-- Autocomandos pequeños y útiles

local autocmd = vim.api.nvim_create_autocmd

-- resaltar yank
autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-- detectar archivo cambiando y recargar (opcional)
autocmd("FocusGained", {
  callback = function()
    vim.cmd("checktime")
  end,
})
-- Auto comandos simples
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function() vim.cmd("silent! %s/\\s\\+$//e") end,
})

