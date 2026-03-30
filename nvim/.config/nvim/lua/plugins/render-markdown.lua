return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  opts = {
    render_modes = { "n", "c" },
    file_types = { "markdown" },
    latex = {
      enabled = true,
      -- We now have this installed on the system!
      converter = "latex2text", 
      highlight = "RenderMarkdownMath",
      top_pad = 0,
      bottom_pad = 0,
    },
    anti_conceal = {
        enabled = true,
    },
  },
}
