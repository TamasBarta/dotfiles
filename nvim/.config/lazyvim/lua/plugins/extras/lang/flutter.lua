return {
  -- add rust to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, { "dart" })
    end,
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
        '<cmd>lua require"nvim-treesitter-dart-data-class".generate()',
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
    "akinsho/flutter-tools.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>F", name = "+Flutter tools" },
      { "<leader>FR", "<cmd>FlutterRun<cr>", desc = "Run" },
      { "<leader>Fr", "<cmd>FlutterRestart<cr>", desc = "Restart" },
      { "<leader>Fd", "<cmd>FlutterDevices<cr>", desc = "Run on device" },
      { "<leader>Fe", "<cmd>FlutterEmulators<cr>", desc = "Start emulator" },
      { "<leader>Fq", "<cmd>FlutterQuit<cr>", desc = "Stop Flutter app" },
      { "<leader>Fc", "<cmd>FlutterLogClear<cr>", desc = "Clear logs" },
      { "<leader>Ft", "<cmd>FlutterOutlineToggle<cr>", desc = "Toggle outline" },
    },
    ft = "dart",
    opts = {
      ui = {
        -- the border type to use for all floating windows, the same options/formats
        -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
        border = "rounded",
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
}
