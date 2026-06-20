-- ~/.config/nvim/lua/plugins/avante.lua
-- Asistente AI tipo Cursor (NO duplica config de CMP, eso está en cmp.lua)
return {
  'yetone/avante.nvim',
  lazy = false,
  dependencies = {
    'MunifTanjim/nui.nvim',
    -- CMP y sus fuentes ya están definidos en cmp.lua, no duplicar acá
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
