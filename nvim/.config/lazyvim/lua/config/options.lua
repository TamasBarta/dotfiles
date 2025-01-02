-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.exrc = true
vim.opt.swapfile = false

vim.opt.conceallevel = 2

-- word wrapping
vim.opt.lbr = true
vim.opt.breakindent = true

-------------------------------
--- LazyVim Options         ---
-------------------------------
-- disable all animations
vim.g.snacks_animate = false
vim.g.lazyvim_rust_diagnostics = "bacon-ls"
