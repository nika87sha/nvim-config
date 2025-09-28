return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPost",
  config = function()
    local gs = require("gitsigns")

    gs.setup({
      signs = {
        -- REEMPLAZO DE 'icons.ui.Xxxx' por caracteres Unicode o ASCII:
        add = { text = '▎' },       -- ▎ (Bloque vertical para añadido)
        change = { text = '▎' },    -- ▎ (Bloque vertical para modificado)
        delete = { text = '勞' },    -- 勞 (Símbolo para delete, o usar '▔' o '_')
        topdelete = { text = '▔' }, -- ▔ (Línea superior para topdelete)
        changedelete = { text = '▎' },
        untracked = { text = '┆' }, -- ┆ (Línea punteada o usar '?')
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      -- ... el resto de tu configuración es idéntica
      watch_gitdir = { interval = 1000, follow_files = true },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 0,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      on_attach = function(bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        map('n', ']e', function()
          if vim.wo.diff then
            return ']e'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Next Change' })
        map('n', '[e', function()
          if vim.wo.diff then
            return '[e'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Prev Change' })
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<cr>')
      end,
    })
  end,
}
