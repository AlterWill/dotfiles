local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("keymaps")
require("lazy").setup("plugins")

-- Force black background
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = "#000000" })
vim.o.showcmd  = false

