-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_del_augroup_by_name("lazyvim_resize_splits")

--- Flutter
--#region
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.dart" },
  callback = function()
    require("utils.lsp").fix_all()
    require("utils.lsp").organize_imports()
  end,
  group = vim.api.nvim_create_augroup("organize_imports_on_save", { clear = true }),
  --#endregion
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.md" },
  callback = function()
    -- Toggle checked state of "- [ ]" list item in markdown files
    vim.keymap.set(
      { "n", "i", "v" },
      "<C-Cr>",
      "<cmd>s/^\\(\\s*\\)- \\[ \\] /\\1REPPLACEHOLDER /e | s/^\\(\\s*\\)- \\[[xX]\\] /\\1- [ ] /e | s/^\\(\\s*\\)REPPLACEHOLDER /\\1- [x] /e | norm j^<cr>",
      { desc = "Toggle checked state of checkable list item", buffer = true }
    )
  end,
  group = vim.api.nvim_create_augroup("markdown_hotkeys", { clear = true }),
})
