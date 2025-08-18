return {
    -- UI y tema
    require("plugins.alpha"),
    require("plugins.tokyonight"),
    require("plugins.lualine"),
    require("plugins.colorizer"),
    require("plugins.twilight"),

    -- Navegación y búsqueda
    require("plugins.treesitter"),
    require("plugins.mini"),
    require("plugins.telescope"),
    require("plugins.filetree"),
    require("plugins.fzf-lua"),
    require("plugins.fterm"),
    require("plugins.cmp"),

    -- Desarrollo
    require("plugins.mason"),          -- << Asegúrate de tener este
    require("plugins.lsp"),
    require("plugins.autopairs"),
    require("plugins.comment"),
    require("plugins.nvim-lint"),
    require("plugins.render-markdown"),

    -- Git y utilidades
    require("plugins.git"),
    require("plugins.gitsigns"),
    require("plugins.utilities"),

    -- Otros
    require("plugins.which-key"),
    require("plugins.avante"),
    require("plugins.indent-blankline"),
    require("plugins.barbar"),
}

