return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("diffview").setup({
      diff_binaries = false,
      use_icons = true,
      icons = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      view = {
        default = {
          layout = "diff2_horizontal",
        },
        merge_tool = {
          layout = "diff3_horizontal",
        },
        file_history = {
          layout = "diff2_horizontal",
        },
      },
      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "all",
        },
      },
      key_bindings = {
        disable_defaults = false,
        view = {
          ["gf"] = "<cmd>DiffviewToggleFiles<CR>",
        },
        file_panel = {
          ["j"] = "next_entry",
          ["k"] = "prev_entry",
          ["o"] = "select_entry",
          ["l"] = "select_entry",
          ["<CR>"] = "select_entry",
          ["<2-LeftMouse>"] = "select_entry",
          ["-"] = "toggle_stage_entry",
          ["s"] = "toggle_stage_entry",
          ["S"] = "stage_all",
          ["U"] = "unstage_all",
          ["X"] = "restore_entry",
          ["R"] = "refresh_files",
          ["L"] = "open_commit_log",
          ["<tab>"] = "select_next_entry",
          ["<s-tab>"] = "select_prev_entry",
          ["<leader>e"] = "focus_files",
          ["<leader>b"] = "toggle_files",
        },
      },
    })
  end,
}
