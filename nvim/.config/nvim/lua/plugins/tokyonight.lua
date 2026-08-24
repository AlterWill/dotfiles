return {
  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(hl, c)
        hl.LineNr = {
          fg = "#A9B1D6", -- light gray-blue
        }

        hl.CursorLineNr = {
          fg = "#7DCFFF", -- TokyoNight cyan
          bold = true,
        }

        hl.LineNrAbove = {
          fg = "#FFFFFF",
        }

        hl.LineNrBelow = {
          fg = "#FFFFFF",
        }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")

      -- Force override after the colorscheme loads
      vim.api.nvim_set_hl(0, "CursorLineNr", {
        fg = "#00FFFF",
        bold = true,
      })
    end,
  },
}
