-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_del_augroup_by_name("lazyvim_resize_splits")

--- Flutter
--#region
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.dart" },
  callback = function()
    local is_autoformat_on = vim.g.autoformat_enabled
    if not is_autoformat_on then
      return
    end
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

local imports = vim.api.nvim_create_augroup("folding_imports", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  callback = function()
    vim.opt_local.foldlevelstart = 19
    vim.opt_local.foldlevel = 19
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lnum==1?'>1':getline(v:lnum)=~'^ *use'?20:nvim_treesitter#foldexpr()"
  end,
  group = imports,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dart" },
  callback = function()
    vim.opt_local.foldlevelstart = 19
    vim.opt_local.foldlevel = 19
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lnum==0?'>1':getline(v:lnum)=~'import'?20:nvim_treesitter#foldexpr()"
  end,
  group = imports,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "swift" },
  callback = function()
    vim.opt_local.foldlevelstart = 19
    vim.opt_local.foldlevel = 19
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lnum==0?'>0':getline(v:lnum)=~'import'?20:nvim_treesitter#foldexpr()"
  end,
  group = imports,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "kotlin",
  callback = function()
    local cmd = { "kotlin-lsp.sh", "--stdio" }
    -- local function find_git_root(fname)
    --   local git_dir = vim.fs.find(".git", { path = fname, upward = true })[1]
    --   return git_dir and vim.fs.dirname(git_dir) or vim.fn.getcwd()
    -- end
    --
    -- local root_dir = find_git_root(vim.api.nvim_buf_get_name(0))

    local client_id = vim.lsp.start({
      cmd = cmd,
      name = "kotlin_ls",
      root_markers = { "androidproject" },
      filetypes = { "kotlin" },
    })

    vim.lsp.buf_attach_client(0, client_id)
  end,
})
