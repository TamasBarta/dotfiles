return {
  {
    "tiagovla/scope.nvim",
    config = true,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = true,
    opts = function(_, opts)
      if opts.options == nil then
        opts.options = {}
      end
      opts.options.always_show_bufferline = true
      opts.options.separator_style = "slant"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      local function is_available()
        return package.loaded["flutter-tools"] and require("flutter-tools.commands").is_running()
      end

      table.insert(opts.sections.lualine_x, 2, {
        function()
          if not is_available() then
            return
          end
          local device = vim.g.flutter_tools_decorations.device
          local device_name = device and (device.name or device.id) or "DEFAULT"
          return device_name .. "  " .. vim.g.flutter_tools_decorations.app_version
        end,
        color = "DiagnosticOk",
        cond = is_available,
      })

      return opts
    end,
  },
}
