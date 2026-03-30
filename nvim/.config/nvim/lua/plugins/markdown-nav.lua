return {
  "tadmccorkle/markdown.nvim",
  ft = "markdown", -- Load only for markdown files
  opts = {
    -- Enable default keymaps (including gx for links)
    mappings = {
      link_follow = "gx",
    },
  },
}
