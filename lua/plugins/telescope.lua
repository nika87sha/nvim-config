return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-q>"] = actions.send_to_qflist,
          },
        },
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          ".venv/",
          "__pycache__/",
          ".terraform/",
          ".vscode/",
        },
        hidden = true,
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
        grep_string = {
          theme = "dropdown",
        },
        live_grep = {
          theme = "dropdown",
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
        },
        help_tags = {
          theme = "dropdown",
        },
      },
    })

    -- Load FZF extension for better performance
    pcall(telescope.load_extension, "fzf")
  end,
}


