return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        signature = { enabled = false },
        hover = { enabled = false },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false,  -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function() require("notify").dismiss { silent = true, pending = true } end,
        desc = "Delete all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    opts = {
      flutter_lookup_cmd = "asdf where flutter",
      closing_tags = {
        prefix = "/>",
      },
    },
    filetypes = { "dart" },
    keys = {
      { "<leader>Fr", "<cmd>FlutterRun<cr>",           desc = "Run" },
      { "<leader>Fd", "<cmd>FlutterDevices<cr>",       desc = "Devices" },
      { "<leader>Fc", "<cmd>FlutterLogClear<cr>",      desc = "Clear" },
      { "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Toggle outline" },
      { "<leader>Fg", "<cmd>FlutterPubGet<cr>",        desc = "Pub Get" },
      { "<leader>FR", "<cmd>FlutterRestart<cr>",       desc = "Restart" },
      { "<leader>Fq", "<cmd>FlutterQuit<cr>",          desc = "Quit" },
    },
  }, -- add lsp plugin
}
