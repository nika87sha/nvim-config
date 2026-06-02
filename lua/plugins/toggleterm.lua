return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-\\>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      highlights = {
        NormalFloat = {
          guibg = "#1e1e2e",
          guifg = "#cdd6f4",
        },
        FloatBorder = {
          guifg = "#89b4fa",
          guibg = "#1e1e2e",
        },
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- Lazy git
    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
      end,
      on_close = function(term)
        vim.cmd("startinsert!")
      end,
    })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    -- Node REPL
    local node = Terminal:new({
      cmd = "node",
      direction = "vertical",
      size = 60,
    })

    function _NODE_TOGGLE()
      node:toggle()
    end

    -- Python REPL
    local python = Terminal:new({
      cmd = "python3",
      direction = "vertical",
      size = 60,
    })

    function _PYTHON_TOGGLE()
      python:toggle()
    end

    -- Bash terminal
    local bash = Terminal:new({
      cmd = "bash",
      direction = "horizontal",
      size = 15,
    })

    function _BASH_TOGGLE()
      bash:toggle()
    end

    -- Exponer funciones globalmente para mapeos
    _G.BASH_TOGGLE = _BASH_TOGGLE
    _G.PYTHON_TOGGLE = _PYTHON_TOGGLE
    _G.NODE_TOGGLE = _NODE_TOGGLE
  end,
}