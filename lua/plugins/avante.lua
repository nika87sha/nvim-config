-- ~/.config/nvim/lua/plugins/avante.lua
-- Asistente AI tipo Cursor - DISABLED: requires Rust 1.94+ (current: 1.92)
-- Re-enable after: rustup update && cd ~/.local/share/nvim/lazy/avante.nvim && make
return {
  'yetone/avante.nvim',
  enabled = false,
  lazy = false,
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  build = 'make',
  config = function()
    require('avante').setup({
      provider = 'openai',
      providers = {
        openai = {
          api_base = 'https://openrouter.ai/api/v1',
          model = 'deepseek/deepseek-chat',
          api_key_name = 'OPENROUTER_API_KEY',
        },
      },
    })
  end,
}