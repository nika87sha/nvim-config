require('neotest').setup({
  adapters = {
    require('neotest-python')(),
    require('neotest-jest')(),
  }
})