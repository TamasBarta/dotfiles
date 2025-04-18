return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          mode = "n",
          { "<leader>F", group = "Flutter tools", icon = { icon = "󱗆 ", color = "cyan" } },
        },
        {
          mode = "n",
          { "<leader>G", group = "generate", icon = { icon = " ", color = "red" } },
        },
      },
    },
  },
  -- add Dart to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "dart" },
      indent = { enable = true, disable = { "dart" } },
    },
  },

  -- Ensure Dart debug adapter is installed
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "dart-debug-adapter" })
      end
    end,
  },
  {
    "TamasBarta/nvim-treesitter-dart-data-class",
    ft = "dart",
    keys = {
      { "<leader>G", name = "+generate" },
      {
        "<leader>Gd",
        '<cmd>lua require"nvim-treesitter-dart-data-class".generate()<cr>',
        desc = "Generate Dart data class methods",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    ft = { "dart" },
    dependencies = {
      "sidlatau/neotest-dart",
    },
    opts = {
      adapters = {
        ["neotest-dart"] = {},
      },
    },
  },
  {
    "mtdl9/vim-log-highlighting",
    lazy = true,
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    keys = {
      { "<leader>F", name = "+Flutter tools" },
      { "<leader>FR", "<cmd>FlutterRun<cr>", desc = "Run" },
      { "<leader>Fr", "<cmd>FlutterRestart<cr>", desc = "Restart" },
      { "<leader>Fd", "<cmd>FlutterDevices<cr>", desc = "Run on device" },
      { "<leader>Fe", "<cmd>FlutterEmulators<cr>", desc = "Start emulator" },
      { "<leader>Fq", "<cmd>FlutterQuit<cr>", desc = "Stop Flutter app" },
      { "<leader>Fc", "<cmd>FlutterLogClear<cr>", desc = "Clear logs" },
      { "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Toggle outline" },
      { "<leader>Ft", "<cmd>FlutterOpenDevTools<cr>", desc = "Open Flutter DevTools" },
    },
    ft = "dart",
    opts = {
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
          -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
          -- this will show the currently selected project configuration
          project_config = true,
        },
      },
      debugger = { -- integrate with nvim dap + install dart code debugger
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
      },
      -- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
      flutter_lookup_cmd = "asdf where flutter", -- example "dirname $(which flutter)" or "asdf where flutter"
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        -- highlight = "ErrorMsg", -- highlight for the closing tag
        prefix = "⇥ ", -- character to use for close tag e.g. > Widget
        enabled = true, -- set to false to disable
      },
      dev_log = {
        enabled = true,
        open_cmd = "tabedit", -- command to use to open the log buffer
        -- open_cmd = "10new", -- command to use to open the log buffer
      },
      dev_tools = {
        autostart = true, -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
      },
      outline = {
        open_cmd = "50vnew", -- command to use to open the outline buffer
        auto_open = false, -- if true this will open the outline automatically when it is first populated
      },
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = false, -- highlight the background
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = "■", -- the virtual text character to highlight
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
        },
      },
      -- I don't know if this works or not
      root_pattern = { ".git" },
    },
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, {
  --       function()
  --         return require("flutter-tools.decorations").statusline.app_version()
  --       end,
  --     })
  --     table.insert(opts.sections.lualine_x, {
  --       function()
  --         return require("flutter-tools.decorations").statusline.device()
  --       end,
  --     })
  --     return opts
  --   end,
  -- },
}
