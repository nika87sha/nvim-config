-- lua/config/session.lua

-- Donde Neovim guarda las sesiones
vim.opt.sessionoptions = {
  "buffers",
  "curdir",
  "folds",
  "help",
  "tabpages",
  "winsize",
  "globals",
}

-- Auto-guardar sesión al salir (cuando estás en tmux)
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if vim.env.TMUX then
      vim.cmd("silent! mksession! .nvim.session")
    end
  end,
})

-- Auto-restaurar sesión al entrar
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.env.TMUX and vim.fn.filereadable(".nvim.session") == 1 then
      vim.cmd("silent! source .nvim.session")
    end
  end,
})

