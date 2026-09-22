-- plugins/nvim-lint.lua
return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      lua = { "luacheck" },
      python = { "flake8" },
      ansible = { "ansible_lint" },
      dockerfile = { "hadolint" },
      terraform = { "terraform_validate" },
      tf = { "terraform_validate" },
      hcl = { "terraform_validate" },
      bash = { "shellcheck" },
      sh = { "shellcheck" },
      yaml = { "yamllint" },
      yml = { "yamllint" },
      json = { "jsonlint" },
      markdown = { "markdownlint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function() lint.try_lint() end,
    })
  end,
}

