-- lua/lsp/java.lua

local ok, jdtls = pcall(require, "jdtls")
if not ok then
  return
end

local root_markers = { ".git", "pom.xml", "build.gradle", "mvnw", "gradlew" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- 🚑 Si no es un proyecto Java, salimos
if root_dir == nil then
  return
end

local workspace_dir = vim.fn.stdpath("data")
  .. "/jdtls-workspace/"
  .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
  cmd = {
    vim.fn.stdpath("data") .. "/mason/bin/jdtls",
    "-data",
    workspace_dir,
  },
  root_dir = root_dir,

  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
}

jdtls.start_or_attach(config)

