return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  dependencies = {
    "kdheepak/lazygit.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local snacks = require("snacks")
    local icons = require("lib.icons")

    -- =========================
    -- Layout helpers (FALTABAN)
    -- =========================
    local function files_layout(width)
      return {
        preset = "files",
        preview = true,
        width = width or 0.9,
      }
    end

    local function palette_layout()
      return {
        preset = "palette",
        preview = false,
      }
    end

    -- =========================
    -- Snacks setup
    -- =========================
    snacks.setup({
      animate = { enabled = true, duration = 20, fps = 60 },

      -- ===== Dashboard =====
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          {
            icon = icons.ui.Keyboard,
            title = "Keymaps",
            section = "keys",
            indent = 2,
            padding = 1,
          },
          {
            icon = icons.documents.File,
            title = "Recent Files",
            section = "recent_files",
            indent = 2,
            padding = 1,
          },
          {
            icon = icons.documents.OpenFolder,
            title = "Projects",
            section = "projects",
            indent = 2,
            padding = 1,
          },
          { section = "startup" },
        },
      },

      -- ===== Picker =====
      picker = {
        enabled = true,
        icon = icons.ui.Search,
        icon_hl = "SnacksPickerIcon",
        icon_pos = "left",
        prompt_pos = "title",
        win = { style = "picker" },
        expand = true,

        sources = {
          buffers = { layout = files_layout() },
          commands = { layout = palette_layout() },
          command_history = { layout = palette_layout() },
          files = { hidden = true, layout = files_layout() },
          git_files = { layout = files_layout() },
          git_branches = { layout = { preset = "vertical" } },
          git_status = { layout = files_layout() },
          help = { layout = { preset = "ivy_split" } },
          man = { layout = { preset = "ivy_split" } },
          notifications = { layout = palette_layout() },
          projects = { layout = files_layout(0.8) },
          recent = { layout = files_layout() },
          search_history = { layout = palette_layout() },
          smart = { layout = files_layout() },
          undo = { layout = { preset = "ivy" } },
          zoxide = { layout = files_layout(0.7) },
        },
      },

      -- ===== Core modules =====
      input = { enabled = true },
      bigfile = { enabled = true, notify = true, size = 100 * 1024 },
      bufdelete = { enabled = true },
      profiler = { enabled = true },
      rename = { enabled = true },
      image = { enabled = true },
      lazygit = { enabled = true },
      notify = { enabled = true },

      -- ===== Notifier =====
      notifier = {
        enabled = true,
        timeout = 2000,
        level = vim.log.levels.TRACE,
        icons = {
          debug = icons.ui.Bug,
          error = icons.diagnostics.Error,
          info = icons.diagnostics.Information,
          trace = icons.ui.Bookmark,
          warn = icons.diagnostics.Warning,
        },
      },

      -- ===== Scratch =====
      scratch = {
        enabled = true,
        name = "SCRATCH",
        autowrite = true,
        win = { width = 120, height = 40, border = "rounded" },
      },

      -- ===== Zen =====
      zen = { enabled = true, toggles = { dim = true } },

      -- ===== Indent =====
      indent = {
        enabled = true,
        priority = 1,
        char = icons.ui.SeparatorLight,
      },

      -- ===== Git =====
      git = { enabled = true },
      gitbrowse = { enabled = true },

      explorer = { enabled = false },
    })
  end,
}

