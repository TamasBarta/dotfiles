-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_del_augroup_by_name("lazyvim_resize_splits")

--- Flutter
--#region
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    require("utils.lsp").fix_all()
    require("utils.lsp").organize_imports()
  end,
  group = vim.api.nvim_create_augroup("organize_imports_on_save", { clear = true }),
  --#endregion
})
