-- lua/plugins/treesitter.lua
-- nvim-treesitter (rama main): solo gestiona la instalación de parsers.
-- El resaltado (vim.treesitter.start) y el indent ya son nativos de Neovim.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    -- Parsers para DevOps / SysAdmin
    require("nvim-treesitter").install({
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
    })

    -- Resaltado + indentación con treesitter en cada buffer que tenga parser
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Treesitter: highlight + indent",
      callback = function(args)
        pcall(vim.treesitter.start)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
