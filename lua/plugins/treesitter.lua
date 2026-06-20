-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        -- Lenguajes para DevOps / SysAdmin
        "bash",
        "python",
        "rust",
        "go",
        "java",
        "groovy",      -- Jenkins pipelines
        "lua",
        "json",
        "yaml",         -- Docker, K8s, pipelines
        "toml",         -- Rust (Cargo.toml), Python (pyproject.toml)
        "dockerfile",
        "terraform",
        "hcl",          -- HashiCorp Configuration Language (Terraform)
        "c",
        "cpp",
        "make",
        "sql",
        "regex",
        "vim",
        "vimdoc",
        "query",
      },
      highlight = { enable = true },
      indent = { enable = true },
      additional_vim_regex_highlighting = false,
    })
  end,
}
