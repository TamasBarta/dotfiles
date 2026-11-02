-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_del_augroup_by_name("lazyvim_resize_splits")

--- Flutter
--#region
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.dart" },
  callback = function()
    -- vim.b.autoformat (buffer-local) takes precedence, falls back to vim.g.autoformat
    local autoformat = vim.F.if_nil(vim.b.autoformat, vim.F.if_nil(vim.g.autoformat, true))
    if not autoformat then
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

-- Collapse the import/use block at the top of the file into a single fold by
-- giving those lines an artificially high fold level, while everything else
-- uses the regular treesitter folds.
local fold_level = 19
local import_level = 20
local import_pattern = {
  rust = "^ *use",
  dart = "^import",
  swift = "^import",
}

local function fold_expr(ft)
  return ("getline(v:lnum)=~'%s'?%d:v:lua.vim.treesitter.foldexpr()"):format(import_pattern[ft], import_level)
end

-- Applies to the current window, so call it from a FileType autocmd or inside
-- nvim_win_call.
local function apply_fold_opts(ft)
  vim.opt_local.foldmethod = "expr"
  vim.opt_local.foldexpr = fold_expr(ft)
  vim.opt_local.foldlevel = fold_level
end

-- 'sessionoptions' contains "folds", which persists not just fold state but the
-- *local fold options* (foldmethod/foldexpr/foldlevel) into every session file,
-- replaying them on restore -- after the FileType autocmd below has already run.
-- That silently pins whatever foldexpr was current when the session was written,
-- surviving restarts and looking exactly like a broken config.
--
-- To stay self-healing, stamp a fingerprint of the fold config into a global
-- that "globals" in 'sessionoptions' persists alongside it (needs an uppercase
-- first letter and at least one lowercase letter to be saved). If a restored
-- session disagrees, its fold options are stale and we re-apply ours.
local function fold_fingerprint()
  local fts = vim.tbl_keys(import_pattern)
  table.sort(fts)
  local parts = { tostring(fold_level) }
  for _, ft in ipairs(fts) do
    parts[#parts + 1] = ft .. "=" .. fold_expr(ft)
  end
  return vim.fn.sha256(table.concat(parts, "\n"))
end

vim.g.FoldCfg = fold_fingerprint()

local restoring_session = false

vim.api.nvim_create_autocmd("User", {
  pattern = "PersistenceLoadPre",
  group = imports,
  callback = function()
    restoring_session = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(import_pattern),
  group = imports,
  callback = function(ev)
    apply_fold_opts(vim.bo[ev.buf].filetype)
    -- The session replays its own `zo`/`zc` fold state right after this; the
    -- scheduled zX below would run afterwards and discard it.
    if restoring_session then
      return
    end
    -- Treesitter folds are computed lazily, so at this point no folds exist yet
    -- and setting 'foldlevel' above has nothing to close. Re-apply it once the
    -- parser has caught up, otherwise the file opens fully unfolded.
    -- (`zX`, not `zx` -- the latter ends with `zv`, reopening the fold under
    -- the cursor, which on a fresh buffer is the import block itself.)
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(ev.buf) and vim.api.nvim_get_current_buf() == ev.buf then
        pcall(vim.cmd.normal, { "zX", bang = true })
      end
    end)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "PersistenceLoadPost",
  group = imports,
  callback = function()
    restoring_session = false

    local current = fold_fingerprint()
    if vim.g.FoldCfg == current then
      return
    end

    -- Fold config changed since this session was written, so the session just
    -- replayed stale fold options. Re-applying them recomputes the folds, which
    -- unavoidably discards the restored open/closed state -- once. The new stamp
    -- is saved on exit, so subsequent restores are clean again.
    vim.g.FoldCfg = current
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      local ft = vim.bo[buf].filetype
      if import_pattern[ft] then
        vim.api.nvim_win_call(win, function()
          apply_fold_opts(ft)
          pcall(vim.cmd.normal, { "zX", bang = true })
        end)
      end
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.diagnostic.config({
      virtual_text = false,
      underline = false,
      signs = false,
    }, vim.api.nvim_get_current_buf())
  end,
})
