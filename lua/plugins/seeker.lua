return {
  "2kabhishek/seeker.nvim",
  lazy = false,
  dependencies = {
	"folke/snacks.nvim" 
	},
  cmd = { "Seeker" },
  keys = {
    { "<leader>fa", ":Seeker files<CR>", desc = "Seek Files" },
    { "<leader>fF", ":Seeker git_files<CR>", desc = "Seek Git Files" },
    { "<leader>fg", ":Seeker grep<CR>", desc = "Seek Grep" },
  },
  opts = {},
}

