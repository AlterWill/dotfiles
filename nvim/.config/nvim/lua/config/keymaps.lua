-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Register standard folding commands to make them searchable
vim.keymap.set("n", "za", "za", { desc = "Fold: Toggle fold under cursor" })
vim.keymap.set("n", "zc", "zc", { desc = "Fold: Close/collapse fold under cursor" })
vim.keymap.set("n", "zo", "zo", { desc = "Fold: Open/expand fold under cursor" })
vim.keymap.set("n", "zM", "zM", { desc = "Fold: Close/collapse all folds in buffer" })
vim.keymap.set("n", "zR", "zR", { desc = "Fold: Open/expand all folds in buffer" })
