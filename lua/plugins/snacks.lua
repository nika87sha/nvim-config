require('lazy').setup({
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      local status_ok, Snacks = pcall(require, 'snacks')
      if not status_ok then
          vim.notify("snacks.nvim no está instalado", vim.log.levels.WARN)
          return
      end

      Snacks.setup({
          animate = { enabled = true, duration = 20, fps = 60 },
          dashboard = { enabled = true },
          picker = { enabled = true },
          input = { enabled = true },
          bigfile = { enabled = true, notify = true, size = 100 * 1024 }, -- 100 KB
          bufdelete = { enabled = true },
          git = { enabled = true },
          gitbrowse = { enabled = true },
          lazygit = { enabled = true },
          notifier = { enabled = true, timeout = 2000 },
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
      })
    end
  },
})

