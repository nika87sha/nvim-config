return {
    {
        "williamboman/mason.nvim",
        lazy = false, -- se carga al inicio
        priority = 1000,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
}

