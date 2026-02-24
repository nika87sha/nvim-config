-- =========================================================
-- DEVOPS / SYSADMIN KEYBINDINGS
-- =========================================================
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =========================================================
-- TERMINAL
-- =========================================================

-- Toggle terminal with Ctrl+\
map("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

-- Bash terminal
map("n", "<leader>tb", function()
  _BASH_TOGGLE()
end, { desc = "Toggle Bash terminal" })

-- Python REPL
map("n", "<leader>tp", function()
  _PYTHON_TOGGLE()
end, { desc = "Toggle Python REPL" })

-- Node REPL
map("n", "<leader>tn", function()
  _NODE_TOGGLE()
end, { desc = "Toggle Node REPL" })

-- =========================================================
-- GIT & DIFF
-- =========================================================

-- Diffview
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git diff view" })
map("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { desc = "Close diff view" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", { desc = "File history" })
map("n", "<leader>gH", "<cmd>DiffviewFileHistory %<CR>", { desc = "File history (current)" })

-- =========================================================
-- DIAGNOSTICS & LSP
-- =========================================================

-- Trouble
map("n", "<leader>xx", function()
  require("trouble").toggle()
end, { desc = "Toggle trouble" })

map("n", "<leader>xw", function()
  require("trouble").toggle("workspace_diagnostics")
end, { desc = "Workspace diagnostics" })

map("n", "<leader>xd", function()
  require("trouble").toggle("document_diagnostics")
end, { desc = "Document diagnostics" })

map("n", "<leader>xq", function()
  require("trouble").toggle("quickfix")
end, { desc = "Quickfix list" })

map("n", "<leader>xl", function()
  require("trouble").toggle("loclist")
end, { desc = "Location list" })

map("n", "gR", function()
  require("trouble").toggle("lsp_references")
end, { desc = "LSP references" })

-- =========================================================
-- FILE/CONFIG MANAGEMENT
-- =========================================================

-- Find config files
map("n", "<leader>fc", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.expand("~/.config"),
  })
end, { desc = "Find config files" })

-- Find Docker files
map("n", "<leader>fd", function()
  require("telescope.builtin").find_files({
    search_dirs = { vim.loop.cwd() },
    find_command = { "find", ".", "-name", "*[Dd]ocker*" },
  })
end, { desc = "Find Docker files" })

-- Find Kubernetes files
map("n", "<leader>fk", function()
  require("telescope.builtin").find_files({
    search_dirs = { vim.loop.cwd() },
    find_command = { "find", ".", "-name", "*.yaml", "-o", "-name", "*.yml" },
  })
end, { desc = "Find K8s files" })

-- Find Terraform files
map("n", "<leader>ft", function()
  require("telescope.builtin").find_files({
    search_dirs = { vim.loop.cwd() },
    find_command = { "find", ".", "-name", "*.tf" },
  })
end, { desc = "Find Terraform files" })

-- =========================================================
-- SYSTEM ADMINISTRATION
-- =========================================================

-- Toggle hidden files in file explorer
map("n", "<leader>fh", "<cmd>NvimTreeToggleHidden<CR>", { desc = "Toggle hidden files" })

-- Format current file
map("n", "<leader>lf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

-- =========================================================
-- QUICK ACTIONS FOR DEVOPS
-- =========================================================

-- Run shell command
map("n", "<leader>rs", function()
  local cmd = vim.fn.input("Run command: ", "", "file")
  if cmd ~= "" then
    vim.cmd("!" .. cmd)
  end
end, { desc = "Run shell command" })

-- Execute current file as script
map("n", "<leader>rx", function()
  local file = vim.fn.expand("%")
  vim.cmd("!" .. file)
end, { desc = "Execute current file" })

-- Copy file path
map("n", "<leader>yp", function()
  local file = vim.fn.expand("%:p")
  vim.fn.setreg("+", file)
  vim.notify("Copied: " .. file)
end, { desc = "Copy file path" })

-- =========================================================
-- SNIPPETS QUICK ACCESS
-- =========================================================

-- Insert Docker snippet
map("n", "<leader>sd", function()
  require("luasnip").snip_expand(require("luasnip").parse_snippet("dockerfile", ""))
end, { desc = "Insert Dockerfile template" })

-- =========================================================
-- SEARCH & GREP
-- =========================================================

-- Live grep in current directory
map("n", "<leader>sg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Search text" })

-- Search word under cursor
map("n", "<leader>sw", function()
  require("telescope.builtin").grep_string()
end, { desc = "Search word" })

-- Recent files
map("n", "<leader>fr", function()
  require("telescope.builtin").oldfiles()
end, { desc = "Recent files" })

-- =========================================================
-- HELP & DOCUMENTATION
-- =========================================================

-- Help tags
map("n", "<leader>?", function()
  require("telescope.builtin").help_tags()
end, { desc = "Help tags" })

-- Vim commands
map("n", "<leader>:", function()
  require("telescope.builtin").commands()
end, { desc = "Commands" })
