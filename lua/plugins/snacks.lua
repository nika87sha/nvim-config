return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false, -- Això assegura que es carregui al inici
  dependencies = { 
    'kdheepak/lazygit.nvim',
    -- y cualquier otra dependencia que uses (como nvim-web-devicons, etc.)
  },
  config = function()
    -- Només carreguem el mòdul.
    local snacks = require('snacks')

    snacks.setup({ -- Utilitzem la variable local 'snacks'
      animate = { enabled = true, duration = 20, fps = 60 },
      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },
          {
            icon = icons.ui.Keyboard,
            title = 'Keymaps',
            section = 'keys',
            indent = 2,
            padding = 1,
          },
          {
            icon = icons.documents.File,
            title = 'Recent Files',
            section = 'recent_files',
            indent = 2,
            padding = 1,
          },
          {
            icon = icons.documents.OpenFolder,
            title = 'Projects',
            section = 'projects',
            indent = 2,
            padding = 1,
          },
          { section = 'startup' },
        },
      },
      picker = {
        enabled = true,
        icon = icons.ui.Search,
        icon_hl = 'SnacksPickerIcon',
        icon_pos = 'left',
        prompt_pos = 'title',
        win = { style = 'picker' },
        expand = true,
        sources = {
          -- layout options: dropdown, horizontal, vertical, vscode, ivy, ivy_split, telescope, top, left, right, bottom, sidebar
          buffers = { layout = files_layout() },
          commands = { layout = palette_layout() },
          command_history = { layout = palette_layout() },
          files = {
            hidden = true,
            layout = files_layout(),
          },
          icons = {
            icon_sources = { 'nerd_fonts', 'emoji' },
            layout = palette_layout(),
          },
          git_files = { layout = files_layout() },
          git_branches = { layout = { preset = 'vertical' } },
          git_status = { layout = files_layout() },
          help = { layout = { preset = 'ivy_split' } },
          man = { layout = { preset = 'ivy_split' } },
          notifications = { layout = palette_layout() },
          projects = { layout = files_layout(0.8) },
          recent = { layout = files_layout() },
          search_history = { layout = palette_layout() },
          smart = { layout = files_layout() },
          undo = { layout = { preset = 'ivy' } },
          zoxide = { layout = files_layout(0.7) },
        },
      },
      input = { enabled = true },
      bigfile = { enabled = true, notify = true, size = 100 * 1024 }, -- 100 KB
      bufdelete = { enabled = true },
      git = { enabled = true },
      gitbrowse = { enabled = true },
      lazygit = { enabled = true },
      notify = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 2000,
        width = { min = 40, max = 0.4 },
        height = { min = 1, max = 0.6 },
        margin = { top = 0, right = 1, bottom = 0 },
        padding = true,
        sort = { 'level', 'added' },
        level = vim.log.levels.TRACE,
        icons = {
          debug = icons.ui.Bug,
          error = icons.diagnostics.Error,
          info = icons.diagnostics.Information,
          trace = icons.ui.Bookmark,
          warn = icons.diagnostics.Warning,
        },
        style = 'compact',
        top_down = true,
        date_format = '%R',
        more_format = ' ↓ %d lines ',
        refresh = 50,
      },
      profiler = { enabled = true },
      rename = { enabled = true },
      scratch = {
        enabled = true,
        name = 'SCRATCH',
        ft = function()
          if vim.bo.buftype == '' and vim.bo.filetype ~= '' then
            return vim.bo.filetype
          end
          return 'markdown'
        end,
        autowrite = true,
        win = { width = 120, height = 40, border = 'rounded' },
      },
      zen = { enabled = true, toggles = { dim = true } },
      explorer = { enabled = false },
      git = { enabled = true },
      gitbrowse = { enabled = true },
      image = { enabled = true },
      indent = {
        enabled = true,
        priority = 1,
        char = icons.ui.SeparatorLight,
        only_scope = false,
        only_current = false,
        hl = {
          'SnacksIndent1',
          'SnacksIndent2',
          'SnacksIndent3',
          'SnacksIndent4',
          'SnacksIndent5',
          'SnacksIndent6',
          'SnacksIndent7',
          'SnacksIndent8',
        },
      },
    })
  end,
}
