return {
  {
    "xbase-lab/xbase",
    enabled = vim.fn.has("macunix"),
    build = "make install",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim", -- optional
      "nvim-lua/plenary.nvim", -- optional/requirement of telescope.nvim
      "stevearc/dressing.nvim", -- optional (in case you don't use telescope but something else)
    },
    config = true,
  },
}
