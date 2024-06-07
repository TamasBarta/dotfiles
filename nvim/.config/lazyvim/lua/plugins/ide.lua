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
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "onsails/lspkind.nvim",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))

      opts.completion.completeopt = "menu,menuone,noinsert,noselect,preview"

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
      opts.formatting = {
        expandable_indicator = true,
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "FabijanZulj/blame.nvim",
    opts = {
      date_format = "%Y-%m-%d %H:%M:%S",
      merge_consecutive = true,
      virtual_style = "float",
      format = function(blame)
        return string.format("%s %s %s", blame.author, blame.date, blame.summary)
      end,
    },
    keys = {
      { "<leader>gB", "<cmd>BlameToggle virtual<cr>", desc = "Blame" },
      { "<leader>gb", "<cmd>BlameToggle window<cr>", desc = "Blame (window)" },
    },
  },
}
