return {
  {
    "xbase-lab/xbase",
    enabled = vim.fn.has("macunix"),
    build = "make install",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = true,
  },
}
