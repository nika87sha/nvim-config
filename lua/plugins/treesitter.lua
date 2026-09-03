-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "bash",
        "python",
        "rust",
        "go",
        "java",
        "groovy",      -- Jenkins pipelines
        "lua",
        "json",
        "yaml",        -- Docker, K8s, pipelines
        "toml",        -- Cargo.toml, pyproject.toml
        "dockerfile",
        "terraform",
        "hcl",
        "c",
        "cpp",
        "make",
        "sql",
        "regex",
        "vim",
        "vimdoc",
        "query",
      },
      highlight = {
        enable = true, -- Resaltado de sintaxis
      },
      indent = {
        enable = true, -- Indentación automática
      },
    })
  end,
}