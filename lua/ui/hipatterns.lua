-- ~/.config/nvim/lua/plugins/hipatterns.lua
return {
  "echasnovski/mini.hipatterns",
  lazy = false,
  config = function()
    local hipatterns = require("mini.hipatterns")

    hipatterns.setup({
      highlighters = {
        -- TODOs y FIXME en comentarios
        todo = { pattern = "%f[%w]()TODO()%f[%W]", hl = "Todo" },
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", hl = "Error" },

        -- NOTEs o INFO en comentarios
        note = { pattern = "%f[%w]()NOTE()%f[%W]", hl = "Identifier" },

        -- URLs
        url = { pattern = "https?://[%w-_%.%?%.:/%+=&]+", hl = "Underlined" },

        -- Tickets o IDs de issues tipo #123
        issue = { pattern = "#%d+", hl = "Constant" },

        -- Palabras especiales en código
        hack = { pattern = "%f[%w]()HACK()%f[%W]", hl = "WarningMsg" },
      },
    })

    -- Opcional: activar hipatterns sólo en ciertos lenguajes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "python", "sh", "bash", "c", "java" },
      callback = function()
        hipatterns.setup()
      end,
    })
  end,
}

