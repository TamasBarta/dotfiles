-- command can be one of:
-- * edit.sortMembers
-- * edit.organizeImports
-- * edit.fixAll
local execute_command = function(command)
  local cur_buf = vim.api.nvim_get_current_buf()
  local cur_buf_name = vim.api.nvim_buf_get_name(cur_buf)
  local params = {
    command = command,
    arguments = {
      {
        path = cur_buf_name,
      },
    },
  }
  ---@diagnostic disable-next-line: missing-parameter
  vim.lsp.buf_request_sync(cur_buf, "workspace/executeCommand", params)
end

local M = {}
M.execute_command = execute_command
M.organize_imports = function()
  execute_command("edit.organizeImports")
end
M.fix_all = function()
  execute_command("edit.fixAll")
end
M.sort_members = function()
  execute_command("edit.sortMembers")
end
return M
