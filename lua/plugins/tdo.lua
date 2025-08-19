return {
  {
    '2kabhishek/tdo.nvim',
    dependencies = { '2kabhishek/pickme.nvim' },
    cmd = { 'Tdo', 'TdoEntry', 'TdoNote', 'TdoTodos', 'TdoToggle', 'TdoFind', 'TdoFiles' },
    keys = { '[t', ']t' },
    config = function()
      require('tdo').setup({
        add_default_keybindings = true,
        completion = { offsets = {}, ignored_files = { 'README.md', 'templates' } },
        cache = { timeout = 5000, max_entries = 100 },
        lualine = { update_frequency = 300, only_show_in_notes = false },
      })
    end,
  }
}

