return {
  "stevearc/conform.nvim",
  lazy = false,
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        bash = { "shfmt" },
        sh = { "shfmt" },
        dockerfile = { "hadolint" },
        terraform = { "terraform_fmt" },
        hcl = { "hcl" },
        markdown = { "prettier" },
        toml = { "taplo" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-bn", "-ci" },
        },
        prettier = {
          prepend_args = { "--prose-wrap", "always" },
        },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      require("conform").format({
        async = true,
        lsp_fallback = true,
      })
    end, { desc = "Format code" })
  end,
}
