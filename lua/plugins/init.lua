-- ~/.config/nvim2k/lua/plugins/init.lua

local plugins = {}

-- UI y tema
table.insert(plugins, require("plugins.alpha"))
table.insert(plugins, require("plugins.tokyonight"))
table.insert(plugins, require("plugins.lualine"))
table.insert(plugins, require("plugins.colorizer"))
table.insert(plugins, require("plugins.twilight"))

-- Navegación y búsqueda
table.insert(plugins, require("plugins.treesitter"))
table.insert(plugins, require("plugins.telescope"))
table.insert(plugins, require("plugins.filetree"))
table.insert(plugins, require("plugins.fzf-lua"))
table.insert(plugins, require("plugins.fterm"))

-- Desarrollo
table.insert(plugins, require("plugins.lsp"))
table.insert(plugins, require("plugins.autopairs"))
table.insert(plugins, require("plugins.comment"))
table.insert(plugins, require("plugins.nvim-lint"))
table.insert(plugins, require("plugins.render-markdown"))

-- Git y utilidades
table.insert(plugins, require("plugins.git"))
table.insert(plugins, require("plugins.gitsigns"))
table.insert(plugins, require("plugins.utilities"))

-- Otros
table.insert(plugins, require("plugins.which-key"))
table.insert(plugins, require("plugins.indent-blankline"))
table.insert(plugins, require("plugins.barbar"))

return plugins

