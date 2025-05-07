return {
  {
    "wojciech-kulik/xcodebuild.nvim",
    enabled = vim.fn.has("macunix"),
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "folke/snacks.nvim", -- (optional) to show previews
      -- "nvim-tree/nvim-tree.lua", -- (optional) to manage project files
      -- "stevearc/oil.nvim", -- (optional) to manage project files
      "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
    },
    config = function()
      require("xcodebuild").setup({
        integrations = {
          pymobiledevice = {
            enabled = true,
          },
        },
      })
    end,
    ft = "swift",
    keys = {
      { "<leader>i", name = "+Xcodebuild" },
      { "<leader>is", "<cmd>XcodebuildSetup<cr>", desc = "Xcodebuild setup" },
      { "<leader>il", "<cmd>XcodebuildToggleLogs<cr>", desc = "Xcodebuild logs" },
      { "<leader>ix", "<cmd>XcodebuildOpenInXcode<cr>", desc = "Open in Xcode" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          mode = "n",
          { "<leader>i", group = "Xcodebuild", icon = { icon = "󰀵 ", color = "cyan" } },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.sourcekit = {}
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      if opts.sources == nil then
        opts.sources = {}
      end
      table.insert(opts.sources, nls.builtins.formatting.swiftformat)
      table.insert(opts.sources, nls.builtins.diagnostics.swiftlint)
    end,
  },
}
