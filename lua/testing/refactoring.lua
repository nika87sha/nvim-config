-- ~/.config/nvim/lua/plugins/refactoring.lua
return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local refactoring = require("refactoring")

    refactoring.setup({})

    -- Keymaps para refactoring
    local opts = { noremap = true, silent = true, expr = false }
    local keymap = vim.api.nvim_set_keymap

    -- Refactorizar variable en visual mode
    keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], opts)
    keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], opts)
    keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], opts)

    -- Refactorizar función en normal mode
    keymap("n", "<leader>rf", [[ <Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], opts)
    keymap("n", "<leader>rvf", [[ <Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], opts)
    keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], opts)

    -- Optional: Integración con telescope para elegir refactor
    keymap("v", "<leader>r", [[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]], opts)
    keymap("n", "<leader>r", [[ <Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]], opts)
  end,
}

