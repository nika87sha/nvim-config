return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "codecompanion" },
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  opts = {
    file_types = { "markdown", "codecompanion" },
    heading = {
      sign = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      backgrounds = { "RenderMarkdownH1Bg", "RenderMarkdownH2Bg", "RenderMarkdownH3Bg", "RenderMarkdownH4Bg", "RenderMarkdownH5Bg", "RenderMarkdownH6Bg" },
      foregrounds = { "RenderMarkdownH1", "RenderMarkdownH2", "RenderMarkdownH3", "RenderMarkdownH4", "RenderMarkdownH5", "RenderMarkdownH6" },
    },
    code = {
      sign = true,
      style = "full",
      width = "full",
      left_pad = 1,
      right_pad = 1,
      language_pad = 0,
      border = "thin",
    },
    bullet = { icons = { "●", "○", "◆", "◇" } },
    checkbox = { unchecked = { icon = "󰄱 " }, checked = { icon = "󰱒 " } },
    pipe_table = { preset = "round" },
    link = { wiki = { icon = "󰱱 " } },
    sign = { enabled = true },
    latex = { enabled = false },
  },
}