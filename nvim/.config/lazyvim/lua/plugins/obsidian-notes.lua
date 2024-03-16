return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",

    dependencies = {
      -- Required:
      "nvim-lua/plenary.nvim",
      -- Optionals:
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Obsidian",
        },
      },
    },
    keys = {
      { "<leader>ch", ":lua require('obsidian').util.toggle_checkbox()<CR>" },
      { "gf", ":lua require('obsidian').util.gf_passthrough()<CR>" },
    },
  },
}
