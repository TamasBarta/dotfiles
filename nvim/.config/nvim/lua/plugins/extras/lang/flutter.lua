return {
  {
    "akinsho/flutter-tools.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      -- alternatively you can override the default configs
      require("flutter-tools").setup({
        ui = {
          -- the border type to use for all floating windows, the same options/formats
          -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
          border = "rounded",
        },
        decorations = {
          statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = true,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = true,
          },
        },
        debugger = { -- integrate with nvim dap + install dart code debugger
          enabled = true,
          run_via_dap = false,
        },
        -- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
        flutter_lookup_cmd = "asdf where flutter", -- example "dirname $(which flutter)" or "asdf where flutter"
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          -- highlight = "ErrorMsg", -- highlight for the closing tag
          prefix = "</", -- character to use for close tag e.g. > Widget
          enabled = true, -- set to false to disable
        },
        dev_log = {
          enabled = true,
          open_cmd = "tabedit", -- command to use to open the log buffer
          -- open_cmd = "10new", -- command to use to open the log buffer
        },
        dev_tools = {
          autostart = false, -- autostart devtools server if not detected
          auto_open_browser = true, -- Automatically opens devtools in the browser
        },
        outline = {
          open_cmd = "50vnew", -- command to use to open the outline buffer
          auto_open = false, -- if true this will open the outline automatically when it is first populated
        },
        lsp = {
          -- on_attach = require("lvim.lsp").common_on_attach,
          -- on_init = require("lvim.lsp").common_on_init,
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
          },
        },
        -- I don't know if this works or not
        root_pattern = { ".git" },
      })
    end,
  },
}
