return {
  "kdheepak/lazygit.nvim",
   cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  
  -- You can keep this, but the separate entry above is more robust
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  
}
