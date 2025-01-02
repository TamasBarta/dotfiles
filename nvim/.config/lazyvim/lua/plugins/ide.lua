return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local _, actions = pcall(require, "telescope.actions")
      opts.defaults.mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
        },
        -- for normal mode
        n = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sources = {
        "filesystem", -- keep this if you want to use the filesystem source
        -- "buffers",  -- comment or remove this line to disable buffers source
        -- "git_status",  -- comment or remove this line to disable git_status source
      },
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  "mfussenegger/nvim-dap",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    opts = function(_, opts)
      opts.mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = { "a", "i" },
        repl = "r",
        toggle = "t",
      }
      return opts
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    optional = true,
    keys = function()
      return {}
    end,
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      if opts.right == nil then
        opts.right = {}
      end
      if opts.bottom == nil then
        opts.bottom = {}
      end
      if opts.options == nil then
        opts.options = {}
      end
      if opts.options.right == nil then
        opts.options.right = {}
      end
      opts.options.right.size = 50

      vim.list_extend(opts.right, {
        {
          ft = "dapui_scopes",
          title = "Scopes",
          open = function()
            return require("dapui").open()
          end,
        },
        {
          ft = "dapui_breakpoints",
          title = "Breakpoints",
          open = function()
            return require("dapui").open()
          end,
        },
        {
          ft = "dapui_stacks",
          title = "Stacks",
          open = function()
            return require("dapui").open()
          end,
        },
        {
          ft = "dapui_watches",
          title = "Watches",
          open = function()
            return require("dapui").open()
          end,
        },
      })
      vim.list_extend(opts.bottom, {
        {
          ft = "dap-repl",
          title = "REPL",
          open = function()
            return require("dapui").open()
          end,
        },
        {
          ft = "dapui_console",
          title = "DAP Console",
          open = function()
            return require("dapui").open()
          end,
        },
      })

      opts.animate = { enabled = false }

      return opts
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    keys = {
      { "<leader>uC", "<cmd>CoverageToggle<cr>", desc = "Coverage" },
    },
  },
}
