return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  opts = {
    -- Enable rendering only in Normal (n) and Command (c) modes.
    -- Entering Insert mode (i) will disable rendering, showing the raw markdown.
    render_modes = { "n", "c" },
    file_types = { "markdown" },
  },
}
