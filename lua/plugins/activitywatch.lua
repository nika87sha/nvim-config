return {
  "ActivityWatch/aw-watcher-vim",
  lazy = true,
  cmd = { "AWStart", "AWStop" },
  config = function()
    vim.g.aw_host = "http://localhost:5600"
  end,
}