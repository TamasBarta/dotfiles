return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.sourcekit = {}
    end,
  },
}
