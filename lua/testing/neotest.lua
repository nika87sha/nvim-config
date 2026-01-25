-- ~/.config/nvim/lua/plugins/neotest.lua
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-java",
    "rouge8/neotest-shell",
    "nvim-neotest/neotest-plenary",  -- útil para C
    "mfussenegger/nvim-dap",          -- DAP
    "jay-babu/mason-nvim-dap.nvim",   -- para instalar DAPs
  },
  config = function()
    local neotest = require("neotest")

    -- Setup de neotest
    neotest.setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
          runner = "pytest",
        }),
        require("neotest-java")({
          -- Configuración opcional JUnit
        }),
        require("neotest-shell")({
          command = "bash",
        }),
        require("neotest-plenary"), -- útil para tests C
      },
      quickfix = {
        enabled = true,
        open = false,
      },
      status = {
        virtual_text = true,
      },
    })

    -- Keymaps para tests
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Ejecutar test en cursor
    map("n", "<leader>tn", ":lua require('neotest').run.run()<CR>", opts)
    -- Ejecutar test del archivo actual
    map("n", "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", opts)
    -- Ejecutar test en el proyecto
    map("n", "<leader>ta", ":lua require('neotest').run.run({suite = true})<CR>", opts)
    -- Abrir resumen de tests
    map("n", "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", opts)
    -- Ver salida del test
    map("n", "<leader>to", ":lua require('neotest').output.open({ enter = true })<CR>", opts)

    -- Configuración de DAP para Python y Java
    local dap = require("dap")
    -- Python
    dap.adapters.python = {
      type = "executable",
      command = "python",
      args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return "python"
        end,
      },
    }
    -- Java (si tienes jdtls funcionando)
    dap.adapters.java = function(callback, config)
      callback({ type = "server", host = "127.0.0.1", port = 5005 })
    end
  end,
}

