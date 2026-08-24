-- bootstrap lazy.nvim, LazyVim and your plugins

vim.api.nvim_set_hl(0, "LineNr", { fg = "#A9B1D6" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#A9B1D6" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#A9B1D6" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#00FFFF", bold = true })

require("config.lazy")
