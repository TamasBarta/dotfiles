-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.colorcolumn = "81,121"
vim.opt.exrc = true
vim.opt.swapfile = false

vim.opt.conceallevel = 2

-- word wrapping
vim.opt.lbr = true
vim.opt.breakindent = true

vim.o.guifont = "JetBrainsMono Nerd Font:h14"

-------------------------------
--- LazyVim Options         ---
-------------------------------
-- disable all animations
vim.g.snacks_animate = false
vim.g.lazyvim_rust_diagnostics = "bacon-ls"
