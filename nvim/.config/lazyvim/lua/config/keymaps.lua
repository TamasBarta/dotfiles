-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del({ "n", "i", "v" }, "<a-k>")
vim.keymap.del({ "n", "i", "v" }, "<a-j>")

vim.keymap.set({ "n", "v" }, "ő", "[", { remap = true })
vim.keymap.set({ "n", "v" }, "ú", "]", { remap = true })

vim.keymap.set({ "n", "v" }, "<c-h>", function()
  require("smart-splits").move_cursor_left()
end)
vim.keymap.set({ "n", "v" }, "<c-j>", function()
  require("smart-splits").move_cursor_down()
end)
vim.keymap.set({ "n", "v" }, "<c-k>", function()
  require("smart-splits").move_cursor_up()
end)
vim.keymap.set({ "n", "v" }, "<c-l>", function()
  require("smart-splits").move_cursor_right()
end)

vim.keymap.set({ "n", "v" }, "<C-S-p>", "<cmd>Telescope commands<cr>", { silent = true })
