-- ~/.config/nvim/lua/plugins/mini.lua
return {
  'echasnovski/mini.files',
  lazy = false,
  config = function()
    local status_ok, MiniFiles = pcall(require, 'mini.files')
    if not status_ok then
      vim.notify("mini.files no está instalado", vim.log.levels.WARN)
      return
    end

    MiniFiles.setup({
      windows = {
        width = 30,
        mappings = {
          go_in = 'l',
          go_out = 'h',
          go_top = 'H',
          go_bottom = 'L',
          reset = '<BS>',
        },
      },
      mappings = {
        toggle_hidden = 'zh',
      },
    })
  end,
}

