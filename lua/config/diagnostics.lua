-- lua/plugins/diagnostics.lua
-- Native diagnostics quickfix/loclist integration (replaces trouble.nvim)
-- No plugin needed - uses built-in vim.diagnostic and quickfix

local M = {}

-- Toggle quickfix list with diagnostics
function M.toggle_diagnostics(scope)
  scope = scope or "workspace"
  local qf_exists = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      qf_exists = true
      break
    end
  end

  if qf_exists then
    vim.cmd("cclose")
    return
  end

  if scope == "workspace" then
    vim.diagnostic.setqflist({ open = false })
  elseif scope == "document" then
    vim.diagnostic.setqflist({ open = false, severity = { min = vim.diagnostic.severity.HINT } })
  elseif scope == "quickfix" then
    -- already open
  elseif scope == "loclist" then
    vim.diagnostic.setloclist({ open = false })
    vim.cmd("lopen")
    return
  elseif scope == "lsp_references" then
    -- handled by LSP keymaps
    return
  end

  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  else
    vim.notify("No diagnostics found", vim.log.levels.INFO)
  end
end

-- Quick keymaps
vim.keymap.set("n", "<leader>xx", function() M.toggle_diagnostics("workspace") end, { desc = "Toggle diagnostics (workspace)" })
vim.keymap.set("n", "<leader>xw", function() M.toggle_diagnostics("workspace") end, { desc = "Workspace diagnostics" })
vim.keymap.set("n", "<leader>xd", function() M.toggle_diagnostics("document") end, { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>xq", function() M.toggle_diagnostics("quickfix") end, { desc = "Quickfix list" })
vim.keymap.set("n", "<leader>xl", function() M.toggle_diagnostics("loclist") end, { desc = "Location list" })

-- LSP references - use Telescope instead
vim.keymap.set("n", "gR", function()
  require("telescope.builtin").lsp_references()
end, { desc = "LSP references (Telescope)" })

return M