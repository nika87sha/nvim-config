-- lua/config/session.lua

-- Donde Neovim guarda las sesiones (directorio fijo, NO el cwd)
local session_dir = vim.fn.stdpath("data") .. "/sessions/"
vim.fn.mkdir(session_dir, "p")

-- Nombre de sesión según el directorio de trabajo (una sesión por proyecto)
local function session_file()
  local cwd = vim.fn.getcwd():gsub("[/\\]", "%%")
  return session_dir .. cwd .. ".vim"
end

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
      vim.cmd("silent! mksession! " .. vim.fn.fnameescape(session_file()))
    end
  end,
})

-- Auto-restaurar sesión al entrar
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local f = session_file()
    if vim.env.TMUX and vim.fn.filereadable(f) == 1 and vim.fn.argc(-1) == 0 then
      vim.cmd("silent! source " .. vim.fn.fnameescape(f))
    end
  end,
})

