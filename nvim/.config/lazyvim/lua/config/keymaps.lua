-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.del({ "n", "i", "v" }, "<a-k>")
-- vim.keymap.del({ "n", "i", "v" }, "<a-j>")

vim.keymap.set({ "n", "v" }, "<c-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set({ "n", "v" }, "<c-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set({ "n", "v" }, "<c-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set({ "n", "v" }, "<c-l>", "<cmd>TmuxNavigateRight<cr>")
