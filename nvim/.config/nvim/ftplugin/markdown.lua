-- ~/.config/nvim/ftplugin/markdown.lua
-- Disable spelling for markdown files
vim.opt_local.spell = false

-- Disable completion for markdown files (works for nvim-cmp and often blink.cmp in LazyVim)
vim.b.completion = false

-- For nvim-cmp specifically (if you ever switch back)
local cmp_loaded, cmp = pcall(require, "cmp")
if cmp_loaded then
  cmp.setup.buffer({ enabled = false })
end
