-- plugins/spectre.lua
-- Search & Replace masivo (ideal para cambiar IPs, puertos, nombres en configs)
return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("spectre").setup({
      replace_engine = "sed",
      live_update = true,
      is_insert_mode = false,
      line_sep_start = "┌-----------------------------------------",
      result_padding = "¦  ",
      line_sep = "└-----------------------------------------",
      highlight = {
        ui = "String",
        search = "DiffChange",
        replace = "DiffDelete",
      },
      mapping = {
        ["toggle_line"] = { map = "dd", cmd = "<cmd>lua require('spectre').toggle_line()<CR>", desc = "Toggle item" },
        ["enter_file"] = { map = "<CR>", cmd = "<cmd>lua require('spectre.actions').enter_file()<CR>", desc = "Open file" },
        ["send_to_qf"] = { map = "<leader>q", cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>", desc = "Send to quickfix" },
        ["replace_cmd"] = { map = "<leader>c", cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>", desc = "Replace all" },
        ["show_option_menu"] = { map = "<leader>o", cmd = "<cmd>lua require('spectre').show_options()<CR>", desc = "Options" },
        ["run_replace"] = { map = "<leader>R", cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>", desc = "Replace all" },
        ["change_view_mode"] = { map = "<leader>v", cmd = "<cmd>lua require('spectre').change_view()<CR>", desc = "Change view" },
        ["resume_last_search"] = { map = "<leader>l", cmd = "<cmd>lua require('spectre').resume_last_search()<CR>", desc = "Resume last" },
      },
    })

    local map = vim.keymap.set
    map("n", "<leader>sX", "<cmd>lua require('spectre').open()<CR>", { desc = "Spectre: Search & Replace" })
    map("n", "<leader>sW", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", { desc = "Spectre: Search word under cursor" })
    map("v", "<leader>sX", "<esc><cmd>lua require('spectre').open_visual()<CR>", { desc = "Spectre: Search selection" })
    map("n", "<leader>sP", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", { desc = "Spectre: Search in current file" })
  end,
}