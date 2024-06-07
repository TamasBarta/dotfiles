return {
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "xiyaowong/transparent.nvim",
    enabled = false,
    lazy = false,
    opts = {
      groups = { -- table: default groups
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        -- "NonText",
        -- "SignColumn",
        -- "CursorLine",
        -- "CursorLineNr",
        -- "StatusLine",
        -- "StatusLineNC",
        "EndOfBuffer",
      },
      extra_groups = {}, -- table: additional groups that should be cleared
      exclude_groups = {}, -- table: groups you don't want to clear
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      -- transparent_background = true, -- disables setting the background color
      custom_highlights = function(C)
        return {
          CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
          CmpItemKindKeyword = { fg = C.base, bg = C.red },
          CmpItemKindText = { fg = C.base, bg = C.teal },
          CmpItemKindMethod = { fg = C.base, bg = C.blue },
          CmpItemKindConstructor = { fg = C.base, bg = C.blue },
          CmpItemKindFunction = { fg = C.base, bg = C.blue },
          CmpItemKindFolder = { fg = C.base, bg = C.blue },
          CmpItemKindModule = { fg = C.base, bg = C.blue },
          CmpItemKindConstant = { fg = C.base, bg = C.peach },
          CmpItemKindField = { fg = C.base, bg = C.green },
          CmpItemKindProperty = { fg = C.base, bg = C.green },
          CmpItemKindEnum = { fg = C.base, bg = C.green },
          CmpItemKindUnit = { fg = C.base, bg = C.green },
          CmpItemKindClass = { fg = C.base, bg = C.yellow },
          CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
          CmpItemKindFile = { fg = C.base, bg = C.blue },
          CmpItemKindInterface = { fg = C.base, bg = C.yellow },
          CmpItemKindColor = { fg = C.base, bg = C.red },
          CmpItemKindReference = { fg = C.base, bg = C.red },
          CmpItemKindEnumMember = { fg = C.base, bg = C.red },
          CmpItemKindStruct = { fg = C.base, bg = C.blue },
          CmpItemKindValue = { fg = C.base, bg = C.peach },
          CmpItemKindEvent = { fg = C.base, bg = C.blue },
          CmpItemKindOperator = { fg = C.base, bg = C.blue },
          CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
          CmpItemKindCopilot = { fg = C.base, bg = C.teal },
        }
      end,
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
      color_overrides = {
        mocha = {
          -- custom everforest dark hard port
          rosewater = "#fed1cb",
          flamingo = "#ff9185",
          pink = "#d699b6",
          mauve = "#cb7ec8",
          red = "#e06062",
          maroon = "#e67e80",
          peach = "#e69875",
          yellow = "#d3ad63",
          green = "#b0cc76",
          teal = "#6db57f",
          sky = "#7fbbb3",
          sapphire = "#60aaa0",
          blue = "#59a6c3",
          lavender = "#e0d3d4",
          text = "#e8e1bf",
          subtext1 = "#e0d7c3",
          subtext0 = "#d3c6aa",
          overlay2 = "#9da9a0",
          overlay1 = "#859289",
          overlay0 = "#6d6649",
          surface2 = "#585c4a",
          surface1 = "#414b50",
          surface0 = "#374145",
          base = "#1f2428",
          mantle = "#161b1d",
          crust = "#14181a",
        },
        latte = {
          -- custom everforest light hard port
          rosewater = "#a43b35",
          flamingo = "#da3537",
          pink = "#d332a1",
          mauve = "#aa3685",
          red = "#ff3532",
          maroon = "#de3631",
          peach = "#f36c0b",
          yellow = "#bd8800",
          green = "#596600",
          teal = "#287e5e",
          sky = "#52b1c7",
          sapphire = "#3fb4b8",
          blue = "#317da7",
          lavender = "#474155",
          text = "#4d4742",
          subtext1 = "#5b5549",
          subtext0 = "#6d6655",
          overlay2 = "#786d5a",
          overlay1 = "#8c7c62",
          overlay0 = "#a18d66",
          surface2 = "#c9bea5",
          surface1 = "#d8d3ba",
          surface0 = "#e8e2c8",
          base = "#ebe4c8",
          mantle = "#e1dab5",
          crust = "#bdc0a0",
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "catppuccin",
      },
    },
  },
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    enabled = function()
      return vim.fn.has("macunix") == 1
    end,
    opts = {
      set_dark_mode = function()
        -- vim.api.nvim_set_option("background", "dark")
        vim.opt.background = "dark"
        -- vim.cmd("Catppuccin mocha")
      end,
      set_light_mode = function()
        -- vim.api.nvim_set_option("background", "light")
        vim.opt.background = "light"
        -- vim.cmd("Catppuccin latte")
      end,
    },
    init = function()
      require("auto-dark-mode").init()
    end,
  },
}
