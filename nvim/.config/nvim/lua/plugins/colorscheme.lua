return {
  {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    name = "catppuccin",
    opts = {
      integrations = {
        neotree = true,
        cmp = true,
        notify = true,
        noice = true,
        mason = true,
        which_key = true,
        telescope = true,
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
}
