return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    { "<leader>e", "<cmd>Oil<CR>", desc = "Explorer toggle" },
    { "<leader>fn", "<cmd>Oil --float<CR>", desc = "Explorer find file (float)" },
  },
  opts = {
    default_file_explorer = true,
    columns = { "icon", "permissions", "size", "mtime" },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == ".." or name == ".git"
      end,
    },
    -- Disable confirmation when navigating (entering dirs/opening files)
    prompt_save_on_select_new_entry = false,
    -- Skip confirmation for simple edits (rename, create, delete)
    skip_confirm_for_simple_edits = true,
    keymaps = {
      -- Navigation
      ["<CR>"] = "actions.select",
      ["o"] = "actions.select",
      ["l"] = "actions.select",
      ["h"] = "actions.parent",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },

      -- Splits
      ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open in vertical split" },
      ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open in horizontal split" },
      ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open in new tab" },

      -- Preview & close
      ["gp"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["q"] = "actions.close",
      ["<Esc>"] = "actions.close",

      -- File operations
      ["<C-r>"] = "actions.refresh",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
    use_default_keymaps = false,
  },
}